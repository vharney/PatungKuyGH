import 'package:flutter/material.dart';
import 'package:patungkuy/services/auth.dart';
import 'package:patungkuy/shared/constants.dart';
import 'package:patungkuy/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        title: Text('Sign up to PatungKuy'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            }
          )
        ]
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email!' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;                    
                  });
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Enter a password of at least 6 characters!' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;                    
                  });
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  //only when null is returned this returns true
                  if (_formKey.currentState.validate()) {
                    setState((){
                      loading = true;
                      userEmail = email;
                    });
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Please supply a valid email!';
                        loading = false;
                        });
                    } 
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(error, 
                style: TextStyle(
                color: Colors.red, fontSize: 14.0
                )
              ),
            ]
          )
        )
      ),
    );
  }
}