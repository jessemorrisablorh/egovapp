import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov/UI/school_details_page.dart';
import 'package:egov/UI/student/home_page.dart';
import 'package:egov/UI/student/students_details_page.dart';
import 'package:egov/UI/teacher/home_page.dart';
import 'package:egov/Widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../principal/home_page.dart';

class ScreenControllerPage extends StatefulWidget {
  const ScreenControllerPage({super.key});

  @override
  State<ScreenControllerPage> createState() => _ScreenControllerPageState();
}

class _ScreenControllerPageState extends State<ScreenControllerPage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(user?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoadingPage();
          }
          if (snapshot.data?["schooldetails"] == false &&
              snapshot.data?["role"] == "student") {
            return const SchoolDetailsPage();
          }
          if (snapshot.data?["studentdetails"] == false &&
              snapshot.data?["role"] == "student") {
            return const StudentsDetailsPage();
          }
          if (snapshot.data?["role"] == "teacher") {
            return const TeachersHomePage();
          }
          if (snapshot.data?["role"] == "student") {
            return const StudentHomePage();
          }
          if (snapshot.data?["role"] == "principal") {
            return const AdminHomePage();
          }
          if (snapshot.data?["role"] == "governor") {
            return const AdminHomePage();
          }
          if (snapshot.data?["role"] == "zonaldirector") {
            return const AdminHomePage();
          }
          if (snapshot.data?["role"] == "admin") {
            return const AdminHomePage();
          }
          return const LoadingPage();
        });
  }
}
