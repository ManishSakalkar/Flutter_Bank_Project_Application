import 'package:flutter/material.dart';
import 'package:bank_application/Services/login.dart';
import 'package:bank_application/Views/AccountRegister.dart';
import 'package:bank_application/Views/ForgotPassword.dart';
import 'package:bank_application/Components/my_textfield.dart';
import 'package:bank_application/Components/my_button.dart';
import 'package:bank_application/Components/square_tile.dart';
import 'package:bank_application/Views/SignupPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Login service = Login();

  void signUserIn() async {
    print('${usernameController.text}');
    print('${passwordController.text}');

    var response = await service.login(
      usernameController.text,
      passwordController.text,
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccountRegister(),
        ),
      );
    } else {
      showAlertDialog(context, "You are not registered. Please register.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeee5ef),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  // const Icon(
                  //   Icons.lock,
                  //   size: 100,
                  // ),

                  Image.asset(
                    'assets/images/yonobw_logo.png',
                    height: 100,
                    width: 200,
                  ),

                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 15),

                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: true,
                  ),

                  const SizedBox(height: 15),

                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  MyButton(
                    onTap: signUserIn,
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SquareTile(imagePath: 'assets/images/google_logo.png'),
                      SizedBox(width: 25),
                      SquareTile(imagePath: 'assets/images/apple_logo.png')
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String message) {
    // set up the button
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("OK"),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
