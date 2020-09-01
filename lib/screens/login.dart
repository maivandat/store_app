import 'package:flutter/material.dart';
import 'package:store_app/animation/FadeAnimation.dart';
import 'package:store_app/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/store_bloc.dart';
import 'package:store_app/bloc/store_event.dart';
import 'package:store_app/bloc/store_state.dart';
import 'package:store_app/screens/home.dart';
import 'package:store_app/utils/validators.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  User user;
  String _email;
  String phone;
  String _password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill
                )
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(1, Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png')
                        )
                      ),
                    ),
                  )),
                  Positioned(
                    left: 160,
                    width: 80,
                    height: 100,
                    child: FadeAnimation(1.3, Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/light-2.png')
                          )
                      ),
                    )),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 100,
                    child: FadeAnimation(1.5, Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/clock.png'),
                          )
                      ),
                    )),
                  ),
                  Positioned(
                    child: FadeAnimation(1.6, Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      ),
                    )),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: BlocBuilder<StoreBloc, StoreState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        FadeAnimation(1.8, Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO((143), 148, 251, .1),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10)
                                  )
                                ]
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(color: Colors.white,),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "Email or Phone number",
                                      ),
                                      validator: (value) {
                                        if(!validateEmail(value)) {
                                          return "Email is not valid";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        _email = value;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(color: Colors.white,),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "Password",
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if(!validatePassword(value)) {
                                          return "Invalid password";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        _password = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                        )),
                        SizedBox(height: 30,),
                        FadeAnimation(1.5,
                            Text("Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, .6),
                                  fontWeight: FontWeight.bold),
                            )
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: () {
                            if(!_formKey.currentState.validate()) {
                              return;
                            } else {
                              _formKey.currentState.save();
                              if(state is StoreInitial) {
                                BlocProvider.of<StoreBloc>(context)
                                    .add(StoreLoginRequested(email: _email, password: _password));
                              }
                              if(state is StoreLoadSuccess) {
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => Home())
                                );
                              }
                            }
                          },
                          child: FadeAnimation(2, Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6)
                                    ]
                                )
                            ),
                            child: Center(
                              child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                        ),
                        SizedBox(height: 50,),
                        FadeAnimation(2.2,
                            Text("Create Account",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, .6),
                                  fontWeight: FontWeight.bold),
                            )
                        ),
                      ],
                    );
                  },
                )
            )
          ],
        ),
      )
    );
  }
}
