import 'package:flutter/material.dart';
import 'package:new_app/UsersComplains.dart';
import 'package:new_app/UsersServices.dart';

class UsersQueries extends StatefulWidget {
  @override
  _UsersQueriesState createState() => _UsersQueriesState();
}

class _UsersQueriesState extends State<UsersQueries> {
  bool _showList = false;
  bool _yesChecked = false;
  bool _noChecked = false;
  bool _isLoading = false;
  List<String> _violations = [];

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
                  onPressed: () {
                    setState(() {
                      _showList = !_showList;
                    });
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
                    return Column(
                      children: [
                        ListTile(
                          title: Text('مخالفة رقم ${index + 1}'),
                          trailing: IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('تفاصيل المخالفة'),
                                    content: Text(
                                        'تفاصيل مخالفة رقم ${index + 1}'),
                                  );
                                },
                              );
                            },
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

                                        // Simulate loading time
                                        await Future.delayed(Duration(seconds: 3));

                                        setState(() {
                                          _isLoading = false;
                                        });

                                        // Navigate to next page
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => UsersServices()));
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

    // Simulate loading time
    await Future.delayed(Duration(seconds: 3));

    setState(() {
    _isLoading = false;
    });

    // Navigate to next page
    Navigator.push(context, MaterialPageRoute(builder: (context) => UsersComplains()));

    }),]),]),]),)]));}}



