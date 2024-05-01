import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: WelcomePage(),
  ));
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeee5ef),
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff2a0062), Color(0xff520062)]),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        title: const Text('Welcome to Your Account',
            style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xff158282),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Account Balance',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '\$100',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add functionality for balance icon
                          },
                          child: const Icon(
                            Icons.account_balance,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _TransactionBox(
                        title: 'Credit',
                        icon: Icons.add_circle,
                        color: Colors.green,
                        onTap: () {
                          // Add functionality for Credit button
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _TransactionBox(
                        title: 'Debit',
                        icon: Icons.remove_circle,
                        color: Colors.red,
                        onTap: () {
                          // Add functionality for Credit button
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _TransactionBox(
                        title: 'Transfer Money',
                        icon: Icons.compare_arrows,
                        color: Colors.blue,
                        onTap: () {
                          // Add functionality for Credit button
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for Recent Transaction History button
                    },
                    child: Text('Recent Transaction History'),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for Update KYC Document button
                    },
                    child: Text('Update KYC Document'),
                  ),
                ],
              ),
              SizedBox(height: 90),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: () {
                      // Add functionality for Locate Us button
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () {
                      // Add functionality for Enquiry button
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.help),
                    onPressed: () {
                      // Add functionality for Help button
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.support),
                    onPressed: () {
                      // Add functionality for Support button
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.local_offer),
                    onPressed: () {
                      // Add functionality for Offer button
                    },
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransactionBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _TransactionBox({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
