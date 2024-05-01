import 'package:bank_application/Views/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:bank_application/Services/userregister.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  UserRegister sevice = UserRegister();

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
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 40.0),
                      const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create your account",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            hintText: "Username",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                    BorderSide(color: Color(0xff5d0168))),
                            fillColor: Color(0xffeee5ef),
                            filled: true,
                            prefixIcon: const Icon(Icons.person)),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                    BorderSide(color: Color(0xff5d0168))),
                            fillColor: Color(0xffeee5ef),
                            filled: true,
                            prefixIcon: const Icon(Icons.email)),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(color: Color(0xff5d0168))),
                          fillColor: Color(0xffeee5ef),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: confirmpasswordController,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(color: Color(0xff5d0168))),
                          fillColor: Color(0xffeee5ef),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 13, left: 3),
                      child: ElevatedButton(
                        onPressed: () {
                          print('${usernameController.text}');
                          print('${emailController.text}');
                          print('${passwordController.text}');
                          print('${confirmpasswordController.text}');

                          sevice.userRegister(
                              usernameController.text,
                              emailController.text,
                              passwordController.text,
                              confirmpasswordController.text);
                        },
                        child: const Text(
                          "Sign up",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xffffffff)),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Color(0xff490452),
                          minimumSize: Size(double.infinity, 0),
                        ),
                      )),
                  const Center(child: Text("Or")),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Google.png'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 18),
                          const Text(
                            "Sign In with Google",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Color(0xffff0000)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
