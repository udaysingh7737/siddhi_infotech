import 'package:form_field_validator/form_field_validator.dart';

class Validators{


  static emailOrPhoneValidator({required value}){
    if(value!.isNotEmpty) {
      if (RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$').hasMatch(value)) {
        if (RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
          // setState(() {
          //   isEmail = false;
          // });
          return null;
        }
        return "Enter Correct Phone no.";
      } else {
        if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
          // setState(() {
          //   isEmail = true;
          // });
          return null;
        }
        return "Enter Correct Email Address";
      }
    }else{
      return "This field is required*";
    }
  }

  static final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'Name is required'),
    LengthRangeValidator(min: 3, max: 30, errorText:"Enter Correct Name in Format"),
  ]);


  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    LengthRangeValidator(min: 8, max: 16, errorText: "Password Must 8 to 16 digits"),
  ]);


  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    PatternValidator(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
        errorText: 'Email must have correct Format')
  ]);



  static final phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'Mobile No. is required'),
    PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)', errorText: "Enter correct No."),
    LengthRangeValidator(min: 10, max: 10, errorText: "Phone no. Must Have 10 digits"),
  ]);

  static final GSTValidator = MultiValidator([
    RequiredValidator(errorText: 'GSTIN No. is required'),
    PatternValidator(r"^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$", errorText: "Invalid GST Number."),
    LengthRangeValidator(min: 15, max: 15, errorText: "GST Must Have 10 digits."),
  ]);

  static final otpValidator = MultiValidator([
    RequiredValidator(errorText: 'OTP is required'),
    LengthRangeValidator(min: 6, max: 6, errorText: "OTP Must Have 6 digits"),
  ]);

  static final addressValidator = MultiValidator([
    RequiredValidator(errorText: 'address is required'),

    LengthRangeValidator(min: 5, max: 60, errorText:"Enter Correct address in Format"),
  ]);

  static final stateValidator = MultiValidator([
    RequiredValidator(errorText: 'state is required'),

    LengthRangeValidator(min: 2, max: 20, errorText:"Enter Correct Format"),
  ]);
  static final cityValidator = MultiValidator([
    RequiredValidator(errorText: 'City is required'),

    LengthRangeValidator(min: 3, max: 20, errorText:"Enter Correct Format"),
  ]);

  static final countryValidator = MultiValidator([
    RequiredValidator(errorText: 'Country is required'),

    LengthRangeValidator(min: 3, max: 20, errorText:"Enter Correct Format"),
  ]);

  static final messageValidator = MultiValidator([
    RequiredValidator(errorText: 'message is required'),

    LengthRangeValidator(min: 3, max: 120, errorText:"Enter Correct Name in Format"),
  ]);

  static final VehicleNoValidator = MultiValidator([
    RequiredValidator(errorText: 'Vehicle Register No. is required'),
    PatternValidator(r'^[A-Z]{2}\s[0-9]{2}\s[A-Z]{2}\s[0-9]{4}$',
        errorText: 'Vehicle Registration No. is not correct Format')
  ]);

  static final VINValidator = MultiValidator([
    RequiredValidator(errorText: 'VIN is required'),
    LengthRangeValidator(min: 17, max: 19, errorText: "VIN Must Have 17 minimum and 19 maximum digits"),
    PatternValidator(r'^[A-HJ-NPR-Za-hj-npr-z\d]{8}[\dX][A-HJ-NPR-Za-hj-npr-z\d]{2}\d{6}$',
        errorText: 'VIN Number is not correct Format')
  ]);

  static String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return "lot";
  }


}