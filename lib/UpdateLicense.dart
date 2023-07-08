import 'package:flutter/material.dart';

class UpdateLicense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1D5),
      appBar: AppBar(
        title: Text(
          "تجدبد رخصة القيادة الشخصية",
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
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
    Padding(
    padding: EdgeInsets.all(16.0),
    child: MaterialButton(
    onPressed: () {
    // Display a list of days to choose from
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('اختر اليوم'),
      backgroundColor:  Color(0xFFFEF1D5),
    content: SingleChildScrollView(
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    DayItem(day: 'Monday'),
    DayItem(day: 'Tuesday'),
    DayItem(day: 'Wednesday'),
    DayItem(day: 'Thursday'),
    DayItem(day: 'Friday'),
    DayItem(day: 'Saturday'),
    DayItem(day: 'Sunday'),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            'حدد معاد اختبار القيادة',
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0xFF0C2B36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
  ],),);}
}

class DayItem extends StatelessWidget {
  final String day;

  const DayItem({required this.day});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(day),
      onTap: () {
        // TODO: Check availability for the selected day
        bool isAvailable = true; // Placeholder for backend check

        if (isAvailable) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String visaNumber = ''; // Variable to store visa number input
              String expiryDate = ''; // Variable to store expiry date input
              String password = ''; // Variable to store password input

              return AlertDialog(
                title: Text('حجز'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('تاريخ الموعد: $day'),
                      SizedBox(height: 20),
                      Text('أدخل بيانات الفيزا'),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Visa Number',
                        ),
                        onChanged: (value) {
                          // Update the visa number variable if it is within the length limit
                          if (value.length <= 16) {
                            visaNumber = value;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Expiry Date (MM/YY)',
                        ),
                        onChanged: (value) {
                          expiryDate = value; // Update the expiry date variable
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'CVV',
                        ),
                        onChanged: (value) {
                          password = value; // Update the password variable
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  MaterialButton(
                    onPressed: () {
                      // TODO: Perform any necessary post-booking actions
                      Navigator.of(context).pop();
                    },
                    child: Text('إغلاق'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (visaNumber.isNotEmpty && expiryDate.isNotEmpty && password.isNotEmpty) {
                        // All fields are filled, handle the booking process
                        // You can perform additional validation here if needed

                        // Show the confirmation message
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('تم الحجز بنجاح'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('تم حجز موعد القيادة في يوم $day'),
                                  Text('Visa Number: $visaNumber'),
                                  Text('Expiry Date: $expiryDate'),
                                  Text('CVV: $password'),
                                ],
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('إغلاق'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text('حجز'),
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
                title: Text('غير متاح'),
                content: Text('الرجاء اختيار يوم آخر.'),
                actions: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('إغلاق'),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
