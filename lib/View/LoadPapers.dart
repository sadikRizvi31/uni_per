import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_per/Utils/AppColor.dart';

class LoadPapers extends StatefulWidget {
  const LoadPapers({Key? key}) : super(key: key);

  @override
  State<LoadPapers> createState() => _LoadPapersState();
}

class _LoadPapersState extends State<LoadPapers> {
  final style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.west_sharp),
          title: Text('<PDFs of the context selected>'),
          actions: [
            Icon(Icons.more_vert),
          ],
          backgroundColor: AppColor.primarySwatchColor,
          titleTextStyle: GoogleFonts.anekLatin(textStyle: style,fontSize: 20),
        ),
        body: Container(),
      ),
    );
  }
}
