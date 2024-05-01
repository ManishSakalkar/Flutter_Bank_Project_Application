import 'package:bank_application/Services/cashwithdraw.dart';
import 'package:flutter/material.dart';

class CashWithdraw extends StatefulWidget {
  const CashWithdraw({super.key});

  @override
  State<CashWithdraw> createState() => _CashWithdrawState();
}

class _CashWithdrawState extends State<CashWithdraw> {
  TextEditingController accountIdController = TextEditingController();
  TextEditingController transactionAmountController = TextEditingController();

  cashwithdraw service = cashwithdraw();

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
        title:
            const Text('Cash Withdraw', style: TextStyle(color: Colors.white)),
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
                      print('${accountIdController.text}');
                      print('${transactionAmountController.text}');

                      int accountId = accountIdController.hashCode;
                      double transactionAmount =
                          double.parse(transactionAmountController.text);

                      await service.cashWithdraw(accountId, transactionAmount);

                      showAlertDialog(context, "Amount Debited Successfully");
                    } catch (e) {
                      print("Error: $e");
                      showAlertDialog(context, "Failed to debit amount: $e");
                    }
                  },
                  child: const Text(
                    'Debit',
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
      title: const Text("Amount Has Been Debited Successfully to your Account"),
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
