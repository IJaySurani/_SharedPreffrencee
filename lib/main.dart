import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firstpage.dart';
import 'homepage.dart';

void main() {
  runApp(MaterialApp(
    home: sharedprefrensss(),
    debugShowCheckedModeBanner: false,

  ));
}

class sharedprefrensss extends StatefulWidget {
  const sharedprefrensss({Key? key}) : super(key: key);

  @override
  State<sharedprefrensss> createState() => _sharedprefrensssState();
}

class _sharedprefrensssState extends State<sharedprefrensss> {


  var check=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkmail();
  }

  checkmail()
  async {
    final prefs = await SharedPreferences.getInstance();

    check = prefs.getBool('repeat')!;


    print('123$check');

    if (check == true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return firstpage();
      },));
    }

  }





  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sharedpreferens'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'email',
                hintText: 'Enter mail'),
          ),
          SizedBox(
            height: 35,
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
                hintText: 'Enter password'),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(onPressed: () async {
            final prefs = await SharedPreferences.getInstance();

            final String? lmail = prefs.getString('mail');
            final String? lpassword = prefs.getString('password');

            print('123$lmail');
            print('123$lpassword');

            if (lmail == email.text && lpassword == password.text) {
              await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return firstpage();
                },
              ));
            }

            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return homepage();
              },
            ));

          }, child: Text('Login')),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {


              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return homepage();
                },
              ));
            },
            child: Text(
              'create account',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
