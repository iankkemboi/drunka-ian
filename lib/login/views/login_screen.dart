import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drunka/login/model/user_repository.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat-Light', fontSize: 20.0);
  TextEditingController _email;
  TextEditingController _password;

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Login"),
      ),
      body: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _email,
                    validator: (value)=>
                    (value.isEmpty)? 'Please Enter Email': null,
                    style: style,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _password,
                    validator: (value)=>
                    (value.isEmpty)? 'Please Enter Password' : null,
                    style: style,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                user.status == Status.Authenticating
            ? Center(child: CircularProgressIndicator())
            : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    color: Colors.amber,
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(

                      onPressed: () async{
                        if(_formKey.currentState.validate()){
                          if(!await user.signIn(
                              _email.text,
                              _password.text))
                            _key.currentState.showSnackBar(SnackBar(
                              content: Text('Something went wrong'),
                            )
                            );
                        }
                      },
                      child: Text('LOGIN',
                      style: style.copyWith(
                       color: Colors.white
                      )),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}

