import 'package:flutter/material.dart';
import 'package:new_app/car_information.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:new_app/fine%20creation.dart';

class  police_department extends StatelessWidget {
  var CarPlateController= TextEditingController();

  String formatDate(String dateString) {
    if (dateString == null) return '';

    // Parse the date string into a DateTime object
    var dateTime = DateTime.parse(dateString);

    // Format the date using the desired format (month and year)
    var formattedDate = '${dateTime.month}/${dateTime.year}';

    return formattedDate;
  }



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
    onPressed: () async {
    final enteredData = CarPlateController.text;
    bool isValidData = true; // replace with your validation logic
    if (isValidData) {
    // Make API call to the C# endpoint
    var response = await http.post(
    Uri.parse('http://192.168.1.14:5191/Cars/GetCar'),
    body: jsonEncode({'plateNumber': enteredData}),
    headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Successful API call, store the response in a variable
      var carDetails = jsonDecode(response.body);

// Create a Car object with the retrieved details
      var car = Car(
        type: carDetails['model'] ?? '',
        owner: carDetails['ownerName'] ?? '',
        plateNumber: carDetails['plateNumber'] ?? '',
        color: carDetails['color'] ?? '',
        licenseDate: formatDate(carDetails['licenseCreationDate']),
        licenseExpiryDate: formatDate(carDetails['licenseExpirationDate']),
      );



      // Navigate to the CarInfo page and pass the car object
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CarInfo(car: car)),
      );
    }
 else {
    // Error occurred during the API call
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text("API Error"),
    content: Text("Failed to retrieve car details. Please try again."),
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
    } else {
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
          height: 60,
          width: 150,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // make the button rounded
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

