import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp( home: LoginUI(),));
}
class LoginUI extends StatefulWidget {
  const LoginUI({super.key});
  @override
  _State createState() => _State();
}
class _State extends State<LoginUI> {
  final loginFC = TextEditingController();
  final passwordFC = TextEditingController();

  void loginMsg(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    if(passwordFC.text.isEmpty){
      scaffold.showSnackBar(
        SnackBar(
          content:  Text("Email or Password can't be empty"),
        ),
      );
    }else{
      scaffold.showSnackBar(
        SnackBar(
          content:  Text("Welcome back, " + loginFC.text),
          action: SnackBarAction(label: 'Okay',
              onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter DAY 7'),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: loginFC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: passwordFC,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your Password',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => loginMsg(context),
                  child: const Text("Login"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold)
                  ),
                ),
              ],
            )
        )
    );
  }
}



