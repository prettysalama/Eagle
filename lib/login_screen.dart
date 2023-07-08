import 'package:flutter/material.dart';
import 'package:new_app/TheTwoOptions.dart';
import 'package:new_app/police_department.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var IDController = TextEditingController();

  void _handleLoginButtonPressed() {
    final enteredID = IDController.text;
    if (enteredID.length == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => police_department()),
      );
    } else if (enteredID.length == 14) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TheTwoOptions()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid ID"),
            content: Text("Please enter a valid ID"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
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
        backgroundColor: Color(0xFF0C2B36),
        title: Center(
          child: Text(
            "Welcome to Eagle",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Image.asset(
                'assets/Eagle.png',
                width: 200,
                height: 200,
              )

              ,
              TextFormField(
                controller: IDController,
                onFieldSubmitted: (value) {
                  print(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter your ID",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.account_circle),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                  onPressed: _handleLoginButtonPressed,
                  child: Container(
                    height: 40,
                    color: Color(0xFF0C2B36),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
