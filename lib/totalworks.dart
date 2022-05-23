import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Tworks(),
    );
  }
}

class Tworks extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
     
      ),
      body:ListView(
          children: [
            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('Total work'),
              
            ),
            SizedBox(height: 9.0),
            
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("2349"),
            ),

            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('Building work'),
            ),
            SizedBox(height: 9.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("573"),
            ),


            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('Bridge work'),
            ),
            SizedBox(height: 9.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("4"),
            ),


            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('Road work'),
            ),
            SizedBox(height: 9.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("1157"),
            ),


            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('Stop damn work'),
            ),
            SizedBox(height: 9.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("00"),
            ),
            
            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('other work'),
            ),
            SizedBox(height: 9.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("468"),

            ),


            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('Completed work'),
            ),
            SizedBox(height: 9.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("1150"),
              
            ),
            
          ],
        ),
       
      
    );
  }
}
