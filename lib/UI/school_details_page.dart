import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchoolDetailsPage extends StatefulWidget {
  const SchoolDetailsPage({super.key});

  @override
  State<SchoolDetailsPage> createState() => _SchoolDetailsPageState();
}

class _SchoolDetailsPageState extends State<SchoolDetailsPage> {
  final List<String> zonals = [
    'Agaie Zone',
    'Bida Zone',
    'Kontakora Zone',
    'Minna Zone',
    'Suleja Zone',
    'New Bussa Zone'
  ];

  final List<String> minnazone = [
    'Bosso',
    'Chanchaga',
    'Paikoro',
    'Shiroro',
  ];

  final List<String> bidazone = [
    'Bida',
    'Gbako',
    'Lavun',
  ];

  final List<String> kontakorazone = [
    'Kontagora',
    'Magama',
    'Mariga',
    'Rijau',
    'Wushishi'
  ];

  final List<String> agaiezone = [
    'Agaie',
    'Lapai',
  ];

  final List<String> sulejazone = ['Gurara', 'Suleja', 'Tafa'];

  final List<String> newbussazone = [
    'Agwara',
    'Borgu',
  ];

  String? selectedzone;
  String? localgov;
  TextEditingController schoolname = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  User? user = FirebaseAuth.instance.currentUser;
  String schoolnamehint = "School name";
  String zonehint = "Select zone";
  String localgovhint = "Local Government";
  bool schoolnameerror = false;
  bool zoneerror = false;
  bool localgoverror = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInUp(
                  child: Image.asset(
                    "images/school.png",
                    height: 0.15 * height,
                  ),
                ),
                const SizedBox(height: 10.0),
                FadeInRight(
                  child: Text("Tell us about your school",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                FadeInRight(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0),
                    child: Container(
                      height: 0.055 * height,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                offset: Offset(1, 2))
                          ],
                          color: Colors.grey[100]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: TextFormField(
                          onTap: () {
                            setState(() {
                              schoolnameerror = false;
                              schoolnamehint = "School name";
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                schoolnameerror = true;
                                schoolnamehint = "Required";
                              });
                              return "Required";
                            } else {
                              if (value.length < 5) {
                                setState(() {
                                  schoolnameerror = true;
                                  schoolnamehint = "Invalid school name";
                                });
                                return "Invalid school name";
                              }
                            }
                            return null;
                          },
                          controller: schoolname,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: schoolnamehint,
                              errorStyle: GoogleFonts.poppins(
                                  fontSize: 0.01,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500),
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: schoolnameerror == true
                                      ? Colors.red
                                      : Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ),
                ),
                FadeInRight(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.grey[100]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorStyle: TextStyle(fontSize: 0.010)),
                            onTap: () {
                              setState(() {
                                zoneerror = false;
                                zonehint = "Select zone";
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  zonehint = "Required";
                                  zoneerror = true;
                                });
                                return "Required";
                              }
                              return null;
                            },
                            iconSize: 0,
                            hint: Text(
                              zonehint,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: zoneerror == true
                                    ? Colors.red
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: selectedzone,
                            items: zonals.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedzone = newValue;
                              });
                            },
                          ),
                        ),
                      )),
                ),
                FadeInRight(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.grey[100]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorStyle: TextStyle(fontSize: 0.010)),
                            onTap: () {
                              setState(() {
                                localgoverror = false;
                                localgovhint = "Local Government";
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  localgovhint = "Required";
                                  localgoverror = true;
                                });
                                return "Required";
                              }
                              return null;
                            },
                            iconSize: 0,
                            hint: Text(
                              localgovhint,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: localgoverror == true
                                    ? Colors.red
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: localgov,
                            items: selectedzone == "Agaie Zone"
                                ? agaiezone.map((String agaieitem) {
                                    return DropdownMenuItem<String>(
                                      value: agaieitem,
                                      child: Text(
                                        agaieitem,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList()
                                : selectedzone == "Bida Zone"
                                    ? bidazone.map((String item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      }).toList()
                                    : selectedzone == "Kontakora Zone"
                                        ? kontakorazone.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                          }).toList()
                                        : selectedzone == "Minna Zone"
                                            ? minnazone.map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                );
                                              }).toList()
                                            : selectedzone == "Suleja Zone"
                                                ? sulejazone.map((String item) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList()
                                                : selectedzone ==
                                                        "New Bussa Zone"
                                                    ? newbussazone
                                                        .map((String item) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        );
                                                      }).toList()
                                                    : zonals.map((String item) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                localgov = newValue;
                              });
                            },
                          ),
                        ),
                      )),
                ),
                FadeInRight(
                  child: InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        if (loading == false) {
                          setState(() {
                            loading = true;
                          });
                        } else {
                          if (loading == true) {
                            setState(() {
                              loading = false;
                            });
                          }
                        }
                        try {
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .update({
                            "schooldetails": true,
                            "schoolname": schoolname.text.trim(),
                            "schoolzone": selectedzone,
                            "localgovernment": localgov
                          }).then((value) {
                            setState(() {
                              loading = false;
                            });
                          });
                        } catch (e) {
                          setState(() {
                            loading = false;
                          });
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 20.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ],
                            color: Colors.deepPurple),
                        alignment: Alignment.center,
                        child: loading == true
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 3),
                              )
                            : Text(
                                "Continue",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
