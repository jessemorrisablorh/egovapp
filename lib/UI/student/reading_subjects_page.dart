import 'package:egov/UI/all/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadingSubjectsPage extends StatefulWidget {
  final String? subject;
  const ReadingSubjectsPage({super.key, @required this.subject});

  @override
  State<ReadingSubjectsPage> createState() => _ReadingSubjectsPageState();
}

class _ReadingSubjectsPageState extends State<ReadingSubjectsPage> {
  @override
  Widget build(BuildContext context) {
    return widget.subject != "Agricultural Science"
        ? const DemoPage()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                widget.subject.toString(),
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: ListView(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 30.0),
                    child: Text(
                      "General Agriculture",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Meaning, importance, and scope of agriculture",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Agricultural systems (subsistence, commercial, etc.).",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Factors influencing agricultural production in Nigeria.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Soil Science",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Soil composition, types, and properties.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Soil formation, conservation, and fertility management.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Methods of soil erosion control.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Crop Production",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Classification and uses of crops (cereals, legumes, tubers, vegetables, etc.).",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Crop farming systems, practices, and rotation.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Pest and disease identification, management, and control.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Animal Production",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Types and classification of farm animals (ruminants, non-ruminants).",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Breeding methods and livestock management practices.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Animal diseases, prevention, and treatment.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Forestry and Wildlife",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Importance of forests and wildlife conservation.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Agroforestry and management practices.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Effects of deforestation.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Fisheries",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Aquaculture techniques and fish farming.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Management of water bodies for fishing.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Preservation and processing of fish products.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Agricultural Economics",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Principles of demand and supply in agriculture.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Agricultural marketing and cooperatives.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Importance of agricultural financing.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Farm Mechanization",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Tools and machinery for agricultural production.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Maintenance and operations of farm machinery.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Environmental Impact of Agriculture",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0),
                    child: Text(
                      "Effects of agricultural activities on the environment.",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const DemoPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 15.0, right: 15.0, bottom: 20.0),
                    child: Text(
                      "Sustainable agricultural practices. This syllabus is designed to equip students with theoretical and practical knowledge to excel in both exams and agricultural practices. For further details and a downloadable version of the syllabus",
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
