import 'package:flutter/material.dart';
import 'package:loginapp/main.dart';
import 'package:loginapp/screens/home.dart';
import 'package:loginapp/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screensplash extends StatefulWidget {
  const Screensplash({super.key});

  @override
  State<Screensplash> createState() => _ScreensplashState();
}

class _ScreensplashState extends State<Screensplash> {
   @override
  void initState() {
checkuserloggedin();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Image.asset('assets/images/Screenshot_2023-09-13_115200-removebg-preview.png',height: 250,),
      ),
    );    
  }
      
 
  Future<void> gotologin() async{
   await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx)=>Screenlogin(),
      ),);
  }
  Future<void> checkuserloggedin() async{
   final _sharedprefs =await SharedPreferences.getInstance();

 final _userloggedin= _sharedprefs.getBool(save_key_name);
     if(_userloggedin==null||_userloggedin==false){
         gotologin();      
     }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=> ScreenHome()));
     }
    }
}