String BASE_URL = "https://api.openai.com/v1/chat";
String API_KEY = "INSERT API KEY HERE";
String PROMPT = '''

Create a JSON representation of a resume evaluation with the following fields: 

- "description" for an evaluation description covering strengths and weaknesses
- "impact score" to rate the resume's impact (out of 30).
- "competency score" to assess the candidate's competency (out of 40).
- "experience score" to gauge the candidate's experience (out of 30).
- "score" to determine the overall quality (out of 100), which is the sum of the three scores mentioned above.
- "rejection email" a draft email the HR can send out to the candidate if rejected. The email should include alternative roles or advice to improve 
- "shortlist email" a draft email the HR can send out to the candidate if shortlisted.

''';

String CONDITION = '''
Strictly respond in JSON format
''';

