import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'loginScreen.dart';

class SignUpPage extends StatefulWidget {
  static String route = '/sign-up';
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = '';
  String password = '';
  String password2 = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _hidePassword2 = true;

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: const Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Echo',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Roboto',
                color: Colors.cyan,
              ),
            ),
            TextSpan(
              text: 'Health',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );

    final loginLabel = FlatButton(
      child: Text(
        'Already have an account? Sign in',
        style: TextStyle(
            color: Colors.black54, decoration: TextDecoration.underline),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(LoginPage.route);
      },
    );

    Widget _signupBody() {
      return SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  logo,
                  SizedBox(height: 32.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    initialValue: 'test@test.com',
                    validator: (val) => val.isEmpty || val != 'test@test.com'
                        ? 'Enter a valid email'
                        : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    autofocus: false,
                    initialValue: 'admin123',
                    obscureText: _hidePassword,
                    validator: (val) =>
                        val != 'admin123' ? 'Enter valid password' : null,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: (_hidePassword)
                            ? Icon(Icons
                                .remove_red_eye) //remove_red_eye outline doesnt exist for me, changing for now
                            : Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                      ),
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    autofocus: false,
                    initialValue: 'admin123',
                    obscureText: _hidePassword2,
                    validator: (val) =>
                        val != password ? 'Password does not match' : null,
                    onChanged: (val) {
                      setState(() {
                        password2 = val;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: (_hidePassword2)
                            ? Icon(Icons.remove_red_eye)
                            : Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            _hidePassword2 = !_hidePassword2;
                          });
                        },
                      ),
                      hintText: 'Re-enter password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  SizedBox(
                    height: 48,
                    width: 450,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).pushNamed(HomePage.route);
                        }
                      },
                      padding: EdgeInsets.all(12),
                      color: Colors.cyan,
                      child: Text('Register',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  // errorLabel,
                  loginLabel,
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(backgroundColor: Colors.white, body: _signupBody());
  }
}
