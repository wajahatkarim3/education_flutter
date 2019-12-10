import 'package:flutter/material.dart';
import 'choose_subjects.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        buttonColor: Colors.green
      ),
      home: Login()
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Scaffold(
            body: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 50, bottom: 50),
                          child: Icon(
                            Icons.book,
                            color: Colors.green,
                            size: 100.0,
                          ),
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "Username",
                                border: OutlineInputBorder()
                            ),
                          ),
                          padding: EdgeInsets.all(20),
                        ),
                        Container(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder()
                            ),
                          ),
                          padding: EdgeInsets.only(left: 20, right: 20),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 30),
                            child: MaterialButton(
                                child: Text("Login", style: TextStyle(color: Colors.white),),
                                color: Colors.green,
                                padding: EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
                                onPressed: () {
                                  Route route = MaterialPageRoute(builder: (context) => ChooseSubjects());
                                  Navigator.push(context, route);
                                }
                            )
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Forgot Password?"),
                              Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text("Reset Here",
                                    style: TextStyle(
                                      color: Colors.green,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Don't have an account?"),
                                    Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("Register Here",
                                          style: TextStyle(
                                            color: Colors.green,
                                            decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                )
            )
        );
      }
    );
  }
}