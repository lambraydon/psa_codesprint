import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../views/applicants_view/api_constants.dart';
import '../views/applicants_view/applicant_evaluation_model.dart';


class GPTApiService {
  final http.Client httpClient;

  GPTApiService({required this.httpClient});

  Future<RecommenderModel> sendMessage(
      {required String message, required String modelId}) async {
    try {
      String newMessage = "$message\n$CONDITION";
      var response = await httpClient.post(
        Uri.parse("$BASE_URL/completions"),
        headers: {
          'Authorization': 'Bearer $API_KEY',
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "temperature": 0.2,
            "messages": [
              {
                "role": "system",
                "content": PROMPT,
              },
              {"role": "user", "content": newMessage},
            ],
            "model": modelId,
            "max_tokens": 2000,
          },
        ),
      );


      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }

      if (jsonResponse["choices"].length > 0) {
        log(
            "jsonResponse[choices]text ${jsonResponse['choices'][0]['message']['content']}");
      }

      Map output = jsonDecode(jsonResponse['choices'][0]['message']['content']);
      return RecommenderModel.fromJson(output);
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }


}

// void main() async {
//   final httpClient = http.Client();
//   final gptApiService = GPTApiService(httpClient: httpClient);
//
//   try {
//     // Example usage:
//     print("hello");
//     final response = await gptApiService.sendMessage(
//         message: '''
//         Resume: I am a 21 year old experienced in html,css and python. I graduated with second class honours from NUS computer science in 2022
//
//         Job applied: Software Engineer at FaceBook
// ''',
//
//         modelId: "gpt-3.5-turbo"
//     );
//
//     // Handle the response as needed.
//     print('Received response: $response');
//     print(response.description);
//   } catch (error) {
//     // Handle errors.
//     print('Error: $error');
//   } finally {
//     // Make sure to close the HttpClient when done.
//     httpClient.close();
//   }
// }
