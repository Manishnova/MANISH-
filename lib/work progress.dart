import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main()
{
   runApp( MaterialApp(
     debugShowCheckedModeBanner: false,
       title: 'Work Progress',
       home: CameraProgress(),
       theme: ThemeData(primarySwatch: Colors.purple),
     ),
 
       );
}

class CameraProgress extends StatefulWidget {
  
  @override
 
  _CameraProgress createState() => _CameraProgress();
  

}

class _CameraProgress extends State<CameraProgress> {
   

List<String> country = ["Building-Construction","culvert construction","Soil Muram / CC- Road Construction","Pond construction and deepening work","Road Construction"];
 
List<String> building = ['Before the commencement of survey level work','foundation completed/Plinth','chair work done','electrification/sanitary work','Linter completed','plaster floor work completed','Roofing work completed','Completion certificate '];
List<String> culvert = ['Before the commencement of survey level work','Foundation excavation completed','Foundation work Completed','Abutment complete'
'Wing wall-completed','slab work completed','100% work done','Completion certificate issued'];
List<String> soil = ['Before the commencement of survey level work','50% soil work completed','100% soil work completed','50% Murum work Completed','100% Murum work Completed','Bridge or culvert construction','Completion certificate issued'];
List<String> pond = ['Before the Commencement of the work','20% work done','40% work done','60% work done','80% work done','100% work done',"Completion certificate issued"];
List<String> road = ['Before the commencement of survey level work','50% soil work completed','100% soil work completed','50% Murom work completed','100%Murom work completed','100% work done','Completion certificate issued'];

List<String> provincy = [];
  String? selectedCountri;
  String? selectedProvincy;

List<String> count = ['पूर्ण', 'अपूर्ण', 'आरंभ','नीरस्त'];
  List<String> india = [''];
  List<String> usa = [''];
  
  List<String> prov = [];
  String? selectedCount;
  String? selectedProv;

List<String> coun = ['भौतिक अपूर्ण/वित्तीय अपूर्ण', 'भौतिक पूर्ण/वित्तीय अपूर्ण','भौतिक पूर्ण/वित्तीय पूर्ण'];
  List<String> indi = [''];
  List<String> us = [''];
  
  List<String> pro= [];
  String? selectedCoun;
  String? selectedPro;
 


late ScrollController _scrollController;

  var imageFile;



 

  
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }
 
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Work Progress '),  
    ),
    
     
     body:
     
     ListView(
       padding: EdgeInsets.symmetric(horizontal: 25.0),
          children: [ 
 
    Center(
          child:Padding(
            padding:const EdgeInsets.all(16.0),
     child:
        Container(
       padding: EdgeInsets.only(left:16.2, right:16.2),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child:
            DropdownButton<String>(
            hint: Text('कार्य के प्रकार'),
            value: selectedCountri,
            isExpanded: true,
            items: country.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (country) {
              if (country == 'Building-Construction') {
                provincy = building;
              } else if (country == 'culvert construction') {
                provincy = culvert;
              } 
               else if (country == 'Soil Muram / CC- Road Construction') {
                provincy = soil;
              } 
              else if (country == 'Pond construction and deepening work') {
                provincy = pond;
              } 
              else if (country == 'Road Construction') {
                provincy = road;
              } 
              else {
                provincy = [];
              }
                setState(() {
                selectedProvincy = null;
                selectedCountri = country;
              });
              
            },
          ),))),
         Center(
          child:Padding(
            padding:const EdgeInsets.all(16.0),
     child: Container(
       padding: EdgeInsets.only(left:16.2, right:16.2),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child:
          DropdownButton<String>(
            hint: Text('कार्य की स्थिति'),
            value: selectedCount,
            isExpanded: true,
            items: count.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (count) {
              if (count == 'ENC') {
                prov = usa;
              } else if (count == 'EE') {
                prov = india;
              } else {
                prov = [];
              }
              setState(() {
                selectedProv = null;
                selectedCount = count;
              });
            },
          ),),)),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),),

    Center(
          child:Padding(
            padding:const EdgeInsets.all(16.0),
     child: Container(
       padding: EdgeInsets.only(left:16.2, right:16.2),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child:
       DropdownButton<String>(
            hint: Text('कार्य की प्रगति'),
            style: TextStyle(fontSize: 16),
            value: selectedProvincy,
            isExpanded: true,
            items: provincy.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (provincy) {
              setState(() {
                selectedProvincy = provincy;
              });
            },
          ),))),

Center(
          child:Padding(
            padding:const EdgeInsets.all(16.0),
     child: Container(
       padding: EdgeInsets.only(left:16.2, right:16.2),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child:
          DropdownButton<String>(
            hint: Text('प्रगति की स्थिति'),
            value: selectedCoun,
            isExpanded: true,
            items: coun.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (coun) {
              if (coun == 'ENC') {
                pro = us;
              } else if (coun == 'EE') {
                pro = indi;
              } else {
                pro = [];
              }
              setState(() {
                selectedPro = null;
                selectedCoun = coun;
              });
            },
          ),),)),
          
      Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),),

          
         
          Container(
            child: imageFile == null
                ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.greenAccent,
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text("PICK FROM GALLERY"),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Colors.lightGreenAccent,
                    onPressed: () {
                      _getFromCamera();
                    },
                    child: Text("PICK FROM CAMERA"),
                  )
                ],
              ),
            ): Container(
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            )),

 Center(
          child:Padding(
            padding:const EdgeInsets.all(16.0),
     child: Container(
       padding: EdgeInsets.only(left:16.2, right:16.2),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child:
        
             Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Remarks ',
                  hintText: '01/01/2000',
                ))
                ),
              ),  
            )),
       
             ListTile(
               
          title: Row(
            
            children: <Widget>[
              Expanded(child: RaisedButton(onPressed: () {},
               shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
              child: Text("Clear"),
              color: Colors.pinkAccent,textColor: Colors.white,)),
              Expanded(child: RaisedButton(onPressed: () {
                
              },
                shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  
              child: Text("SUBMIT"),color: Colors.orangeAccent,textColor: Colors.white,)),
            ],
          )

             ),
            
          ]
          )
          );
            
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
          });
    }
  }
}