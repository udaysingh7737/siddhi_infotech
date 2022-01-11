import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:siddhi_infotech/validator_class.dart';

class TextFieldsWidgets extends StatefulWidget {
  const TextFieldsWidgets({Key? key}) : super(key: key);
 @override
  State<TextFieldsWidgets> createState() => TextFieldsWidgetsState();
}

class TextFieldsWidgetsState extends State<TextFieldsWidgets> {

  static const double textWidgetBorder = 11.0;

  late String phoneNo;

  String buildGetPhoneNo(BuildContext context){
    return phoneNo;
  }

  static buildOrDivider(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
      child: SizedBox(width: MediaQuery.of(context).size.width,
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width *0.35,
                child: const Divider(height: 3,color: Colors.black45,)),
            const Text("Or",style: TextStyle(fontSize: 15),),
            SizedBox(width: MediaQuery.of(context).size.width *0.35,
                child: const Divider(height: 3,color: Colors.black45,)),
          ],
        ),
      ),
    );
  }



  static buildAddressTextField(BuildContext context,addressController,) {
    return TextFormField(
      controller: addressController,
      validator: Validators.addressValidator,
      expands: false,
      maxLength: 60,
      maxLines: 5,
      minLines: 2,
      keyboardType: TextInputType.multiline,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(fontSize: 18, color: Colors.black),
      decoration: InputDecoration(
        labelText: "Your Address",
        //suffixText: "@gmail.com",

        labelStyle: const TextStyle(fontSize: 15,),
        hintText: "Enter Address",
        prefixIcon: const Icon(Icons.location_history),
        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  static buildNameTextField(BuildContext context,{required String text,required nameController}){
    return  TextFormField(
      style: TextStyle(fontSize: 18,color: Colors.blueGrey.shade800,fontWeight: FontWeight.w600),
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: Validators.nameValidator,
      maxLines: 1,
      autofillHints:  const [AutofillHints.name],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {

      },
      decoration: InputDecoration(
          labelText: text,
          border: const OutlineInputBorder(

            borderRadius: BorderRadius.all(
              Radius.circular(textWidgetBorder),
            ),
          ),
          filled: false,

          prefixIcon: const Icon(Icons.person_outline),
          errorStyle: const TextStyle(
              fontSize: 12, color: Colors.red),
          labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15, color: Colors.blueGrey.shade700,),
          hintStyle: TextStyle(
              color: Colors.blueGrey.shade700,fontWeight: FontWeight.w400,
              fontSize: 14),
          helperStyle: const TextStyle(),
          hintText:text,
          //AppLocalizations.of(context)!.enterEmail,
          fillColor: Theme.of(context).colorScheme.background),
    );
  }

  static buildEmailTextField(BuildContext context,{required emailController}){
    return  TextFormField(
      style: TextStyle(fontSize: 18,color: Colors.blueGrey.shade800,fontWeight: FontWeight.w600),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: Validators.emailValidator,
      maxLines: 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {},
      decoration: InputDecoration(

          border: const OutlineInputBorder(

            borderRadius: BorderRadius.all(
              Radius.circular(textWidgetBorder),
            ),
          ),
          filled: false,

          prefixIcon: const Icon(Icons.mail_outline),
          errorStyle: TextStyle(
              fontSize: 12, color: Colors.red),
          labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15, color: Colors.blueGrey.shade700,),
          hintStyle: TextStyle(
              color: Colors.blueGrey.shade700,fontWeight: FontWeight.w400,
              fontSize: 14),
          helperStyle: TextStyle(),
          label: const Text("Email"),


          hintText: "Enter Email Address",
          //AppLocalizations.of(context)!.enterEmail,
          fillColor: Theme.of(context)
              .colorScheme
              .background),
    );
  }

  static buildPasswordTextField(BuildContext context,{required text,required passwordController}){
    return  TextFormField(
      textAlign: TextAlign.start,
      //textAlignVertical: TextAlignVertical.center,

      style: TextStyle(fontSize: 18,color: Colors.blueGrey.shade800,fontWeight: FontWeight.w600),
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      validator: Validators.passwordValidator,
      maxLines: 1,maxLength: 16,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {},

      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(textWidgetBorder),
            ),
          ),
          filled: false,
          prefixIcon: const Icon(Icons.vpn_key),


          errorStyle: const TextStyle(
              fontSize: 12, color: Colors.red),
          labelStyle: TextStyle(fontSize: 16,color: Colors.blueGrey.shade700,),
          hintStyle: TextStyle(color: Colors.blueGrey.shade800,
              fontWeight: FontWeight.w300, fontSize: 17),
          hintText: text,

          //AppLocalizations.of(context)!.enterEmail,
          fillColor: Theme.of(context)
              .colorScheme
              .background),
    );
  }

  static buildMessageTextField(BuildContext context,{required messageController}){
    return  TextFormField(
      style: TextStyle(fontSize: 18,color: Colors.blueGrey.shade800,fontWeight: FontWeight.w600),
      controller: messageController,
      keyboardType: TextInputType.multiline,
      validator: Validators.messageValidator,
      minLines: 1,maxLines: 3,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {},
      decoration: InputDecoration(

          border: const OutlineInputBorder(

            borderRadius: BorderRadius.all(
              Radius.circular(textWidgetBorder),
            ),
          ),
          filled: false,

          prefixIcon: const Icon(Icons.message_outlined),
          errorStyle: const TextStyle(
              fontSize: 12, color: Colors.red),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15, color: Colors.blueGrey.shade700,),
          hintStyle: TextStyle(
              color: Colors.blueGrey.shade700,fontWeight: FontWeight.w400,
              fontSize: 14),
          label: const Text("Message"),


          hintText: "Enter your Message",
          //AppLocalizations.of(context)!.enterEmail,
          fillColor: Theme.of(context)
              .colorScheme
              .background),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
