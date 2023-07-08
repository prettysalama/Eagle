import 'package:flutter/material.dart';
import 'package:new_app/fine%20creation.dart';

class Car {
    final String type;
    final String owner;
    final String plateNumber;
    final String color;
    final String licenseDate;
    final String licenseExpiryDate;

    Car({
        required this.type,
        required this.owner,
        required this.plateNumber,
        required this.color,
        required this.licenseDate,
        required this.licenseExpiryDate,
    });
}

class CarInfo extends StatelessWidget {
    final Car car;

    CarInfo({required this.car});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color(0xFFFEF1D5),
            appBar: AppBar(
                backgroundColor: Color(0xFF0C2B36),
                centerTitle: true,
                title: Text('Car Information'),
            ),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            SizedBox(height: 10),
                            Center(
                                child: Text(
                                    "بيانات المركبة",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                            ),

                            SizedBox(height: 20),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                        car.type,
                                        style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                        "نوع المركبة",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                    ),
                                ],
                            ),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                        car.owner,
                                        style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                        "صاحب المركبة",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                    ),
                                ],
                            ),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                        car.plateNumber,
                                        style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                        "رقم اللوحة",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                    ),
                                ],
                            ),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                        car.color,
                                        style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                        "لون المركبة",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                    ),
                                ],
                            ),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                        car.licenseDate,
                                        style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                        "تاريخ الترخيص",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                    ),
                                ],
                            ),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                        car.licenseExpiryDate,
                                        style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                        "تاريخ انتهاء الترخيص",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                    ),
                                ],
                            ),
                            SizedBox(height: 20),
                            Divider(height: 1),
                            SizedBox(height: 16),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    MaterialButton(
                                        onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => FineCreation(),
                                                ),
                                            );
                                        },
                                        color: Color(0xFF0C2B36),
                                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Adjust the padding values to make the button bigger
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Make the button rounded
                                        child: Text(
                                            'تحرير مخالفة',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                            ),
                                        ),
                                    )

                                ],
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
