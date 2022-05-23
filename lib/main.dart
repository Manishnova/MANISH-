// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(  MaterialApp(debugShowCheckedModeBanner: false,
      title:"Works Monitoring app",
      home: const FirstHomePage(),
       theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
     
      themeMode: ThemeMode.dark, 
      )
  );
}
class FirstHomePage extends StatefulWidget {
  const FirstHomePage({Key? key}) : super(key: key);

  @override
  _FirstHomePageState createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  get mainAxisAlignment => null;

  // var http;

  // var http,

  Future login(BuildContext context) async {
    if ( password.text == "") {
      Fluttertoast.showToast(msg:
      "The user and password combination doesn't exist!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,);
    }
    else {
     
      String pass = password.text;

      // SERVER LOGIN API URL
      var url = 'http://localhost/login.php/';

      // Store all data with Param Name.
      var data = {'divname': selectedProvince, 'password': pass};

      // Starting Web API Call. shared preference 
print(selectedProvince);
      var response = await http.post(Uri.parse(url), body: json.encode(data));
      // Getting Server response into variable.
      var message = jsonDecode(response.body);
      print(message);
      if (message == "Successfully Logged In") {
        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
       }
    
      else{
        Fluttertoast.showToast(msg:
        "$message",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,);
      }
    }
  }
  
 List<String> countries = ['EE', 'ENC'];
  List<String> indiaProvince = ['Bemetara','Bilaspur','CE','Durg','Dantevada','Dhamtari','Dantewada','Gariaband','Jagdalpur', 'janjgir','Jashpur','Kawardha','Kondagaon','Korba','Kota','Kanker','Mahasamund','Marwahi','Mungeli','Narayanpur','Ramanujganj', 'Raipur','Raigarh','Rajnandgaon','SE RAIPUR','SE SARGUJA','SUKMA','SURAJPUR','SE Bilaspur','SE BASTAR'];
  List<String> usaProvince = ['Headquarter'];
   late SharedPreferences logindata;
  late bool newuser;

  List<String> provinces = [];
  String? selectedCountry;
  String? selectedProvince;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Works monitoring system'),


        ),
        body:
             ListView(padding: EdgeInsets.zero,
          children: <Widget>[const UserAccountsDrawerHeader( 
              accountName: Text("National informatics centre  Raipur"),
              accountEmail: Text ("(Chhattishgarh)"),
               currentAccountPicture: CircleAvatar(
                 backgroundImage: NetworkImage
              ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV7o7kJOANYRdguji8LBAwnMOSOGBMMC1VYA&usqp=CAU"),
                  radius: 100.0,),
                 
            ),
          Container(
            child:const Text('SELECT USER'),
              alignment: Alignment.topLeft,
               padding: const EdgeInsets.fromLTRB(02, 12, 12, 0),
          ),
          
           //country Dropdown
      Center(
          child:Padding(
            padding:const EdgeInsets.all(16.0),
     child:
        Container(
       padding: const EdgeInsets.only(left:16.2, right:16.2),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child:
        DropdownButton<String>(
            hint: const Text('USER TYPE'),
            style: const TextStyle(fontSize: 16),
            value: selectedCountry,
            isExpanded: true,
            items: countries.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (country) {
              if (country == 'ENC') {
                provinces = usaProvince;
              } else if (country == 'EE') {
                provinces = indiaProvince;
              } else {
                provinces = [];
              }
              setState(() {
                selectedProvince = null;
                selectedCountry = country;
              });
            },
          ),))),
          // Country Dropdown Ends here
            
          // Province DroPdown
          
          Container(
            child:const Text('SELECT DIVISION'),
            alignment: Alignment.topLeft,
             padding: const EdgeInsets.fromLTRB(02, 12, 12, 0),
          ),
        
Center(
          child:Padding(
            padding:const EdgeInsets.all(16.0),
     child:
        Container(
       padding: const EdgeInsets.only(left:16.2, right:16.2),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child:
          DropdownButton<String>(
            hint: const Text('USER ID'),
            style: const TextStyle(fontSize: 16),
            value: selectedProvince,
            isExpanded: true,
            items: provinces.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (province) {
              setState(() {
                selectedProvince = province;
              });
            },
          ),
        ))),
     



        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(

                  obscureText: true,
                  controller: password,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(

                onPressed: () {
                  //forgot password screen
                },
                child:const Text('Forgot Password'),
             
              ),


              RaisedButton(
                  onPressed: (){
                    login(context);
                  },
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.blue,Colors.redAccent]
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),
                )
  
            ],
          )
        )
            ]
          )
        
            
  
  
          
    );
          
             
    
          
  }
}