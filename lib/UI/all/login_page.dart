import 'package:animate_do/animate_do.dart';
import 'package:egov/UI/all/forgotten_password_page.dart';
import 'package:egov/UI/all/screen_controller_page.dart';
import 'package:egov/UI/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  bool showpassword = false;
  bool securepassword = true;
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                      "images/book.png",
                      height: 0.15 * height,
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("Sign in",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 20.0, top: 20.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Row(
                            children: [
                              const ImageIcon(AssetImage("images/email.png")),
                              const SizedBox(width: 15),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (email.text.isEmail == false) {
                                      return "Invalid Email";
                                    }
                                    if (value!.isEmpty) {
                                      return "Required";
                                    }
                                    return null;
                                  },
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                  controller: email,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 35.0),
                      child: Container(
                        height: 0.055 * height,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ]),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Row(
                            children: [
                              const ImageIcon(
                                  AssetImage("images/password.png")),
                              const SizedBox(width: 15),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required";
                                    }
                                    return null;
                                  },
                                  obscureText: securepassword,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                  controller: password,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                              const SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  if (showpassword == false) {
                                    setState(() {
                                      showpassword = true;
                                      securepassword = false;
                                    });
                                  } else {
                                    if (showpassword == true) {
                                      setState(() {
                                        showpassword = false;
                                        securepassword = true;
                                      });
                                    }
                                  }
                                },
                                child: ImageIcon(AssetImage(showpassword == true
                                    ? "images/openeye.png"
                                    : "images/closeeye.png")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: InkWell(
                      onTap: () {
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
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email.text.trim(),
                                    password: password.text.trim())
                                .then((value) {
                              setState(() {
                                loading = false;
                              });

                              Get.offAll(() => const ScreenControllerPage());
                            });
                          } catch (e) {
                            setState(() {
                              loading = false;
                            });
                            Get.snackbar("", "",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                messageText: Text(
                                  "Try again",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ));
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Container(
                            height: 0.055 * height,
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 7,
                                      offset: Offset(1, 2))
                                ]),
                            alignment: Alignment.center,
                            child: loading == true
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ))
                                : Text("Sign in",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500))),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => const ForgottenPasswordPage());
                            },
                            child: Text("Forgot password",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const RegisterPage());
                            },
                            child: Text("Create a new account",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    color: Colors.deepPurple,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
