import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddhi_infotech/login%20user/login_user_screen.dart';
import 'package:siddhi_infotech/register%20user/register_user_screen.dart';


class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({Key? key}) : super(key: key);

  @override
  _LandingPageScreenState createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0.0,
        actions: [
          buildLanguageDropDown(),
        ],
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/landing image.png',height: 150,),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("For...",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),),
            ),

            buildButton(title: "Creators"),
            buildButton(title: "Companies"),
             Text("Already have an Account?",
              style: TextStyle(color: Colors.blueGrey.shade600,fontSize: 20,),
             ),

            GestureDetector(
              onTap: ()=>Get.to(()=>const LoginUserScreen()),
              child: RichText(text: TextSpan(
                  text: "LOGIN",
                  style: const TextStyle(color: Color(0xFFff345f),
                    decoration: TextDecoration.underline,
                    fontSize: 20,),
                children: [
                  TextSpan(
                    text: "  here",
                    style: TextStyle(color: Colors.blueGrey.shade600,
                      decoration: TextDecoration.none,
                      fontSize: 20,),

                  ),
                ]
              )),
            )


          ],
        ),
      ),
    );
  }

  buildButton({title}){
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: GestureDetector(
        onTap: ()=>Get.to(()=>const RegisterPageScreen()),
        child: Container(
          height: 70,width: size.width * 0.85,
          decoration: BoxDecoration(
            color:  const Color(0xFFff345f),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text("$title".toUpperCase(),style: const TextStyle(
            fontSize: 24,fontWeight: FontWeight.w700,
              color: Colors.white),)),

        ),
      ),
    );
  }

  String selectedLanguage = 'Eng';

  buildLanguageDropDown(){
    return DropdownButton<String>(
      value: selectedLanguage,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 3,
      style: const TextStyle(color: Colors.black),
      onChanged: (String? newValue) {
        setState(() {
          selectedLanguage = newValue!;
        });
      },
      items: <String>['Eng', 'Hindi', 'Gujarati',]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
