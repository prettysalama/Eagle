import 'package:flutter/material.dart';
import 'package:new_app/car_information.dart';

class  police_department extends StatelessWidget {
  var CarPlateController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Color(0xFFFEF1D5),
      appBar: AppBar(
        title: Text("المرور",
          style: TextStyle(
            color: Colors.white,
                fontSize: 28,
          ),
        ), centerTitle: true,
        backgroundColor: Color(0xFF0C2B36), leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200,left: 20,right: 20),
            child: TextFormField(
              controller: CarPlateController,
              onFieldSubmitted: (value)
              {
                // ignore: avoid_print
                print(value);
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "ادخل رقم المركبة",
                border: OutlineInputBorder() ,
                prefixIcon: Icon(Icons.car_crash),



              ),
            ),
          ),
          SizedBox(
            height: 10,

          ),
          MaterialButton(
          onPressed: () {
          // Check if the entered data is valid
          final enteredData = CarPlateController.text;
          bool isValidData = false; // replace with your validation logic

          if (isValidData) {
          // Navigate to CarInformation page if data is valid
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CarInfo())
          );
          } else {
          // Show an error message if data is invalid
          showDialog(
          context: context,
          builder: (BuildContext context) {
          return AlertDialog(
          title: Text("Invalid data"),
          content: Text("Please enter valid data"),
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
          },
          child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // make the button rounded
          color: Color(0xFF0C2B36),
          ),
          child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
          "بحث",
          style: TextStyle(
          fontSize: 23,
          color: Colors.white,
    ),
    textAlign: TextAlign.center,

          ),
          )))

        ],
      ),

    );
  }
}

