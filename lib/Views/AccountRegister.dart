import 'package:bank_application/Services/createaccount.dart';
import 'package:bank_application/Views/WelcomePage.dart';
import 'package:flutter/material.dart';

class AccountRegister extends StatefulWidget {
  const AccountRegister({super.key});

  @override
  State<AccountRegister> createState() => _AccountRegisterState();
}

class _AccountRegisterState extends State<AccountRegister> {
  //create the controllers
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  createaccount service = createaccount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeee5ef),
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff2a0062), Color(0xff520062)]),
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          title: const Text('Open Your Account',
              style: TextStyle(color: Colors.white)),
        ),
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                const Text(
                                  'Account Holder Name',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: accountHolderNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    hintText: 'Enter Your Account Holder Name',
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Mobile Number',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: mobileNumberController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    hintText: 'Enter Your Mobile Number',
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Address',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    hintText: 'Enter Your Address',
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // print('${accountNoController.text}');
                                    print(
                                        '${accountHolderNameController.text}');
                                    // print('${iFSCCodeController.text}');
                                    print('${mobileNumberController.text}');
                                    print('${addressController.text}');
                                    // print('${currentBalanceController.text}');

                                    service.createAccount(
                                        accountHolderNameController.text,
                                        mobileNumberController.text,
                                        addressController.text);

                                    showAlertDialog(context, "Alert Box");
                                  },
                                  child: const Text(
                                    'Create Account',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xffffffff)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    backgroundColor: Color(0xff490452),
                                    minimumSize: Size(double.infinity, 0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]))))));
  }

  showAlertDialog(BuildContext context, String info) {
    // set up the buttons
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomePage(),
            ));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Account Created Successfully"),
      content: Text(
        info,
        style: const TextStyle(color: Colors.green),
      ),
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
