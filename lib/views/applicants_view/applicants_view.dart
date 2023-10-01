import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:psa_codesprint/applicant_fit_score.dart';
import 'package:psa_codesprint/views/applicants_view/applicant_evaluation_model.dart';

import '../../services/gpt_api_service.dart';
import 'package:http/http.dart' as http;

class ApplicantsView extends StatefulWidget {
  const ApplicantsView({Key? key}) : super(key: key);

  @override
  State<ApplicantsView> createState() => _ApplicantsViewState();
}

class _ApplicantsViewState extends State<ApplicantsView> {
  TextEditingController inputController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isLoading = false;
  bool _showNewWidget = false;
  bool _showApplicantScore = false;

  // Textstyles
  FontWeight weight = FontWeight.normal;
  double size = 16;
  Color filled = Colors.white;
  Color text = Colors.black;

  // HintText
  String hintText =
      'Recommend me a one hour long workout targeting the back, shoulders and triceps';

  RecommenderModel model = RecommenderModel(
      totalScore: 0,
      impactScore: 0,
      competencyScore: 0,
      experienceScore: 0,
      description: "Oops an error occured, please try again");

  String description = "Oops an error occured, please try again";

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void changeTheme() {
    weight = FontWeight.bold;
    size = 15;
    filled = Colors.lightBlueAccent;
    text = Colors.blue.shade800;
  }

  void _onGenerateAssessmentPressed() async {
    setState(() {
      _focusNode.unfocus();

      if (inputController.text.isEmpty) {
        inputController.text = hintText;
      }
      changeTheme();
      _isLoading = true;
    });


    // API call to GPT model
    try {
      model = await GPTApiService(httpClient: http.Client())
          .sendMessage(message: inputController.text, modelId: "gpt-3.5-turbo");
      log(model.description);
    } catch (error) {
      log("reached here error");
      log(error.toString());
    }

    setState(() {
      description = model.description;
      _isLoading = false;
      _showNewWidget = true;
      log("reached");
    });
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        body: ListView(children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    maxLength: 400,
                    controller: inputController,
                    focusNode: _focusNode,
                    style: TextStyle(
                        fontSize: size, fontWeight: weight, color: text),
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: filled,
                      filled: true,
                      hintMaxLines: 6,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.all(15.0),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Visibility(
                  visible: !_isLoading && !_showNewWidget,
                  child: TextButton(
                    onPressed: _onGenerateAssessmentPressed,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Generate Assessment",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                if (_isLoading)
                  const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                AnimatedOpacity(
                  opacity: _showNewWidget ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                  child: _showNewWidget
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AnimatedTextKit(
                                          isRepeatingAnimation: false,
                                          repeatForever: false,
                                          animatedTexts: [
                                            TyperAnimatedText(
                                                description,
                                                speed: const Duration(milliseconds: 10),
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15)),
                                          ],
                                          onFinished: () {
                                            setState(() {
                                              _showApplicantScore = true;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AnimatedOpacity(
                                        opacity: _showApplicantScore ? 1.0 : 0.0,
                                        duration:
                                            const Duration(milliseconds: 800),
                                        curve: Curves.easeIn,
                                        child: _showApplicantScore
                                            ? ApplicantFitScore(model.totalScore)
                                            : const SizedBox.shrink(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
