import 'package:flutter/material.dart';
import 'package:myfinance/styles.dart';
import 'package:myfinance/widget/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLogin,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.backgroundLogin, Color.fromARGB(255, 30, 30, 59)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(26, 40, 26, 26),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(),
                child: Card(
                  color: AppColors.backgroundLayout,
                  elevation: 10,
                  shadowColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: AppColors.outlineElement,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Masuk',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 24.9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Masuk untuk melanjutkan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextfield(
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          label: 'Email',
                          hint: 'tugasPAM@upnyk.ac.id',
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 16),
                        CustomTextfield(
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          label: 'Kata Sandi',
                          hint: 'T1',
                          isObscure: isObscure,
                          hasSuffixIcon: true,
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          prefixIcon: Icons.lock_outline,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [Colors.purpleAccent, Colors.blueAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.5),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              final email = emailController.text.trim();
                              final password = passwordController.text;
                              const validEmail = 'tugasPAM@upnyk.ac.id';
                              const validPassword = '1';
                              if (email == validEmail &&
                                  password == validPassword) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/homepage',
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Email atau password salah',
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.red.withOpacity(0.9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
