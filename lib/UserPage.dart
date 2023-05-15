import 'package:flutter/material.dart';
import 'TheTwoOptions.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  var usersCarPlateController = TextEditingController();
  String errorMessage = "";

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
            child: TextFormField(
              controller: usersCarPlateController,
              onFieldSubmitted: (value) {
                // ignore: avoid_print
                print(value);
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "ادخل الرقم القومي",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.car_crash),
                iconColor: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              if (usersCarPlateController.text.length != 14) {
                setState(() {
                  errorMessage =
                  "الأرقام التي أدخلتها غير صالحة. الرجاء إعادة المحاولة.";
                });
              } else {
                setState(() {
                  errorMessage = "";
                });
                print(usersCarPlateController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TheTwoOptions(),
                  ),
                );
              }
            },
            child: Container(
              height: 40,
              color: Color(0xFF0C2B36),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "تاكيد",
                  style: TextStyle(fontSize: 23, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            errorMessage,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
