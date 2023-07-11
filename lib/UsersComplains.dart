import 'package:flutter/material.dart';

class UsersComplains extends StatefulWidget {
  @override
  _UsersComplainsState createState() => _UsersComplainsState();
}

class _UsersComplainsState extends State<UsersComplains> {
  String fineNumber = "";
  String complaintReason = "";
  double complaintCost = 0.0;
  String visaInfo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1D5),
      appBar: AppBar(
        title: Text(
          "خدمات رخصة المركبات",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                _showFineDialog(context, "تظلمات مركبات");
              },
              child: Text(
                "تظلمات مركبات",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              color: Color(0xFF0C2B36),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                _showFineDialog(context, "تظلمات رخص قياده شخصيه");
              },
              child: Text(
                "تظلمات رخص قياده شخصيه",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              color: Color(0xFF0C2B36),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showFineDialog(BuildContext context, String type) async {
    String fineNumber = "";
    String complaintReason = "";
    double complaintCost = 0.0;
    String visaNumber = "";
    String visaPin = "";
    String visaMMYY = "";

    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("تفاصيل الغرامة"),
          content: SingleChildScrollView(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "رقم الغرامة",
                ),
                onChanged: (value) {
                  fineNumber = value;
                },
              ),

              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "سبب الشكوى",
                ),
                onChanged: (value) {
                  complaintReason = value;
                },
              ),
              SizedBox(height: 20),
              complaintCost > 0
                  ? Text(
                "تكلفة الشكوى: ${complaintCost.toString()} ريال",
                style: TextStyle(fontSize: 18),
              )
                  : Container(),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "رقم البطاقة البنكية",
                ),
                onChanged: (value) {
                  visaNumber = value;
                },
              ),
              SizedBox(height: 20),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Expanded(
    flex: 1,
    child: TextField(
    decoration: InputDecoration(
    labelText: "CVV",
    ),
    onChanged: (value) {
    visaPin = value;
    },
    ),
    ),
    SizedBox(width: 20),
    Expanded(
    flex: 2,
    child: TextField(
    decoration: InputDecoration(
    labelText: "MM/YY",
    ),
    onChanged: (value) {
    visaMMYY = value;
    },
    ),
    ),
    ],
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    SizedBox(height: 20),
    TextButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("تأكيد"),
            content: Text("سيصلك رسالة بسحب المال وتأكيد التظلم"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("حسناً"),
              ),
            ],
          );
        },
      );
    },
    child: Text(
    "تأكيد",
    style: TextStyle(
    color: Color(0xFF0C2B36),
    ),
    ),
    style: ButtonStyle(
    backgroundColor:
    MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    side: BorderSide(color: Color(0xFF0C2B36)),
    ),
    ),),),],),],),));}
    );
  }
}