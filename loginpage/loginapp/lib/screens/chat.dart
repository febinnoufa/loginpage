import 'package:flutter/material.dart';
import 'package:loginapp/screens/home.dart';

class Screenchat extends StatelessWidget {
  const Screenchat({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
       body: SafeArea(
        
        child: ListView.separated(itemBuilder: (ctx,index){
    var  _tapCallback;
    return      Column(
      children: [
        Container(
          color: Color.fromARGB(255, 151, 144, 114),
          child: ListTile(
            
                   
                  title: Center(child: Text('person$index')),
                 subtitle:const Center(child: Text('online')),
                  leading:const CircleAvatar(radius: 25,
                  backgroundColor: Colors.green,
                  
                  backgroundImage: NetworkImage(
                    
                    'https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png'),
                  ),
                  trailing: IconButton(onPressed: (){
                      gotohomescreen(context);
                  }, icon:const  Icon(Icons.arrow_back_ios)),
        
                  onTap: () => _tapCallback,
                ),
        ),
        const SizedBox(height: 625,),
        Container(
          
          
          color:const Color.fromARGB(255, 187, 184, 184),
          child: ListTile(
            title:TextFormField(
              decoration:const InputDecoration(
                hintStyle: TextStyle(fontFamily: AutofillHints.addressState),
                hintText: 'Type A Massage'
              ),
            ) ,
            leading:const Icon(Icons.file_present),
            trailing:const Icon(Icons.keyboard_voice),
          ),
        )
      ],
    );

    
    
        }
        , separatorBuilder: (ctx,index){
          return const Divider();
        },
         itemCount: 1)
      
      ),
    );
  }
  gotohomescreen(BuildContext ctx){
    Navigator.push(
    ctx,
    MaterialPageRoute(builder: (context) =>const ScreenHome()),
  );
  }
 
}