import 'package:flutter/material.dart';
import 'package:prjctlog/homescreen.dart';
import 'package:prjctlog/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _namectroler = TextEditingController();
  final _passwordctroler = TextEditingController();
  final _SINGUPkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
            child: Text(
          'LOGIN SCREEN',
          style: TextStyle(color: Color.fromARGB(255, 241, 217, 217)),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _SINGUPkey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _namectroler,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'not valid';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_4),
                      label: Text(
                        'ENTER NAME',
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _passwordctroler,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'not valid';
                    }
                    return null;
                  },
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      label: const Text(
                        'ENTER  PASSWORD',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_SINGUPkey.currentState!.validate()) {
                        checkLogin(context);
                      } else {
                        print('data empty');
                      }
                    },
                    child: const Text('LOGIN')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(context) async {
    final _username = _namectroler.text;
    final _password = _passwordctroler.text;

    if (_username == 'shibil' && _password == 'asas') {

      //shared pre
      final _sharedPref = await SharedPreferences.getInstance();
      await _sharedPref.setBool(SAVE_KEY, true);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    } else {
      showDialog(
          context: context,
          builder: (ctx1) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('User passward doesnot match'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: const Text('close'),
                )
              ],
            );
          });
    }
  }
}
