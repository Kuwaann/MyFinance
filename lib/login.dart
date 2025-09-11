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
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.outlineElement),
        ),
        backgroundColor: AppColors.backgroundLayout,
        toolbarHeight: 100,
        title: Text(
          'السلام عليكم',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.backgroundLogin, AppColors.backgroundLogin],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(26, 40, 26, 26),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Card(
                color: const Color.fromARGB(255, 17, 17, 29),
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
                      Center(
                        child: Image.asset(
                          'assets/images/kairi.png',
                          height: 300,
                          width: 600,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Login Details 😉',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 24.9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Masuk untuk melanjutkan ke MyFinance',
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
                        label: 'Password',
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 48,
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
                                const SnackBar(
                                  content: Text('Email atau password salah'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.button,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'atau',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 17.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
