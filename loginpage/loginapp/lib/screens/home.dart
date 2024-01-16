import 'package:flutter/material.dart';
import 'package:loginapp/screens/chat.dart';
import 'package:loginapp/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Center(child: Text('Home')),
        actions: [
         IconButton(onPressed:(){
          
          showDialog(context:context, builder: (BuildContext context){
            return AlertDialog(
              title: const Text('Are you sure logout'),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text('cancel')),
                TextButton(onPressed: (){
                    singout(context);
                }, child: const Text('OK'))
              ],
            );

          });
         }, 
         icon:const Icon(Icons.exit_to_app)),
        //  IconButton(onPressed: (){
        //   gotochatscreen(context);
        //  }, icon: Icon(Icons.chat_sharp)),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(itemBuilder: (ctx,index){
    // var _tapCallback;
    return      ListTile(
           title: Text('person$index'),
           subtitle: Text('message $index'),
           leading: index%2==0?const CircleAvatar(radius: 30,
           backgroundColor: Colors.green,
           backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png'),
           ):const ClipRRect(
  child: CircleAvatar(
    radius: 30, // Adjust the radius as needed
    backgroundImage: NetworkImage('https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg'), // Provide your image URL here
    backgroundColor: Colors.transparent, // Make sure the background is transparent
    child: Image(
      image: NetworkImage('https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg'), // Same image as above
      fit: BoxFit.cover, // Change the BoxFit to your desired value (e.g., BoxFit.fill, BoxFit.contain, etc.)
    ),
  ),
)
,
           trailing: Text('$index : 00 pm'),

           onTap: () => gotochatscreen(context),
         );
        }
        , separatorBuilder: (ctx,index){
         return const Divider();
        },
        itemCount: 30),
         

      
      ),
    );
  }
  singout(BuildContext ctx) async
  {
    final _sharedprefs =await  SharedPreferences.getInstance();   
    await _sharedprefs.clear();
     Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=>Screenlogin()), (route) => false);
  }
  gotochatscreen(BuildContext ctx){
    Navigator.push(
    ctx,
    MaterialPageRoute(builder: (context) =>const Screenchat()),
  );
  }
}