import 'package:flutter/material.dart';
import 'package:myfinance/styles.dart';
import 'package:typewritertext/typewritertext.dart';

class PageHomepage extends StatelessWidget {
  const PageHomepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.outlineElement),
                  ),
                  color: Color.fromARGB(255, 17, 17, 29),
                ),
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Tugas 1",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),

              // Container(
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(color: Color.fromARGB(255, 37, 37, 58)),
              //     ),
              //     color: Color.fromARGB(255, 24, 24, 32),
              //   ),
              //   height: 50,
              //   padding: EdgeInsets.symmetric(horizontal: 30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //     ],
              //   ),
              // ),
              Padding(
                // Container
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 203, 31),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                    border: Border.all(color: Color.fromARGB(255, 37, 37, 58)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // ubah ke start
                    children: [
                      // TypeWriter.text(
                      //   'lorem ipsum dolot sit amet ...',
                      //   duration: const Duration(milliseconds: 50),
                      // ),
                      Text(
                        "Halo!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                        // duration: const Duration(milliseconds: 90),
                      ),
                      Text(
                        "Klik tombol di bawah ini untuk melihat halaman pembuat.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/team');
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ), // rounded
                            ),
                          ),
                          child: Text(
                            "Klik Aku!",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fitur",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 110),
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLayout,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        onTap: () {
                          Navigator.pushNamed(context, '/ganjilgenap');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.onetwothree,
                                    color: Colors.white,
                                    size: 50,
                                  ), // Icon
                                ],
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ganjil atau Genap?",
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 110),
                  child: Material(
                    color: Colors.transparent, // biar ripple bisa muncul
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                          255,
                          17,
                          17,
                          29,
                        ), // background kotak
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.pushNamed(context, '/kalkulator');
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calculate,
                                color: Colors.white,
                                size: 50,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kalkulator",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        // Navbar
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 20,
        ), // biar ada jarak dari tepi
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 24, 24, 32),
            borderRadius: BorderRadius.circular(50), // rounded
            border: Border.all(color: const Color.fromARGB(137, 37, 37, 58)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
