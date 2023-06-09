import 'package:flutter/material.dart';
import 'package:new_app/BadalFaed.dart';
import 'package:new_app/UpdateLicense.dart';
import 'package:new_app/UsersComplains.dart';
import 'package:new_app/UsersQueries.dart';
import 'package:new_app/UsersServices.dart';

class UsersCardServices extends StatefulWidget {
  @override
  _UsersCardServicesState createState() => _UsersCardServicesState();
}

class _UsersCardServicesState extends State<UsersCardServices> {
  TextEditingController carPlateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1D5),
      appBar: AppBar(
        title: Text(
          "خدمات رخصة القياده الشخصيه",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: MaterialButton(
                onPressed: () => _showDetailsDialog(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward),
                    SizedBox(width: 5),
                    Text(
                      'تجديد رخصه القياده الشخصيه',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                color: Color(0xFF0C2B36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsersQueries(carPlateNumber: carPlateController.text),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward),
                    SizedBox(width: 5),
                    Text(
                      'التظلمات',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                color: Color(0xFF0C2B36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BadalFaed(),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward),
                    SizedBox(width: 5),
                    Text(
                      ' عمل بدل فاقد',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                color: Color(0xFF0C2B36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('إدخال تفاصيل رخصتك'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: carPlateController,
                  onChanged: (value) {
                    // Handle changes to the car plate number
                  },
                  decoration: InputDecoration(
                    labelText: 'رقم لوحة السيارة',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'إلغاء',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF0C2B36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            MaterialButton(
              onPressed: () {
                _showConfirmationDialog(context);
              },
              child: Text(
                'تأكيد',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF0C2B36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تأكيد التفاصيل'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text('رقم لوحة السيارة: ${carPlateController.text}'),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'تعديل',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF0C2B36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateLicense(),
                  ),
                );
              },
              child: Text(
                'تأكيد',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ],
        );
      },
    );
  }
}
