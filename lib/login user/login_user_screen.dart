import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddhi_infotech/Home%20Page/get_offerlis_tapi.dart';
import 'package:siddhi_infotech/Home%20Page/home_page_screen.dart';
import 'package:siddhi_infotech/landing_page/landing_page_screen.dart';
import 'package:siddhi_infotech/login%20user/login_api.dart';
import 'package:siddhi_infotech/register%20user/register_user_api.dart';
import 'package:siddhi_infotech/register%20user/textfields_widgets.dart';

import 'login_user_model.dart';


class LoginUserScreen extends StatefulWidget {
  const LoginUserScreen({Key? key}) : super(key: key);

  @override
  _LoginUserScreenState createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends State<LoginUserScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool termCondition = false;

  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: false,
            child: Form(
              key: _globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Image.asset('assets/landing image.png',height: 180,),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldsWidgetsState.buildEmailTextField(context, emailController: emailController),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldsWidgetsState.buildPasswordTextField(context,text: "Enter Password", passwordController: passwordController),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("Forget Password?",
                          style: TextStyle(color: Color(0xFFff345f),fontSize: 20,),
                        ),
                      ],
                    ),
                  ),

                  CheckboxListTile(
                    title:  Text("I accept Term & Conditions",
                      style: TextStyle(color: Colors.blueGrey.shade600,fontSize: 20,),
                    ),

                    value: termCondition,
                    onChanged: (bool? value){
                      setState(() {
                        termCondition = value!;
                      });
                    },

                  ),

                  buildButton(title: "Login")

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  buildButton({title}){
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: GestureDetector(
        onTap: (){
          if(_globalKey.currentState!.validate() && termCondition){
            LoginUserAPI.loginUser(
              email: emailController.text,
              password: passwordController.text,
            )
                .then((value){
              final LoginUserModel result = value;
              if(result.data.message == "Login Successfull."){
                //GetOfferListAPI.getOfferListApi(token: result.data.token,);
                Get.offAll(HomePageScreen(token: result.data.token,
                  uname: result.data.user.firstName +" "+ result.data.user.firstName,));
              }
              buildSnackBar(message: result.data.message);
            });
          }

        },
        child: Container(
          height: 55,width: size.width * 0.8,
          decoration: BoxDecoration(
            color:  termCondition ? const Color(0xFFff345f) : const Color(0xfff1a5b5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text("$title".toUpperCase(),style: const TextStyle(
              fontSize: 20,fontWeight: FontWeight.w700,
              color: Colors.white),)),

        ),
      ),
    );
  }



  buildSnackBar({message, color, action, label}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 8),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      content: Text(
        message, maxLines: 2,softWrap: true,
        style: const TextStyle(fontSize: 22,),
      ),
    ));
  }



}
