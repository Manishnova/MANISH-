import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

void main() => runApp(const NewPage(title: 'home',));

class NewPage extends StatelessWidget {
  const NewPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Create New Form';

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
 

  //  List<String> countries = ['जमा कार्य','मद कार्य'];
  // List<String> indiaProvince = [''];
  // List<String> usaProvince = [''];
  
  // List<String> provinces = [];
  // String? selectedCountry;
  // String? selectedProvince;


  //  List<String> country = ['2021-2022','2020-2021','2019-2020','2018-2019','2017-2018','2016-2017','2015-2016'];
  //  List<String> indiaProvinc = [''];
  // List<String> usaProvinc = [''];
  
  // List<String> province = [];
  // String? selectedCountr;
  // String? selectedProvinc;

  // List<String> count =  ['Bemetara','Bilaspur','Durg','Dhamtari','Dantewada','Gariaband','Jagdalpur', 'janjgir','Jashpur','Kawardha','Kondagaon','Korba','Kota','Kanker','Mahasamund','Marwahi','Mungeli','Narayanpur','Ramanujganj', 'Raipur','Raigarh','Rajnandgaon','SUKMA','SURAJPUR'];
  //  List<String> india = [''];
  // List<String> usa = [''];
  
  // List<String> prov = [];
  // String? selectedCount;
  // String? selectedProv;
  
TextEditingController admin_App_No=new TextEditingController();
TextEditingController admin_App_Date=new TextEditingController();
TextEditingController work_Amount=new TextEditingController();
TextEditingController work_Conti_Amount=new TextEditingController();
TextEditingController admin_Sanction_Amount=new TextEditingController();
TextEditingController treasury_Chno=new TextEditingController();
TextEditingController treasury_Ch_date=new TextEditingController();
TextEditingController current_Receipt_amount=new TextEditingController();
TextEditingController current_Receipt_date=new TextEditingController();
TextEditingController work_charge_amount=new TextEditingController();
String phpurl = "http://localhost/receipt.php/";

  set msg(String msg) {}

  set status(bool status) {}

@override
  void initState(){
    status=false;
    msg="";
    super.initState();

  }

