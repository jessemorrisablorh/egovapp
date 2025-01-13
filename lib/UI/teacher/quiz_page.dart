import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherQuizPage extends StatefulWidget {
  const TeacherQuizPage({super.key});

  @override
  State<TeacherQuizPage> createState() => _TeacherQuizPageState();
}

class _TeacherQuizPageState extends State<TeacherQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Quiz",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
