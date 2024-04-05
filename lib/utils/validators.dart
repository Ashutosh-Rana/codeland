class CodelandValidators {
  static String? usernameValidator(String? val) {
    // print("#########################");
    if (val!.isEmpty) {
      return "Username cannot be empty";
    }
    return null;
  }

  static String? passwordValidator(String? val) {
    if (val!.isEmpty) {
      return "Password cannot be empty";
    }
    return null;
  }
}
