import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveapp/pages/home_page.dart';
import 'package:hiveapp/services/db_service.dart';

import '../model/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController parolController = TextEditingController();
  
   bool isLogin =false;


  _login() {

    String email = emailController.text;
    String parol = parolController.text;

    var box = Hive.box("nem_nig");
    
    User user = User(email: email,parol: parol);

    HiveDB().saveUser(user);
    User dbUser = HiveDB().getUser();


     print(dbUser.email);
     print(dbUser.parol);

   setState(() {
     isLogin = true;
   });
    box.put("isLogin",isLogin);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],

            decoration: const InputDecoration(
              labelText: "Email",
              icon: Icon(Icons.email),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: parolController,
            decoration: const InputDecoration(
              hintText: "parol",
              icon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _login();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child: const Text("Login"),),
              Text(Hive.box("nem_nig").get("email")??""),
        ]),
      ),
    );
  }
}
