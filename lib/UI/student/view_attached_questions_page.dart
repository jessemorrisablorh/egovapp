import 'package:animate_do/animate_do.dart';
import 'package:egov/UI/student/student_answer_limit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewAttachedQuestionsPage extends StatefulWidget {
  const ViewAttachedQuestionsPage({super.key});

  @override
  State<ViewAttachedQuestionsPage> createState() =>
      _ViewAttachedQuestionsPageState();
}

class _ViewAttachedQuestionsPageState extends State<ViewAttachedQuestionsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "With attached questions",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: FadeInUp(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: ListView(
            children: [
              const SizedBox(height: 30.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Definition and Scope",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "1. What is Agricultural Economics primarily concerned with",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "B. Applying economic principles to agricultur",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.check,
                        size: 21,
                        color: Colors.green,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Demand and Supply in Agriculture",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "2. Which of the following is a factor affecting the demand for agricultural products?",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {},
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "B. Taste and preferences",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.check,
                          size: 21,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Market Structures in Agriculture",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "3. Which market structure is characterised by many buyers and sellers trading identical products?",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {},
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "B. Perfect Competition",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Farm Records and Budgeting",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "4. Which of the following is NOT a type of farm record?",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {},
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "D. Weather record",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.check,
                          size: 21,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Agricultural Marketing",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "5. What is a key benefit of cooperatives in agricultural marketing?",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {},
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "B. Reduction of middlemen in the supply chain",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Agricultural Policies",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "6. What is the primary purpose of subsidies in agriculture?",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "B. To support farmers by reducing production costs",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.check,
                        size: 21,
                        color: Colors.green,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const StudentAnswerLimitPage());
                      },
                      child: Container(
                          width: width,
                          height: 0.055 * height,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 7,
                                    offset: Offset(1, 2))
                              ]),
                          alignment: Alignment.center,
                          child: Text("Next",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
