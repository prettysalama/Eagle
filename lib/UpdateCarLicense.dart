import 'package:flutter/material.dart';
import 'package:new_app/LicenseUpdate.dart';
import 'package:new_app/UsersComplains.dart';
import 'package:new_app/UsersFinePay.dart';

class UpdateCarLicense extends StatefulWidget {
  @override
  _UpdateCarLicenseState createState() => _UpdateCarLicenseState();
}

class _UpdateCarLicenseState extends State<UpdateCarLicense> {
  TextEditingController _plateNumberController = TextEditingController();
  TextEditingController _plateLettersController = TextEditingController();

  String _carType = '';
  String _carColor = '';
  String _carModel = '';
  bool _hasFines = false;

  void _showCarDetailsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Car Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Type: $_carType'),
              Text('Color: $_carColor'),
              Text('Model: $_carModel'),
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                if (_hasFines) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsersFinePay()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LicenseUpdate()),
                  );
                }
              },
              child: Text('OK'),
              color: Color(0xFF0C2B36),
              textColor: Colors.white,
              shape: CircleBorder(),
            ),
          ],
        );
      },
    );
  }

  void _validateAndProceed() {
    String plateNumber = _plateNumberController.text;
    String plateLetters = _plateLettersController.text;

    // Perform your validation checks here
    bool isValid = true; // Replace with your validation logic

    if (isValid) {
      // Assign car details
      _carType = "Sedan";
      _carColor = "Red";
      _carModel = "ABC123";

      _showCarDetailsDialog();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Entry'),
            content: Text('Please enter valid license plate numbers.'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('OK'),
                color: Color(0xFF0C2B36),
                textColor: Colors.white,
                shape: CircleBorder(),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1D5),
      appBar: AppBar(
        title: Text(
          "خدمات رخصة المركبات",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0C2B36),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _plateNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'ادخل الارقام',
              ),
            ),
            TextField(
              controller: _plateLettersController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'ادخل الحروف',
              ),
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              onPressed: _validateAndProceed,
              child: Text('تاكيد'),
              color: Color(0xFF0C2B36),
              textColor: Colors.white,
              shape: CircleBorder(),
              padding: EdgeInsets.all(24.0),
            ),
          ],
        ),
      ),
    );
  }
}


