
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final completeNumber = TextEditingController();
  var nam;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Whatsapp Redirection'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                    setState(() {
                      nam = phone.completeNumber;
                    });
                  },
                ),

                SizedBox(
                  height: 10,
                ),
            RaisedButton(
              child: Text("Submit"),
              color: Color(0xff0091EA),
              textColor: Colors.white,
              onPressed : () {
                _formKey.currentState.validate();
                FlutterOpenWhatsapp.sendSingleMessage('$nam','');
              },
            ),

              ],
            ),
          ),
          ),
        ),
    );
  }
}


