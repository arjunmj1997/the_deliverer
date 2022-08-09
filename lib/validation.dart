class Validate {
  static String? emailValidator(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Emailr field should not be empty";
    }
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  static String? passwordvalidator(String value) {
    if (value.length <= 9) {
      return "invalid";
    } else {
      return null;
    }
  }
  static String? namevalidator(String value) {
    if (value.length <= 2) {
      return "invalid";
    } else {
      return null;
    }
  }
  static String? phonevalidator(String value) {
    if (value.length == 10) {
      return null;
    } else {
      return "invalid";
    }
  }


  static String? phvalidator(String value) {
    if (value.length < 10 || num.parse(value) == null){
      return "phone number";}
    else{
      return null;
    }
  }

  static String? pincodevalidator(String value) {
    if (value.length == 6 ){
      return null;}
    else{
      return "invalid";
    }
  }
  static String? confirmpwdvalidator(String value,String password)
  {
    if(value!=password || value == null){
      return "password missmatch";}
    else
      {
        return null;
      }
  }
  static String? placevalidator(String value) {
    if (value.isEmpty){
      return "Invalid field";}
    else{
      return null;
    }
  }

  static String? dobvalidator(String value) {
    if (value.isEmpty){
      return "select dob";}
    else{
      return null;
    }
  }
  static String? addressvalidator(String value) {
    if (value.isEmpty){
      return "invalid address";}
    else{
      return null;
    }
  }
  static String? proofvalidator(String value) {
    if (value.isEmpty){
      return "invalid proof";}
    else{
      return null;
    }
  }
  static String? jobvalidator(String value) {
    if (value.isEmpty){
      return "invalid job";}
    else{
      return null;
    }
  }
  static String? careagevalidator(String value) {
    if (value.isEmpty){
      return "invalid ";}
    else{
      return null;
    }
  }
  static String? disease(String value) {
    if (value.isEmpty){
      return "invalid ";}
    else{
      return null;
    }
  }


  static String? usernameValidator(String value) {
    var pattern = r"^[\p{L} ,.'-]*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Numbers not allowed';
    } else {
      return null;
    }
  }
  static String? emailValidatoredit(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }




}
