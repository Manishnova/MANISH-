import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'forgot.dart';
import 'main.dart';
import 'physical.dart';
import 'work progress.dart';
import 'newwork.dart';

 void main()
 {
   runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Home',
       home: MyHomePage(),
       theme: ThemeData(primarySwatch: Colors.purple),
     ),

       );
 }
 
class MyHomePage extends StatelessWidget{
  
  @override

  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      
      body:
       ListView(
         padding: EdgeInsets.zero,
          children: <Widget>[UserAccountsDrawerHeader( 
              accountName: Text("Chhattishgarh , Raipur"),
              accountEmail: Text (""),
               currentAccountPicture: CircleAvatar(
                 backgroundImage: NetworkImage
              ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV7o7kJOANYRdguji8LBAwnMOSOGBMMC1VYA&usqp=CAU"),
          ),),
            
            
             ListTile(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              selected: true,
              selectedTileColor: Colors.grey[300],
              leading: Icon(Icons.dashboard),
              title: const Text('DashBoard'),
               tileColor: Color.fromARGB(255, 15, 161, 137),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserMain()),
                );
                
                
              },
            ),
            
ListTile(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              selected: true,
              selectedTileColor: Colors.grey[300],
              leading: Icon(Icons.create_rounded),
              title: const Text('Create new Work'),
               tileColor: Color.fromARGB(255, 15, 161, 137),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const NewPage(title: 'home',))
                );
                
                
              },
            ),
            

            
            ListTile(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              selected: true,
              selectedTileColor: Colors.grey[300],
              leading: Icon(Icons.terrain_sharp),
              title: const Text('Physical progress'),
              tileColor: Color.fromARGB(255, 15, 161, 137),

            
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhysicalProgress()),
                  );
              },
            ),

            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              selected: true,
              selectedTileColor: Colors.grey[300],
             leading: Icon(Icons.work),
              title: const Text('Work Progress'),
               tileColor: Color.fromARGB(255, 15, 161, 137),
              onTap: () {
              
                    // Update the state of the app
                // ...
                // Then close the drawer
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CameraProgress()),
                  );
              },
            ),

            ListTile(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              selected: true,
              selectedTileColor: Colors.grey[300],
              leading: Icon(Icons.password),
              title: const Text('Change password'),
               tileColor: Color.fromARGB(255, 15, 161, 137),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
              }
            ),

            ListTile(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              selected: true,
              selectedTileColor: Colors.grey[300],
              leading: Icon(Icons.login),
              title: const Text('Logout'),
               tileColor: Color.fromARGB(255, 15, 161, 137),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>FirstHomePage()),
                );
              }
            
            ),
          
           

          ]
       )
    );
          
 

  }
}


