import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddhi_infotech/login%20user/login_user_screen.dart';
import 'package:siddhi_infotech/register%20user/register_user_api.dart';
import 'package:siddhi_infotech/register%20user/textfields_widgets.dart';


class RegisterPageScreen extends StatefulWidget {
  const RegisterPageScreen({Key? key}) : super(key: key);

  @override
  _RegisterPageScreenState createState() => _RegisterPageScreenState();
}

class _RegisterPageScreenState extends State<RegisterPageScreen> {
  
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController instaNameController = TextEditingController();

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
                    child:buildProfileId(),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                      SizedBox(
                        width: size.width * 0.46,
                        child:TextFieldsWidgetsState.buildNameTextField(context,text: "First Name", nameController: firstnameController),
                      ),
                      SizedBox(
                        width: size.width * 0.46,
                        child: TextFieldsWidgetsState.buildNameTextField(context,text: "Last Name", nameController: lastnameController),
                      ),


                    ]),
                  ),

                  TextFieldsWidgetsState.buildEmailTextField(context, emailController: emailController),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color:   Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      width: size.width * 0.95,
                      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: buildGenderDropDown(),
                      ) ),
                  ),

                  TextFieldsWidgetsState.buildAddressTextField(context, addressController),

                  TextFieldsWidgetsState.buildPasswordTextField(context,text: "Enter Password", passwordController: passwordController),

                  TextFieldsWidgetsState.buildPasswordTextField(context,text: "Confirm Password", passwordController: cPasswordController),

                  TextFieldsWidgetsState.buildNameTextField(context,text: "Instagram User Name", nameController: instaNameController),


                  CheckboxListTile(
                    title: Text("I accept Term & Conditions",
                      style: TextStyle(color: Colors.blueGrey.shade600,fontSize: 20,),
                    ),

                    value: termCondition,
                      onChanged: (bool? value){
                        setState(() {
                          termCondition = value!;
                        });
                      },

                  ),

                  buildButton(title: "Sign Up")

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildProfileId(){
    return  GestureDetector(
      onTap: (){
        openFilePicker();
        },
      child: Stack(
        children: [
          ClipOval(

            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(65),
                  border: Border.all(color:Colors.grey.shade400,width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Icon(Icons.person,color: Colors.grey.shade400,size: 45,),
                )),
          ),
           Positioned(right: 0,bottom: 5,
              child: ClipOval(
                  child: Container(
                      color: const Color(0xFFff345f),
                      child: const Icon(Icons.add,color: Colors.white,
                      ),
                  ),
              ),
           ),
        ],
      ),
    );
  }
  DateTime dob = DateTime.now();




  buildButton({title}){
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: GestureDetector(
        onTap: (){
          if(_globalKey.currentState!.validate() && termCondition){
            RegisterUserApi.registerUserApi(
              firstName: firstnameController.text,
              lastName: lastnameController.text,
              email: emailController.text,
              password: passwordController.text,
              gender: gender,
              instaId: instaNameController.text,
              address: addressController.text,

            )
                .then((value){
              final result = value;
              if(result.data.message == "You have registered successfully."){
                Get.offAll(const LoginUserScreen());
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

  String gender = 'Male';

  buildGenderDropDown(){
    return DropdownButton<String>(
      value: gender,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 3,
      style: const TextStyle(color: Colors.black),
      onChanged: (String? newValue) {
        setState(() {
          gender = newValue!;
        });
      },
      items: <String>['Male', 'Female', 'Not Prefer',]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  late String photoFilePath;
  late String photoFileName;
  
  late TextEditingController photoController = TextEditingController();

  void openFilePicker() async {
    // FilePickerResult? result = await FilePicker.platform
    //     .pickFiles(
    //   allowMultiple: false,
    //   type: FileType.image,
    // ).then((value) {
    //   if (value != null) {
    //     Get.showSnackbar(GetSnackBar(title: "${value.files.first.name} Pick Successfully",))
    //
    //     PlatformFile file = value.files.first;
    //     setState(() {
    //         setState(() {
    //           photoFileName = file.name;
    //           photoFilePath = file.path!;
    //           photoController = TextEditingController(text: photoFilePath);
    //         });
    //     });
    //   } else {
    //     Get.showSnackbar(GetSnackBar(
    //       backgroundColor: Colors.deepOrange.shade300,
    //       title:"File Pick Unsuccessfully",))
    //   }
    // }).onError((error, _) {
    //   String _exceptionData = error!.toString();
    //
    //   buildSnackBar(message: _exceptionData);
    //   if (_exceptionData == 'read_external_storage_denied') {
    //     buildSnackBar(message: 'Permission was denied');
    //   } else if (_exceptionData == 'selection_canceled') {
    //     buildSnackBar(message: 'User canceled operation');
    //   }
    // });

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    setState(() {
      print(result!.paths[1]!);
      photoFilePath = result.paths[1]!;
      photoController = TextEditingController(text: photoFilePath);
    });

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
