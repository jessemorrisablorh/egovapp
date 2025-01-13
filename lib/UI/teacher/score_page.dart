import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherScorePage extends StatefulWidget {
  const TeacherScorePage({super.key});

  @override
  State<TeacherScorePage> createState() => _TeacherScorePageState();
}

class _TeacherScorePageState extends State<TeacherScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Score",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
