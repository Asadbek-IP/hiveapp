import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController parolController = TextEditingController();

  _login() {

    String email = emailController.text;
    String parol = parolController.text;

    var box = Hive.box("nem_nig");
    
    //saqlash
    box.put("email", email);
    box.put("parol",parol);


    //olish
    print(box.get("email"));
    print(box.get("parol"));
    
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
              },
              child: const Text("Login")),
              Text(Hive.box("nem_nig").get("email")??" ")
        ]),
      ),
    );
  }
}
