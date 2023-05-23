import 'package:flutter/material.dart';

class UsersFinePay extends StatelessWidget {
  List<String> fines = [
    'Fine 1',
    'Fine 2',
    'Fine 3',
    // Add more fines as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1D5),
      appBar: AppBar(
        title: Text(
          "خدمات رخصة المركبات",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0C2B36),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: fines.length,
        itemBuilder: (BuildContext context, int index) {
          String fine = fines[index];
          return ListTile(
            leading: Icon(Icons.more_vert),
            title: Text(fine),
            onTap: () {
              _showPaymentDetailsPopup(context, fine);
            },
          );
        },
      ),
    );
  }

  void _showPaymentDetailsPopup(BuildContext context, String fine) {
    TextEditingController _visaNumberController = TextEditingController();
    TextEditingController _expiryDateController = TextEditingController();
    TextEditingController _cvvController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Visa Payment Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _visaNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Visa Number",
                ),
              ),
              TextField(
                controller: _expiryDateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "(MM/YY)",
                ),
              ),
              TextField(
                controller: _cvvController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "CVV",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                // Perform payment logic
                String visaNumber = _visaNumberController.text;
                String expiryDate = _expiryDateController.text;
                String cvv = _cvvController.text;

                // Validate input and perform payment operation
                if (visaNumber.length != 16 ||
                    expiryDate.length != 5 ||
                    cvv.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Invalid payment details."),
                    ),
                  );
                } else {
                  // Perform payment operation and show success message
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Payment Confirmation"),
                        content: Text(
                          "تم دفع الغرامة. سيصلك رسالة من البنك بالسحب ورسالة بتأكيد دفع الغرامة.",
                        ),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context); // Close the popup
                              Navigator.pop(context); // Close the payment details popup
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
