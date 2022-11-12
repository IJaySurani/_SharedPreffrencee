import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create account'),
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
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                var fmail = email.text;
                var fpassword = password.text;
                final prefs = await SharedPreferences.getInstance();

                await prefs.setString('mail', '$fmail');
                await prefs
                    .setString('password', '$fpassword')
                    .then((value) => print('login success'));

                await prefs.setBool('repeat', true);

                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return sharedprefrensss();
                  },
                ));
              },
              child: Text('login'))
        ],
      ),
    );
  }
}
