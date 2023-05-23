import 'package:flutter/material.dart';
import 'package:new_app/UsersCardServices.dart';
import 'package:new_app/UsersServices.dart';

class TheTwoOptions extends StatefulWidget {
  @override
  _TheTwoOptionsState createState() => _TheTwoOptionsState();
}

class _TheTwoOptionsState extends State<TheTwoOptions> {
  TextEditingController _plateNumberController = TextEditingController();
  TextEditingController _plateLettersController = TextEditingController();
  bool _invalidEntry = false;

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
        backgroundColor: Color(0xFF0C2B36),leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () => Navigator.pop(context),
      ),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          TextFormField(
          controller: _plateNumberController,
          decoration: InputDecoration(
            labelText: 'ادخل الرقم',
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
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _invalidEntry ? Colors.red : Colors.black),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: _plateLettersController,
          decoration: InputDecoration(
            labelText: 'ادخل الحروف',
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
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _invalidEntry ? Colors.red : Colors.black),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
        SizedBox(height: 16),
        MaterialButton(
          onPressed: _invalidEntry
              ? null
              : () {
            if (_plateNumberController.text.isNotEmpty &&
                _plateLettersController.text.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsersServices(),
                ),
              );
              // perform action
            } else {
              setState(() {
                _invalidEntry = true;
              });
            }
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
        ),   SizedBox(height: 16),
        MaterialButton(
          onPressed: _invalidEntry
              ? null
              : () {
            if (_plateNumberController.text.isNotEmpty &&
                _plateLettersController.text.isNotEmpty) { Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsersCardServices(),
              ),
            );
              // perform action
            } else {
              setState(() {
                _invalidEntry = true;
              });
            }
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
                "خدمات رخصة القياده الشخصيه",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(width: 24),
            ],
          ),
        )
        ,    ],
    ),
    ),
    );}
}