 Future<void> sendData() async {
   if ( admin_App_No.text == "") {
      Fluttertoast.showToast(msg:
      "PLEASE ENTER DATA!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,);
    }
     else {
    
   var data =  {
      "admin_App_No": admin_App_No.text,
      "admin_App_Date": admin_App_Date.text,
      "work_Amount":work_Amount.text,
      "work_Conti_Amount": work_Conti_Amount.text,
      "admin_Sanction_Amount": admin_Sanction_Amount.text,
      "treasury_Chno":treasury_Chno.text,
      "treasury_Ch_date": treasury_Ch_date.text,
      "current_Receipt_amount": current_Receipt_amount.text,
      "current_Receipt_date": current_Receipt_date.text,
      "work_charge_amount":work_charge_amount.text,
    
    
    };
    var res= await http.post(Uri.parse(phpurl), 
    body:  json.encode(data),);
     dynamic messa = jsonDecode(res.body);
     print("$messa[0][msg]");
    print("f2");
    Fluttertoast.showToast(msg:
      "DATA INSERTED SUCCESSFULLY",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,);
    admin_App_No.clear();
    admin_App_Date.clear();
    work_Amount.clear();
    work_Conti_Amount.clear();
    admin_Sanction_Amount.clear();
    treasury_Chno.clear();
    treasury_Ch_date.clear();
    current_Receipt_amount.clear();
    current_Receipt_date.clear();
   work_charge_amount.clear();
   
  }}
   final _formKey = GlobalKey<FormState>();
  get children => null;

 @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child:ListView(
         padding: EdgeInsets.zero,
           children: [ 
 
    Center( child:Padding(
            padding:const EdgeInsets.all(16.0),
     child:

Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: const Text("Panel 1" ,style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                
      
                )))
                ),
       
//          Center(
//           child:Padding(
//             padding:const EdgeInsets.all(16.0),
//      child:
// //         Container(
//        padding: EdgeInsets.only(left:16.2, right:16.2),
//         decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//         child:

// DropdownButton<String>(
//               hint: Text('जमा कार्य / मद कार्य'),
            
//               value: selectedCountry,
//               isExpanded: true,
//               items: countries.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (countries) {
//                 if (countries == 'ENC') {
//                   provinces = usaProvince;
//                 } else if (countries == 'EE') {
//                   provinces = indiaProvince;
//                 } else {
//                   provinces = [];
//                 }
//                 setState(() {
//                   selectedProvince = null;
//                   selectedCountry = countries;
//                 });
//               },
// ),
//         ))),


//  Center(
//           child:Padding(
//             padding:const EdgeInsets.all(16.0),
//      child:
//         Container(
//        padding: EdgeInsets.only(left:16.2, right:16.2),
//         decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//         child:
// DropdownButton<String>(
  
//               hint: Text('Financial Year'),
            
//               value: selectedCountr,
//               isExpanded: true,
//               items: country.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (country) {
//                 if (country == 'ENC') {
//                   province = usaProvinc;
//                 } else if (country == 'EE') {
//                   province = indiaProvinc;
//                 } else {
//                   provinces = [];
//                 }
//                 setState(() {
//                   selectedProvinc = null;
//                   selectedCountr = country;
//                 });
//               },
// )))),
// Center(
//           child:Padding(
//             padding:const EdgeInsets.all(16.0),
//      child:
//         Container(
//        padding: EdgeInsets.only(left:16.2, right:16.2),
//         decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//         child:
// DropdownButton<String>(
//               hint: Text('Select Distrit'),
            
//               value: selectedCount,
//               isExpanded: true,
//               items: count.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (count) {
//                 if (count == 'ENC') {
//                   prov = usa;
//                 } else if (count == 'EE') {
//                   prov = india;
//                 } else {
//                   prov = [];
//                 }
//                 setState(() {
//                   selectedProv = null;
//                   selectedCount = count;
//                 });
//               },
// )))),


//                  Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'DIVISION ',
//                       hintText:  'NAME',
                      
//                     )
//                   ) 
//                 ),
 
//    Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'DEPARTMENT',
//                       hintText:  'NAME',
                      
//                     )
//                   ) 
//                 ),

//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'SCHEME',
//                       hintText:  'SCHEME NAME',
                      
//                     )
//                   ) 
//                 ),

//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'WORK NAME',
//                       hintText:  '',
                      
//                     )
//                   ) 
//                 ),


// Center( child:Padding(
//             padding:const EdgeInsets.all(16.0),
//      child:
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: const Text("Location of work" ,style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  
        
//                   )))),
                  
//                  Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Insert Block',
//                       hintText:  'NAME',
                      
//                     )
//                   ) 
//                 ),
 
//    Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Insert Panchayat',
//                       hintText:  'Panchayat NAME',
                      
//                     )
//                   ) 
//                 ),

//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   // ignore: prefer_const_constructors
//                   child:TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Village',
//                       hintText:  'Village Name',
                      
//                     )
//                   ) 
//                 ),

//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   // ignore: prefer_const_constructors
//                   child: TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'SELECT MLA CONSTITUENCY',
//                       hintText:  'MLA CONSTITUENCY',
                      
//                     )
//                   ) 
//                 ),

                
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   // ignore: prefer_const_constructors
//                   child: TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'SELECT MP CONSTITUENCY',
//                       hintText:  'MP CONSTITUENCY',
                      
//                     )
//                   ) 
//                 ),

Center( child:Padding(
            padding:const EdgeInsets.all(16.0),
     child:
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: const Text("Panel 4" ,style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  
        
                  )))),

Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  // ignore: prefer_const_constructors
                  child: TextFormField(
                    controller: admin_App_No,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid number';
              }
              return null;
            },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ADMINISTRATIVE APPROVAL NUMBER',
                      hintText:  'INSERT NUMBER',
                      
                    )
                  ) 
                ),
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: admin_App_Date,
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
                   labelText: 'ADMINISTRATIVE APPROVAL DATE ',
                  hintText: 'DD/MM/YYYY',

                ),
              ),  ),
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: work_Amount,
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
                   labelText: 'WORK AMOUNT ',
                  hintText: '0.00',

                ),
              ),  ),
              
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: work_Conti_Amount,
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
                   labelText: 'WORK CHARGE CONTIGENCY AMOUNT ',
                  hintText: '0.00',

                ),
              ),  ),


Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:admin_Sanction_Amount,
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
                   labelText: 'ADMINISTRATIVE SANCTION AMOUNT ',
                  hintText: '0.00',

                ),
              ),  ),

Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: treasury_Chno,
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
                   labelText: 'TREASURY CHALLAN NUMBER ',
                  hintText: '0',

                ),
              ),  ),

Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: treasury_Ch_date,
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
                   labelText: 'TREASURY CHALLAN DATE ',
                  hintText: 'DD/MM/YYYY',

                ),
              ),  ),

  // Container(
  //                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
  //                 child: TextFormField(
  //         keyboardType: TextInputType.phone,
  //           // The validator receives the text that the user has entered.
  //           validator: (msg) {
  //             if (msg == null || msg.isEmpty) {
  //               return 'Please enter valid amount';
  //             }
             
  //             return null;
  //           },
  //               decoration: const InputDecoration(
  //                 border: OutlineInputBorder(),
  //                  labelText: 'WORK AMOUNT FOR C.R ',
  //                 hintText: '00111',

  //               ),
  //             ),  ),


Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: current_Receipt_amount,
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
                   labelText: 'CURRENT RECEIPT AMOUNT',
                  hintText: '0.00',

                ),
              ),  ),

              
Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: current_Receipt_date,
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
                   labelText: 'CURRENT RECEIPT DATE ',
                  hintText: 'DD/MM/YYYY',

                ),
              ),  ),
              
               Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller:work_charge_amount,
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
                   labelText: 'WORK CHARGE FOR C.R ',
                  hintText: '0.00',

                ),
              ),  ),


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
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(content: Text('Processing Data')),
              //     );
              //   }
              // },
              child: const Text('Submit'),
            ),
          ),
        Container(
       padding: EdgeInsets.only(left:16.2, right:16.2),),
           ]
           
       )
      );
      }
}