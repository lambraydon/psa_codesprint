import spacy
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity
from data.sampledata import resumes, job_roles 
# Load Spacy's pre-trained model
nlp = spacy.load('en_core_web_md')

class ImprovedJobRecommender:
    def __init__(self, resumes, job_roles):
        self.skills = ['python', 'excel', 'machine learning', 'data analysis']
        self.original_data = resumes + job_roles  # Keep the original data intact
        self.data = [self.extract_skills(text) for text in self.original_data]
        self.vectors = [nlp(text).vector for text in self.data]
        
    def extract_skills(self, text):
        # Extract skills from text based on predefined list
        extracted_skills = [skill for skill in self.skills if skill in text.lower()]
        return ' '.join(extracted_skills)
        
    def recommend(self, resume_idx, top_n=4, feedback=None):
        resume_vector = self.vectors[resume_idx].reshape(1, -1)
        cosine_similarities = cosine_similarity(resume_vector, self.vectors)
        recommendations = cosine_similarities[0].argsort()[:-top_n-1:-1]
        
        # Basic feedback loop to refine recommendations based on user feedback
        if feedback:
            for job in feedback['liked']:
                job_idx = self.original_data.index(job)  # Use the original data for feedback
                cosine_similarities[0][job_idx] += 0.1  # Increase similarity
            for job in feedback['disliked']:
                job_idx = self.original_data.index(job)  # Use the original data for feedback
                cosine_similarities[0][job_idx] -= 0.1  # Decrease similarity
            recommendations = cosine_similarities[0].argsort()[:-top_n-1:-1]
        
        return [self.original_data[i] for i in recommendations if i >= len(resumes)]
        

# Instantiate the recommender and test
recommender = ImprovedJobRecommender(resumes, job_roles)
print(recommender.recommend(0))

# Mock feedback for further refinement
feedback = {
    'liked': ['Machine Learning Engineer', 'Data Scientist'],
    'disliked': ['Excel Specialist']
}

print(recommender.recommend(0, feedback=feedback))