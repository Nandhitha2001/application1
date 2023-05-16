import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class application extends StatefulWidget {
  const application({Key? key}) : super(key: key);

  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {

  final TextEditingController mail = TextEditingController();
  final TextEditingController password = TextEditingController();
  Future<String?> login(
  {
  required String email,
    required String password,
}
      )
  async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    }
    on FirebaseAuthException catch(e)
    {
      if(e.code=='user-not-found')
        {
          return 'No user  found for that email';
        }
      else if(e.code=='wrong-password'){
        return'Wrong password provided for that user';
      }
      else{
        return e.message;
      }
    }
    catch(e){
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(border: OutlineInputBorder(),
                fillColor: Colors.cyan,
                filled: true,hintText: "Username/Mail"),),
            SizedBox(height: 10,),
            TextField(decoration: InputDecoration(border: OutlineInputBorder(),
                fillColor: Colors.cyan,
                filled: true,hintText: "Password"),),
            SizedBox(height: 10,),
            TextButton(onPressed: (){}, child: Text("submit",style: TextStyle(color: Colors.white)),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),),
          ],

        ),
      ),

    );
  }
}

