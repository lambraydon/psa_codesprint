import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:psa_codesprint/views/applicants_view/applicant_fit_score.dart';
import 'package:psa_codesprint/custom_text_button.dart';
import 'package:psa_codesprint/services/PDFUtil/pdfuploader.dart';
import 'package:psa_codesprint/views/applicants_view/applicant_evaluation_model.dart';
import 'package:psa_codesprint/widgets/constants.dart';
import "package:syncfusion_flutter_pdf/pdf.dart";
import '../../services/gpt_api_service.dart';
import 'package:dotted_border/dotted_border.dart';
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
  String hintText = 'Input resume text';

  RecommenderModel model = RecommenderModel(
    totalScore: 0,
    impactScore: 0,
    competencyScore: 0,
    experienceScore: 0,
    description: "Oops an error occurred, please try again",
    rejection: "Oops an error occurred, please try again",
    shortlist: "Oops an error occurred, please try again",
  );

  String description = "Oops an error occurred, please try again";

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  Future<List<int>> _readDocumentData() async {
    final ByteData data = await rootBundle.load('assets/sampleResume.pdf');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> _extractText() async {
    // Load an existing PDF document.
    PdfDocument document = PdfDocument(inputBytes: await _readDocumentData());
    // Create a new instance of the PdfTextExtractor.
    PdfTextExtractor extractor = PdfTextExtractor(document);
    // Extract all the text from the document.
    String text = extractor.extractText();
    // Display the text.
    inputController.text = text;
  }

  void changeTheme() {
    weight = FontWeight.bold;
    size = 15;
    filled = Colors.greenAccent;
    text = Colors.black;
  }

  void _onGenerateAssessmentPressed() async {
    setState(() {
      _focusNode.unfocus();

      if (inputController.text.isEmpty) {
        _readDocumentData();
        _extractText();
      }
      changeTheme();
      _isLoading = true;
    });

    // API call to GPT model
    try {
      String message =
          "resume: ${inputController.text}\njob application description: Software Engineer at Port Singapore Authority";
      model = await GPTApiService(httpClient: http.Client())
          .sendMessage(message: message, modelId: "gpt-3.5-turbo");
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

  void _copyRejectionToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Rejection email draft copied to clipboard',
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 50,
              left: 10,
              right: 10),
        ),
      );
    });
  }

  void _copyShortlistToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Shortlist email draft copied to clipboard',
            style: TextStyle(fontSize: 20.0),
          ),
          backgroundColor: Colors.greenAccent,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 50,
              left: 10,
              right: 10),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                DottedBorder(
                  color: Colors.lightBlueAccent,
                  strokeWidth: 1,
                  radius: Radius.circular(16),
                  child: Container(
                    height: 200,
                    width: 500,
                    child: pdfuploader(),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "Job Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: inputController,
                          focusNode: _focusNode,
                          style: TextStyle(
                            fontSize: size,
                            fontWeight: weight,
                            color: text,
                          ),
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: !_isLoading && !_showNewWidget,
              child: TextButton(
                onPressed: _onGenerateAssessmentPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: primaryColor,
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
              const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          speed:
                                              const Duration(milliseconds: 10),
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
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
                                  child: Column(
                                    children: [
                                      AnimatedOpacity(
                                        opacity:
                                            _showApplicantScore ? 1.0 : 0.0,
                                        duration:
                                            const Duration(milliseconds: 800),
                                        curve: Curves.easeIn,
                                        child: _showApplicantScore
                                            ? ApplicantFitScore(
                                                model.totalScore,
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                      Row(
                                        children: [
                                          AnimatedOpacity(
                                            opacity:
                                                _showApplicantScore ? 1.0 : 0.0,
                                            duration: const Duration(
                                                milliseconds: 800),
                                            curve: Curves.easeIn,
                                            child: _showApplicantScore
                                                ? CustomTextButton(
                                                    onPressed: () {
                                                      _copyRejectionToClipboard(
                                                        model.rejection,
                                                      );
                                                    },
                                                    buttonText: "Reject",
                                                    color: Colors.red,
                                                  )
                                                : const SizedBox.shrink(),
                                          ),
                                          AnimatedOpacity(
                                            opacity:
                                                _showApplicantScore ? 1.0 : 0.0,
                                            duration: const Duration(
                                                milliseconds: 800),
                                            curve: Curves.easeIn,
                                            child: _showApplicantScore
                                                ? CustomTextButton(
                                                    onPressed: () {
                                                      _copyShortlistToClipboard(
                                                        model.shortlist,
                                                      );
                                                    },
                                                    buttonText: "Shortlist",
                                                    color: Colors.green,
                                                  )
                                                : const SizedBox.shrink(),
                                          ),
                                        ],
                                      ),
                                    ],
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
    );
  }
}
