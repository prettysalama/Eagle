import 'package:flutter/material.dart';

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
          MaterialButton(onPressed:(){
            print(CarPlateController);
          },
              child:Container(
                  height: 40,
                  color: Color(0xFF0C2B36),
                  width: double.infinity,


                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text("بحث",
                      style: TextStyle(
                        fontSize: 23 ,color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )))

        ],
      ),

    );
  }
}
