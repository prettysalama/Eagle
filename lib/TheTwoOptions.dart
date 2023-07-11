import 'package:flutter/material.dart';
import 'package:new_app/UsersCardServices.dart';
import 'package:new_app/UsersServices.dart';

class TheTwoOptions extends StatefulWidget {
  @override
  _TheTwoOptionsState createState() => _TheTwoOptionsState();
}

class _TheTwoOptionsState extends State<TheTwoOptions> {
  TextEditingController _plateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1D5),
      appBar: AppBar(
        title: Text(
          "خدمات المواطن",
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _plateController,
              decoration: InputDecoration(
                labelText: 'ادخل رقم المركبة',
                labelStyle: TextStyle(
                  color: Color(0xFF0C2B36),
                  fontSize: 18,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 16),
            MaterialButton(
              onPressed: () {
                String carPlateNumber = _plateController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsersServices(carPlateNumber: carPlateNumber),
                  ),
                );
              },
              color: Color(0xFF0C2B36),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  Text(
                    "خدمات رخصة المركبات",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
            SizedBox(height: 16),
            MaterialButton(
              onPressed: () {
                String carPlateNumber = _plateController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsersCardServices(),
                  ),
                );
              },
              color: Color(0xFF0C2B36),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  Text(
                    "خدمات رخصة القيادة الشخصية",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
