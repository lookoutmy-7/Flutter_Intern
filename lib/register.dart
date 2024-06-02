import 'package:flutter/material.dart';

import 'login.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          CustomPaint(
            painter: CurvePainter(),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 59),
                Text(
                  'Create\nAccount',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      style: TextStyle(color: textColor),
                                      decoration: InputDecoration(
                                        hintText: "Name",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      style: TextStyle(color: textColor),
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      style: TextStyle(color: textColor),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 27,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Color(0xff4c505b),
                                          child: IconButton(
                                            color: Colors.white,
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.arrow_forward,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, 'login');
                                          },
                                          child: Text(
                                            'Sign In',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              color: textColor,
                                              fontSize: 18,
                                            ),
                                          ),
                                          style: ButtonStyle(),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
