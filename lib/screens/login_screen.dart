import 'package:flutter/material.dart';
import 'package:form_validation/mixins/validator_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidatorMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('EMAIL'),
                  hintText: "Enter your email address",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                //initialValue: '@example.com',
                validator: validateEmail,
                onSaved: (newValue) {
                  email = newValue!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('PASSWORD'),
                  hintText: "Enter your  password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                ),
                validator: validatePassword,
                onSaved: (newValue) => password = newValue!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  maximumSize: const Size(150, 60),
                  minimumSize: const Size(120, 50),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    print("your email: $email and password: $password ");
                    var snackBar = const SnackBar(content: Text('Submited'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.done,
                      size: 32,
                    ),
                    Text(
                      'Submit',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
