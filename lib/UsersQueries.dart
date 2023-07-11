import 'package:flutter/material.dart';
import 'package:new_app/UsersComplains.dart';
import 'package:new_app/UsersServices.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Violation {
  final String id;
  final String type;
  final String price;

  Violation({
    required this.id,
    required this.type,
    required this.price,
  });
}

class UsersQueries extends StatefulWidget {
  final String carPlateNumber;

  const UsersQueries({required this.carPlateNumber});

  @override
  _UsersQueriesState createState() => _UsersQueriesState();
}

class _UsersQueriesState extends State<UsersQueries> {
  bool _showList = false;
  bool _yesChecked = false;
  bool _noChecked = false;
  bool _isLoading = false;
  List<Violation> _violations = [];

  Future<void> _copyViolationID(String violationID) async {
    await Clipboard.setData(ClipboardData(text: violationID));
    Fluttertoast.showToast(msg: 'تم نسخ رقم المخالفة');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1D5),
      appBar: AppBar(
        title: Text(
          "خدمات المواطن",
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, top: 16, right: 16),
            child: MaterialButton(
              color: Color(0xFF0C2B36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'اجمالي المخالفات',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
              onPressed: () async {
                setState(() {
                  _showList = !_showList;
                  _isLoading = true;
                  _violations = [];
                });

                String carPlateNumber = widget.carPlateNumber;

                var url = 'http://192.168.1.14:5191/Tickets/GetTickets';

                var queryParameters = {'carPlateNumber': carPlateNumber};
                var uri = Uri.parse(url).replace(queryParameters: queryParameters);

                try {
                  var response = await http.get(
                    uri,
                    headers: {'Content-Type': 'application/json'},
                  );

                  if (response.statusCode == 200) {
                    var responseData = jsonDecode(response.body);
                    var tickets = responseData['tickets'] as List<dynamic>;

                    setState(() {
                      _violations = tickets.map((ticket) => Violation(
                        id: ticket['id']['increment'].toString(),
                        type: ticket['type'].toString(),
                        price: ticket['price'].toString(),
                      )).toList();
                    });
                  }
                  else {
                    String errorMessage = response.body;
                    int statusCode = response.statusCode;

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('API Error'),
                          content: Text('Failed to fetch tickets. Status Code: $statusCode\nError details:\n\n$errorMessage'),
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
                } finally {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
            ),
          ),
          _showList
              ? Expanded(
            child: _isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : _violations.isNotEmpty
                ? ListView.builder(
              itemCount: _violations.length,
              itemBuilder: (context, index) {
                final violation = _violations[index];

                return Column(
                  children: [
                    ListTile(
                      title: Text('${violation.type} - ${violation.price} جنيه'),
                      subtitle: Text('رقم المخالفة: ${violation.id}'),
                      trailing: GestureDetector(
                        onTap: () {
                          _copyViolationID(violation.id);
                        },
                        child: Icon(Icons.content_copy),
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            )
                : Center(
              child: Text('لا يوجد مخالفات'),
            ),
          )
              : Container(),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'هل تريد التظلم؟',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text(
                          'لا',
                          style: TextStyle(
                            fontSize: 18,
                            color: _noChecked ? Colors.white : null,
                          ),
                        ),
                        Checkbox(
                          value: _noChecked,
                          onChanged: (newValue) async {
                            setState(() {
                              _isLoading = true;
                              _yesChecked = false;
                              _noChecked = newValue!;
                            });

                            setState(() {
                              _isLoading = false;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UsersServices(carPlateNumber: ""),
                              ),
                            );
                          },
                        ),
                        Text(
                          'نعم',
                          style: TextStyle(
                            fontSize: 18,
                            color: _noChecked ? Colors.white : null,
                          ),
                        ),
                        Checkbox(
                          value: _yesChecked,
                          onChanged: (newValue) async {
                            setState(() {
                              _isLoading = true;
                              _yesChecked = newValue!;
                              _noChecked = false;
                            });

                            setState(() {
                              _isLoading = false;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UsersComplains(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
