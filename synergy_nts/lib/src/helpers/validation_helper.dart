bool handleEmailValidation(String value) {
  if (value.isNotEmpty &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
    return true;
  }
  return false;
}

bool validateMobile(String value) {
// Indian Mobile number are of 10 digit only
  if (value.length == 10) {
    return true;
  } else {
    return false;
  }
}
