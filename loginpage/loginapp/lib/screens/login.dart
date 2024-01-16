import 'package:flutter/material.dart';
import 'package:loginapp/main.dart';
import 'package:loginapp/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screenlogin  extends StatefulWidget {
   const Screenlogin({super.key});

  @override
  State<Screenlogin> createState() => _ScreenloginState();
}

class _ScreenloginState extends State<Screenlogin> {
 final _usernameController =TextEditingController();

 final _passwordController =TextEditingController();
 bool _isDataMatched =true;
 final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 182, 179, 179),
      
      appBar: AppBar(
        title:const Center(child: Text('Login Page'),),
      ),
      
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
               color:const Color.fromARGB(255, 209, 207, 229),
              ),
             
              height: 300,
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                       validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Enter a username ';
                        }else{
                          return null;
                        }
                      },
                     
                    ),
                   const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Enter the pasword';
                        }else{
                          return null;
                        }
                      },
                    ),
                     const     SizedBox(
                      height: 20,
                    ),
                        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: !_isDataMatched,
                          child:const Text(
                            'user name password doesnot match',
                            style: TextStyle(fontSize: 13,color: Colors.red),
                            ),
                            ),
                        ElevatedButton.icon(
                         
                         onPressed: (){
                         if(_formkey.currentState!.validate())
                         {
                           checklogin(context);
                           checklogin1(context);
                         }else{
                          //  print('Data empty');
                         }
                         
                         
                         // checklogin(context);
                          },

                        icon: const Icon(Icons.check),
                        label:const Text('Login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

  void checklogin(BuildContext ctx) async{
    final _username= _usernameController.text;
    final _password= _passwordController.text;
    if(_username == 'febin' && _password == '0000'){
      //go to home
      final _sharedprefs =await  SharedPreferences.getInstance();   
     await _sharedprefs.setBool(save_key_name, true); 
       Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>ScreenHome()));
        print('username password match');

    }else{
     setState(() {
       _isDataMatched=true;
     });

        print('username password dosnot matc');


    }
  }
  void checklogin1(BuildContext ctx) async{
    final _username= _usernameController.text;
    final _password= _passwordController.text;
    if(_username == 'noufan' && _password == '1234'){
      //go to home
      final _sharedprefs =await  SharedPreferences.getInstance();   
     await _sharedprefs.setBool(save_key_name, true); 
       Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>ScreenHome()));
        print('username password match');

    }else{
     setState(() {
       _isDataMatched=false;
     });

        print('username password dosnot matc');


    }
  }
}