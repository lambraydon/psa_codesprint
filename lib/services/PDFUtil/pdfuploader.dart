import 'dart:html' as html;
import 'package:flutter/material.dart';

class pdfuploader extends StatefulWidget {
  pdfuploader({Key? key}) : super(key: key);

  @override
  State<pdfuploader> createState() => _pdfuploader();
}

class _pdfuploader extends State<pdfuploader> {
  html.File? _pdfFile;

  void _startFilePicker() {
    final input = html.FileUploadInputElement()..accept = 'application/pdf';
    input.click();

    input.onChange.listen((event) {
      final file = input.files!.first;
      setState(() {
        _pdfFile = file;
      });
      // Do something with the file (e.g., upload it, read its content, etc.)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _startFilePicker,
              child: Text('Choose PDF'),
            ),
            SizedBox(height: 20),
            if (_pdfFile != null)
              Text('Selected file: ${_pdfFile!.name}')
          ],
        ),
    );
  }
}
