import 'package:flutter/material.dart';
import 'api/pdf_api.dart';
import 'api/pdf_paragraph_api.dart';
import 'button_widget.dart';
import 'main.dart';

class saveFile extends StatefulWidget {
  @override
  _saveFileState createState() => _saveFileState();
}

class _saveFileState extends State<saveFile> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('title'),
      centerTitle: true,
    ),
    body: Container(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonWidget(
              text: 'Simple PDF',
              onClicked: () async {
                final pdfFile =
                await PdfApi.generateCenteredText('Sample Text');

                PdfApi.openFile(pdfFile);
              },
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Paragraphs PDF',
              onClicked: () async {
                final pdfFile = await PdfParagraphApi.generate();

                PdfApi.openFile(pdfFile);
              },
            ),
          ],
        ),
      ),
    ),
  );
}