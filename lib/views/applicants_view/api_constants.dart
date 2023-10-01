String BASE_URL = "https://api.openai.com/v1/chat";
String API_KEY = "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";
String PROMPT = '''

Create a JSON representation of a resume evaluation with the following fields: 

- "description" for an evaluation description covering strengths and weaknesses
- "impact score" to rate the resume's impact (out of 30).
- "competency score" to assess the candidate's competency (out of 40).
- "experience score" to gauge the candidate's experience (out of 30).
- "score" to determine the overall quality (out of 100), which is the sum of the three scores mentioned above.

''';

String CONDITION = '''
Strictly respond in JSON format
''';

