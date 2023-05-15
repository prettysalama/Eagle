import 'package:flutter/material.dart';

class CarInfo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1D5),
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
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("- بيانات المركبة -",textScaleFactor: 2,style: TextStyle(fontWeight:FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                textDirection: TextDirection.ltr,
                border:TableBorder.all(width: 1.0,color: Colors.black),
                // textDirection: TextDirection.rtl,
                // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                // border:TableBorder.all(width: 2.0,color: Colors.red),
                children: [
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("BMW",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("نوع المركبة",textScaleFactor: 1.5,textAlign:TextAlign.end),
                        ),

                      ]
                  ),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("احمد",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("صاحب المركبة",textScaleFactor: 1.5,textAlign:TextAlign.end),
                        ),

                      ]
                  ),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ع ف ح 123",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("رقم اللوحة",textScaleFactor: 1.5,textAlign:TextAlign.end),
                        ),

                      ]
                  ),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("احمر",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("لون المركبة",textScaleFactor: 1.5,textAlign:TextAlign.end),
                        ),

                      ]
                  ),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("2018",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("سنة الترخيص",textScaleFactor: 1.5,textAlign:TextAlign.end),
                        ),

                      ]
                  ),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("2022",textScaleFactor: 1.5,textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("انتهاء الترخيص",textScaleFactor: 1.5,textAlign:TextAlign.end,),
                        ),


                      ]
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton (onPressed:(
                ){
              showDialog(context: context, builder: (context)=> AlertDialog(
                actions: [TextButton(onPressed: (){}, child: Container(
                  color: Colors.yellow,
                  child: Text("إلغاء",
                  style: TextStyle(
                    fontSize: 20,color: Colors.black
                  ),),
                )),
                  TextButton(onPressed: (){}, child: Container(color: Colors.yellow,
                    child: Text("تحرير مخالفة ",
              style: TextStyle(
              fontSize: 20,
              color: Colors.black)),
                  ))],
                title: Center(
                  child: Text(" المخالفات اخر  سنتين",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                content:Text("ssss") ,
              ));
            } , child:Text(" سجل المخالفات ",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black
            ),),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow
              ),


            ),

          ]
      ),
    );

  }
}
