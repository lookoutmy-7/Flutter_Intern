import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> with WidgetsBindingObserver {
  final TextEditingController _emailController = TextEditingController(text: 'ravirajSA@gmail.com');
  // String _email = 'RavirajS@gmail.com';
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {}); // Trigger rebuild on theme change
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_emailController.text == 'ravirajSA@gmail.com' && _passwordController.text == '1234') {
        Navigator.pushNamed(context, 'dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)], // Adjust gradient colors as per your need
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
                SizedBox(height: 55),
                const Text(
                  'Welcome Back !',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                const Text(
                  'Log into your account',
                  style: TextStyle(
                    fontSize: 16,
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
                            Transform.translate(
                              offset: Offset(0, -40), // Adjust this value to move the card view up or down
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 8,
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          controller: _emailController,
                                          style: TextStyle(color: textColor),
                                          decoration: InputDecoration(
                                            hintText: "Enter the Email ID",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter email';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 20),
                                        TextFormField(
                                          controller: _passwordController,
                                          style: TextStyle(color: textColor),
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter password';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Forgot Password?',
                                              style: TextStyle(color: Colors.blue, fontSize: 14),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 50),
                                        ElevatedButton(
                                          onPressed: _login,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text(
                                            'LOGIN',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Transform.translate(
                              offset: Offset(0, -50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an Account? ",
                                    style: TextStyle(color: Colors.grey, fontSize: 18),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'register');
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                      ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var path = Path();

    double cornerRadius = 40.0; // Radius for the rounded corners

    // Start at the left side at 50% height minus the corner radius
    path.moveTo(0, size.height * 0.4 + cornerRadius);

    // Draw a curve to the bottom left corner
    path.quadraticBezierTo(0, size.height * 0.4, cornerRadius, size.height * 0.4);

    // Draw a straight line to the right side minus the corner radius
    path.lineTo(size.width - cornerRadius, size.height * 0.4);

    // Draw a curve to the bottom right corner
    path.quadraticBezierTo(size.width, size.height * 0.4, size.width, size.height * 0.4 + cornerRadius);

    // Draw a straight line to the bottom right corner
    path.lineTo(size.width, size.height);

    // Draw a straight line to the bottom left corner
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    // Draw the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
