import 'package:bank_application/Services/cashdeposite.dart';
import 'package:flutter/material.dart';

class CashDeposite extends StatefulWidget {
  const CashDeposite({super.key});

  @override
  State<CashDeposite> createState() => _CashDepositeState();
}

class _CashDepositeState extends State<CashDeposite> {
  TextEditingController accountIdController = TextEditingController();
  TextEditingController transactionAmountController = TextEditingController();

  cashdeposite sevice = cashdeposite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cash Deposite'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text('Account Id'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: accountIdController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Account Id',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Amount'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: transactionAmountController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Amount',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      // print('${accountIdController.text}');
                      // print('${transactionAmountController.text}');

                      await sevice.cashDeposite(
                          int.parse(accountIdController.text),
                          double.parse(transactionAmountController.text));

                      showAlertDialog(context, "Amount Credited Successfully");
                    } catch (e) {
                      print("Error: $e");
                      showAlertDialog(context, "Failed to credit amount: $e");
                    }
                  },
                  child: const Text(
                    'Credit',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String info) {
    // set up the buttons
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => Transaction(),
        //     ));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title:
          const Text("Amount Has Been Credited Successfully to your Account"),
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
