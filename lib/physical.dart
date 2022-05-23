import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
  import 'dart:core';
void main() => runApp(const PhysicalProgress());

class PhysicalProgress extends StatelessWidget {
  const PhysicalProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Physical Progress';

    return MaterialApp(debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {

 

  List<String> countries = ['विभाग के द्वारा', 'निविदा के द्वारा'];
  List<String> indiaProvince = [''];
  List<String> usaProvince = [''];
  

  List<String> provinces = [];
  String? selectedCountry;
  String? selectedProvince;


  List<String> countr = ['YES', 'NO'];
  List<String> india = [''];
  List<String> usa = [''];
  
  List<String> pro = [];
  String? selectedCount;
  String? selectedPro;

   TextEditingController tech_Acp_Date=new TextEditingController();
  TextEditingController tech_Acp_Pay=new TextEditingController();
  TextEditingController nivida_Jari_Date=new TextEditingController();
  TextEditingController nivida_Acp_Date=new TextEditingController();
  TextEditingController karyadesh_Date=new TextEditingController();
  TextEditingController anubandh_WkCp_Date=new TextEditingController();
  TextEditingController ccTime_Ext_Date=new TextEditingController();
  TextEditingController layout_Date =new TextEditingController();
  // TextEditingController bautic_Pragati=new TextEditingController();
  TextEditingController work_Comp_Date=new TextEditingController();
  TextEditingController certi_Comp_Date =new TextEditingController();
  TextEditingController work_Comp=new TextEditingController();
  TextEditingController work_Pragati_Start_Date=new TextEditingController();
   TextEditingController work_Pragati_End_Date=new TextEditingController();

 String phpurl = "http://localhost/ework/physical.php/";

  set msg(String msg) {}

  set status(bool status) {}

@override
  void initState(){
    status=false;
    msg="";
    super.initState();

  }

 Future<void> sendData() async {
    if (  tech_Acp_Date.text == "" && nivida_Jari_Date.text =="" &&
    nivida_Acp_Date.text == "" 
     ) {
      Fluttertoast.showToast(msg:
      "PLEASE ENTER THE DATA",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,);
    }
    else{
   var data =  {
      "tech_Acp_Date": tech_Acp_Date.text,
      "tech_Acp_Pay":tech_Acp_Pay.text,
      "nivida_Jari_Date": nivida_Jari_Date.text,
      "nivida_Acp_Date":nivida_Acp_Date.text,
      "karyadesh_Date": karyadesh_Date.text,
      "anubandh_WkCp_Date": anubandh_WkCp_Date.text,
      "ccTime_Ext_Date":ccTime_Ext_Date.text,
      "layout_Date": layout_Date.text,
      // "bautic_Pragati": bautic_Pragati.text,
      "work_Comp_Date": tech_Acp_Date.text,
      "certi_Comp_Date": certi_Comp_Date.text,
      "work_Comp": work_Comp.text,
      "work_Pragati_Start_Date": work_Pragati_Start_Date.text,
      "work_Pragati_End_Date": work_Pragati_End_Date.text,
    
    };
    var res= await http.post(Uri.parse(phpurl), 
    body:  json.encode(data),);
     dynamic messae = jsonDecode(res.body);
     print("$messae[0][msg]");
    print("f2");
     Fluttertoast.showToast(msg:
      "DATA INSERTED SUCCESSFULLY",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,);
    tech_Acp_Date.clear();
    tech_Acp_Pay.clear();
    nivida_Jari_Date.clear();
    nivida_Acp_Date.clear();
    karyadesh_Date.clear();
    anubandh_WkCp_Date.clear();
    ccTime_Ext_Date.clear();
    layout_Date.clear();
    // bautic_Pragati.clear();
    work_Comp_Date.clear();
    certi_Comp_Date.clear();
    work_Comp.clear();
    work_Pragati_Start_Date.clear();
    work_Pragati_End_Date.clear();
    
  }}
   

  final _formKey = GlobalKey<FormState>();
   get children => null;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child:ListView(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        children: [
         
          DropdownButton<String>(
            hint: Text('विभाग/निविदा '),
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
          ), 


  const Text("क्या विभाग/निविदा की कार्यवाही पूर्ण की गयी ?" ,style:  TextStyle(fontSize: 16),
                
      
                ),
  DropdownButton<String>(
          
            value: selectedCount,
            isExpanded: true,
            items: countr.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (countr) {
              if (countr == 'ENC') {
                pro = usa;
              } else if (countr == 'EE') {
                pro = india;
              } else {
                pro = [];
              }
              setState(() {
                selectedPro = null;
                selectedCount = countr;
              });
            },
          ), 
          
               
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:tech_Acp_Date,
 keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
             decoration: const InputDecoration(
               
                  border: OutlineInputBorder(),
                  labelText: 'तक स्वी दिनांक',
                  hintText: 'DD/MM/YYYY',
          ),),),

Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                   controller:tech_Acp_Pay,
           keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid amount';
              }
             
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                 labelText: 'तक स्वी राशि:',
                  hintText: '0.00',

                ),
              ),),  

Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:nivida_Jari_Date,
            // The validator receives the text that the user has entered.
           keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'DD/MM/YYYY',
                  labelText: 'निविदकार के लिए निविदा जारी करने का दिनांक ',
                  
                ),
              ),  
  ),


Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:nivida_Acp_Date,
            // The validator receives the text that the user has entered.
         keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'निविदा स्वीकृति दिनांक ',
                  hintText: 'DD/MM/YYYY',

                ),
              ), ), 

Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:karyadesh_Date,
            // The validator receives the text that the user has entered.
           keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                 labelText: 'कार्य आदेश का दिनांक ',
                  hintText: 'DD/MM/YYYY',
                  

                ),
              ),  ),
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:anubandh_WkCp_Date,
          keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                   labelText: 'अनूबंध के अनुसार कार्य पूर्ण करने का दिनांक  ',
                  hintText: 'DD/MM/YYYY',

                ),
              ),  ),

Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:ccTime_Ext_Date,
            // The validator receives the text that the user has entered.
          keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'DD/MM/YYYY',
                  labelText: 'CC work date extention'

                ),
              ),  ),
            
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:layout_Date,
            // The validator receives the text that the user has entered.
           keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ले आउट दिनांक ',
                  hintText: 'DD/MM/YYYY',
                )),),
  // Container(
  //                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
  //                 child: TextFormField(
  //                   controller:,
  //         keyboardType: TextInputType.phone,
  //           // The validator receives the text that the user has entered.
  //           validator: (msg) {
  //             if (msg == null || msg.isEmpty) {
  //               return 'Please enter valid date';
  //             }
  //             if(msg.length!=10){
  //               return"please enter a valid date";
  //             }
  //             return null;
  //           },
  //               decoration: const InputDecoration(
  //                 border: OutlineInputBorder(),
  //                  labelText: 'अनूबंध के अनुसार कार्य पूर्ण करने का दिनांक  ',
  //                 hintText: '01/01/2000',

  //               ),
  //             ),  ),
 Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:work_Comp_Date,
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
               labelText: 'कार्य पूर्ण दिनांक ',
                  hintText: 'DD/MM/YYYY',
                )),),

Container( 
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:certi_Comp_Date,
            // The validator receives the text that the user has entered.
           keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
              labelText: 'पूर्णता प्रमाण पत्र जारी करने का दिनांक ',
                  hintText: 'DD/MM/YYYY',
                )),),
                
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:work_Comp,
            // The validator receives the text that the user has entered.
          keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
              labelText: 'कार्य निरीक्षण का दिनांक ',
                  hintText: 'DD/MM/YYYY',
                  
                )),),
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:work_Pragati_Start_Date,
            // The validator receives the text that the user has entered.
           keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                 labelText: 'प्रगति आरंभ दिनांक  ',
                  hintText: 'DD/MM/YYYY',
                )),),

Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:work_Pragati_End_Date,
            // The validator receives the text that the user has entered.
           keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (msg) {
              if (msg == null || msg.isEmpty) {
                return 'Please enter valid date';
              }
              if(msg.length!=10){
                return"please enter a valid date";
              }
              return null;
            },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
               labelText: 'प्रगति  पूर्ण दिनांक ',
                  hintText: 'DD/MM/YYYY',
                )),),
              
 Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                
                 sendData();
                 print("f1");
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

