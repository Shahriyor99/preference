import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preference/model/user_model.dart';
import 'package:preference/pages/sign_page.dart';
import 'package:preference/servic/prefs+servic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static final String id="HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();

  void _doLogIn(){
    String _email=_emailController.text.toString().trim();
    String _password=_passwordController.text.toString().trim();

    User user=User.from(email: _email, password: _password);

    Prefs.storeUser(user);

    Prefs.loadUser().then((user) => {
      print(user?.email)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 55,),

              //#header
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/ic_login.jpg"),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Text("Welcome back!", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                    SizedBox(height: 8,),
                    Text("Log in to your existant account of Q Allure", style: TextStyle(color: Colors.grey, fontSize: 10),),
                    SizedBox(height: 25,),
                  ],
                ),
              ),

              //#body
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    //#email
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person,color: Colors.grey,),
                          hintText: "email",
                          helperStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    //#password
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock,color: Colors.grey,),
                          hintText: "password",
                          helperStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    //#forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            print("Forgot Password ishladi!");
                          },
                          child: Text("Forgot Password?",style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),

                    //#login
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 80),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: FlatButton(
                        onPressed: (){
                          _doLogIn();
                        },
                        child: Text("LOG IN",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                      ),
                    ),

                    SizedBox(height: 40,),

                    //#connect using
                    Text("Or connect using", style: TextStyle(color: Colors.grey),),

                    SizedBox(height: 20,),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 44,
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 25),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade700,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FlatButton(
                              onPressed: (){
                                print("Facebook button ishladi!");
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.facebook_outlined, color: Colors.white,),
                                  SizedBox(width: 8,),
                                  Text("Facebook", style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 25,),
                        Expanded(
                          child: Container(
                            height: 44,
                            width: double.infinity,
                            margin: EdgeInsets.only(right: 25),
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FlatButton(
                              onPressed: (){
                                print("Google button ishladi!");
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("G", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(width: 8,),
                                  Text("Google", style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 50,),

                    //#sign up
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",style: TextStyle(color: Colors.grey),),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, SignPage.id);
                          },
                          child: Text("Sign Up", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
