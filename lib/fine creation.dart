import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class FineCreation extends StatefulWidget {
  var PriceController= TextEditingController();
  @override
  State<FineCreation> createState() => _FineCreationState();
}

class _FineCreationState extends State<FineCreation> {
  final List<String> items = [
    'عدم ارتداء حزام الأمان',
    'تركيب زجاج فيم',
    'كسر بالزجاج',
    'تركيب ستائر',
    'عدم الاتزان في القيادة',
    'اعتراض الطريق أمام سيارات الطوارئ',
    'جلوس الأطفال دون السابعة في المقعد المجاور للسائق',
    'عدم امتلاك طفاية حريق',
    'تعطيل حركة المرور عن عمد',
    'تركيب سرينة هوائية',
    'إخراج السيارة دخان كثيف',
    'عدم تركيب اللوحات المعدنية',
    'استعمال لوحات غير خاصة بالسيارة',
    'الانتظار في تقاطع الطرق',
    'السير ببطء ملحوظ في تقاطع الكوبري',
    'السير ببطء ملحوظ في مدخل النفق',
    'الانتظار في الأماكن الممنوعة',
    'تركيب أجهزة تنبيه مخالفة',
    'استعمال أنوار ليزر',
    'عدم صلاحية الفرامل',
    'الإمساك بالهاتف',
    'التوقف على الكوبري عن عمد',
    'عدم السير في المسار المحدد على الطرق',
    'كسر الإشارة',
    'اعتداء صاحب السيارة على رجل المرور',
    'تجاوز السرعة المقررة',
    'انتهاء رخصة السير والقيادة',
    'تغيير لون اللوحة المعدنية',
    'تخريب اللوحات المعدنية',
    'السير دون رخصة سير',
    'السير دون رخصة قيادة',
    'السير عكس الاتجاه',



  ];
  String? selectedValue;

  var priceController = TextEditingController();

  bool isLoading = false;
  void _performAction() {
    setState(() {
      isLoading = true;
    });

    // TODO: Perform action here

    // Simulate the action taking some time
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('تم تحرير المخالفة بنجاح'),
            actions: [
              TextButton(
                child: Text('حسنا'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    var PriceController;
    return Scaffold(backgroundColor: Color(0xFFFEF1D5),
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
              padding: const EdgeInsets.only(top: 150),
              child: Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Icon(
                          Icons.list,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'اختر نوع المخالفة',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 260,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Color(0xFF0C2B36),
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.white,
                    ),
                    dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 350,
                        padding: null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0XFF2A6466),
                        ),
                        elevation: 8,
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        )),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
            ),
    Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Center(
    child: SizedBox(
    width: 250,
    child: TextFormField(
    controller: widget.PriceController,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
    hintText: 'ادخل السعر',
    hintStyle: TextStyle(fontSize: 18),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(
    color: Colors.black26,
    ),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(
    color: Theme.of(context).primaryColor,
    ),
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.only(
    left: 14,
    right: 14,
    top: 20,
    bottom: 20,
    ),
    ),
    style: const TextStyle(
    fontSize: 18,
    color: Colors.black,
    ),
    ),
    ),
    ),
    ),        Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MaterialButton(
                onPressed: () async {

                  String priceText = widget.PriceController.text;
                  int price = 0;

                  try {
                    price = int.parse(priceText);
                  } catch (e) {
                    String errorMessage = "An error occurred: ${e.toString()}";
                    print(errorMessage);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Invalid Value"),
                          content: Container(
                            width: 300, // Adjust the width as needed
                            height: 150, // Adjust the height as needed
                            child: Text("You must enter a numeric value"),
                          ),
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


                  var url = 'http://192.168.1.14:5191/Tickets'; // Replace with your C# API endpoint URL

                  var requestBody = {
                    'type': selectedValue,
                    'price': price,
                  };

                  try {
                    var response = await http.post(
                      Uri.parse(url),
                      body: jsonEncode(requestBody),
                      headers: {'Content-Type': 'application/json'},
                    );

                    if (response.statusCode == 200) {
                      // API request was successful
                      var serverResponse = response.body;

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Server Response'),
                            content: Text(serverResponse),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // API request failed
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('API Error'),
                            content: Text('Failed to send the request. Please try again.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } catch (e) {
                    String errorMessage = 'An error occurred: ${e.toString()}';
                    print(errorMessage);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('An error occurred. Please try again.\n\n$errorMessage'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'تحرير المخالفة',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                textColor: Colors.white,
                color: Color(0xFF0C2B36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                minWidth: 200,
                height: 50,
              )
              ,
            ),
          ],
      ),
    );
  }
}