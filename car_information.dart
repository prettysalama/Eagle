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

final List<Car> carList = []; // create an empty list of cars




    class CarInfo extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xFFFEF1D5),
    appBar: AppBar(
    title: Text(
    "المرور",
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
    SizedBox(
    height: 10,
    ),
    Text(
    "بيانات المركبة",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),
    Expanded(
      child: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (BuildContext context, int index) {
          final car = carList[index]; // replace with your data source

    return Padding(
    padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "نوع المركبة: ${car.type}", // replace with your data source
    style: TextStyle(fontSize: 18),
    ),
    SizedBox(height: 8),
    Text(
    "صاحب المركبة: ${car.owner}", // replace with your data source
    style: TextStyle(fontSize: 18),
    ),
    SizedBox(height: 8),
    Text(
    "رقم اللوحة: ${car.plateNumber}", // replace with your data source
    style: TextStyle(fontSize: 18),
    ),
    SizedBox(height: 8),
    Text(
    "لون المركبة: ${car.color}", // replace with your data source
    style: TextStyle(fontSize: 18),
    ),
    SizedBox(height: 8),
    Text(
    "تاريخ الترخيص: ${car.licenseDate}", // replace with your data source
    style: TextStyle(fontSize: 18),
    ),
    SizedBox(height: 8),
    Text(
    "تاريخ انتهاء الترخيص: ${car.licenseExpiryDate}", // replace with your data source
    style: TextStyle(fontSize: 18),
    ),
        SizedBox(height: 16),
        Divider(height: 1),
    ],
    ),
    );
        },
      ),
    ),
        SizedBox(height: 16),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                        color: Color(0xFF0C2B36) ,
                        textColor: Colors.white,
                        child: Text('تحرير مخالفة'),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FineCreation(),
                            ),
                        ),
                    ),

                ],
            ),
        ),
    ],
    ),
    );
    }
    }
