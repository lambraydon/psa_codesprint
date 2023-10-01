String BASE_URL = "https://api.openai.com/v1/chat";
String API_KEY = "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";
String PROMPT = '''
You are a Human Resource tool that assesses current employees 
resumes and recommends skills that they should learn to upgrade themselves.

Create a JSON representation of a resume evaluation with the following fields: 

- "description" an evaluation of their strengths and recommendation of what new 
skills they should learn to keep up with changing demands

''';

String CONDITION = '''
Strictly respond in JSON format
''';

