import 'package:flutter/material.dart';

void main()
{ runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
       title: 'ForgotPassword',
       home: ForgotPassword(),
       theme: ThemeData(primarySwatch: Colors.purple),
     ),

       );
}
class ForgotPassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var passwordController;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("RESET YOUR PASSWORD"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(

                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      
                      errorStyle: TextStyle(color: Color.fromARGB(255, 14, 13, 13)),
                      labelStyle: TextStyle(color: Color.fromARGB(255, 22, 21, 21)),
                      hintStyle: TextStyle(color: Color.fromARGB(255, 22, 20, 20)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 17, 16, 16)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 10, 9, 9)),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 14, 7, 7)),
                      ),
                    ),
                  ),
                  
                  
              TextFormField(

                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Phone no.',
                      icon: Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      
                      errorStyle: TextStyle(color: Color.fromARGB(255, 12, 10, 10)),
                      labelStyle: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                      hintStyle: TextStyle(color: Color.fromARGB(255, 10, 9, 9)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 12, 11, 11)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 10, 10, 10)),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 10, 9, 9)),
                      ),
                    ),
                  ),
                  
              Container(
              alignment: Alignment.center,
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Send mail'),
                  onPressed: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              }
                )
            ),// 
 Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter new Password',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'confirm new Password',
                ),
              ),
            ),


            Container(
              alignment: Alignment.center,
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign in'),
                  onPressed: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              }
                )
            ),
            ],
          ),
        ),
      ),
    );
  }
}
