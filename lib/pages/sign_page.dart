import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preference/model/user_model.dart';
import 'package:preference/pages/home_page.dart';

import '../servic/prefs+servic.dart';

class SignPage extends StatefulWidget {
  static final String id="SignPage";

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  final _nameController=TextEditingController();
  final _emailController=TextEditingController();
  final _phoneController=TextEditingController();
  final _passwordController=TextEditingController();
  final _confirmPasswordController=TextEditingController();

  void _create(){
    String _name=_emailController.text.toString().trim();
    String _email=_emailController.text.toString().trim();
    String _phone=_passwordController.text.toString().trim();
    String _password=_emailController.text.toString().trim();
    String _confirmPassword=_passwordController.text.toString().trim();

    User user=User(name: _name, email: _email, phone: _phone, password: _password, confirmPassword: _confirmPassword);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 65,),

              //#icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.west_rounded),
                  ),
                ],
              ),

              SizedBox(height: 40,),

              //#text
              Text("Let's Get Started!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),

              SizedBox(height: 20,),

              Text("Create an account to Q Allure to get all featyres", style:  TextStyle(color: Colors.grey),),

              SizedBox(height: 40,),

              //#name
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
                  controller: _nameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person,color: Colors.grey,),
                    hintText: "name",
                    helperStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 20,),

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
                    icon: Icon(Icons.email_outlined,color: Colors.grey,),
                    hintText: "email",
                    helperStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              //#phone
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
                  controller: _phoneController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone_android,color: Colors.grey,),
                    hintText: "Phone",
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
                    icon: Icon(Icons.lock_open_sharp,color: Colors.grey,),
                    hintText: "Password",
                    helperStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              //#confirm password
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
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock_open_sharp,color: Colors.grey,),
                    hintText: "Confirm Password",
                    helperStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 40,),

              //#create button
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
                    _create();
                  },
                  child: Text("CREATE",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                ),
              ),

              SizedBox(height: 55,),

              //#login
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",style: TextStyle(color: Colors.grey),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text("Login here", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
