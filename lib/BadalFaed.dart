import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BadalFaed extends StatefulWidget {
  @override
  _BadalFaedState createState() => _BadalFaedState();
}

class _BadalFaedState extends State<BadalFaed> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;

  final TextEditingController _visaNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  void _selectImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _takePhoto() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _submitForm() {
    // Perform form submission logic
    // Validate visa details and show success message
    // You can customize this logic based on your requirements
    // For simplicity, let's assume visaNumber should be 16 digits
    final String visaNumber = _visaNumberController.text;
    final String expiryDate = _expiryDateController.text;
    final String cvv = _cvvController.text;

    if (visaNumber.isEmpty ||
        visaNumber.length != 16 ||
        expiryDate.isEmpty ||
        cvv.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Entry'),
            content: Text('Please fill all the required fields correctly.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('تاكبد'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('تم اتمام العملية وسحب النقود'),
            content: Text('سيصلك رسالة بميعاد استلام البدل فاقد.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('تاكيد'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _visaNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF1D5),
      appBar: AppBar(
        title: Text(
          "عمل بدل فاقد",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Text(
                'اختر صورة للمستندات المطلوبة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _selectedImage == null
                    ? Center(
                  child: Text('No Image Selected'),
                )
                    : Image.file(
                  File(_selectedImage!.path),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: _selectImage,
                    color: Color(0xFF0C2B36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_library,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'اختر من الصور',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  MaterialButton(
                    onPressed: _takePhoto,
                    color: Color(0xFF0C2B36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'التقط صورة',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'بيانات الفيزا',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'رقم الفيزا',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '(MM/YY)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              MaterialButton(
                onPressed: _submitForm,
                color: Color(0xFF0C2B36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'تأكيد',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

