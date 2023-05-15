import 'package:new_app/TheTwoOptions.dart';
import 'package:new_app/UserPage.dart';
import 'package:new_app/UsersCardServices.dart';
import 'package:new_app/UsersComplains.dart';
import 'package:new_app/UsersQueries.dart';
import 'package:new_app/UsersServices.dart';
import 'package:new_app/police_department.dart';
import 'package:flutter/material.dart';
import 'car_information.dart';
import 'fine creation.dart';
import 'login_screen.dart';


void main() {
  runApp(myApp());
}


class myApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {   return MaterialApp(
    home: UsersCardServices(),

    debugShowCheckedModeBanner:false,
  );
  }


}



