import 'package:flutter/material.dart';

class LicenseUpdate extends StatefulWidget {
  @override
  _LicenseUpdateState createState() => _LicenseUpdateState();
}

class _LicenseUpdateState extends State<LicenseUpdate> {
  TextEditingController _visaNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  String _selectedDuration = '';

  void _showConfirmationDialog() {
    if (_selectedDuration.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please Choose a Valid Option'),
            content: Text('Please choose a duration option.'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
                color: Color(0xFF0C2B36),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Selected Duration: $_selectedDuration'),
                Text('Please enter visa details.'),
                TextField(
                  controller: _visaNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Visa Number',
                  ),
                ),
                TextField(
                  controller: _expiryDateController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Expiry Date (MM/YY)',
                  ),
                ),
                TextField(
                  controller: _cvvController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                  ),
                ),
              ],
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  String visaNumber = _visaNumberController.text;
                  String expiryDate = _expiryDateController.text;
                  String cvv = _cvvController.text;

                  // Perform validation checks
                  if (visaNumber.length != 16) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Invalid Visa Number'),
                          content: Text('Please enter a valid 16-digit visa number.'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text('OK'),
                              color: Color(0xFF0C2B36),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (expiryDate.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Invalid Expiry Date'),
                          content: Text('Please enter the expiry date.'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text('OK'),
                              color: Color(0xFF0C2B36),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (cvv.length != 3) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Invalid CVV'),
                          content: Text('Please enter a valid 3-digit CVV.'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text('OK'),
                              color: Color(0xFF0C2B36),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: Text('تمت العملية بنجاح وسيتم وصول رسالة بسحب المبلغ.'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                              color: Color(0xFF0C2B36),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('تاكيد'),
                color: Color(0xFF0C2B36), // Use the same color as the app bar
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
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
          "تجديد رخصه المركبه",
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'اختر المدة:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: Text('سنة'),
                  tileColor: _selectedDuration == 'سنة' ? Theme.of(context).primaryColorLight : null,
                  onTap: () {
                    setState(() {
                      _selectedDuration = 'سنة';
                    });
                  },
                ),
                ListTile(
                  title: Text('سنتان'),
                  tileColor: _selectedDuration == 'سنتان' ? Theme.of(context).primaryColorLight : null,
                  onTap: () {
                    setState(() {
                      _selectedDuration = 'سنتان';
                    });
                  },
                ),
                ListTile(
                  title: Text('ثلاث سنوات'),
                  tileColor: _selectedDuration == 'ثلاث سنوات' ? Theme.of(context).primaryColorLight : null,
                  onTap: () {
                    setState(() {
                      _selectedDuration = 'ثلاث سنوات';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              onPressed: _showConfirmationDialog,
              child: Text('تاكيد'),
              color: Color(0xFF0C2B36), // Use the same color as the app bar
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
