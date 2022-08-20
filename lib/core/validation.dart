
import '../src/presentation/resources/strings_manager.dart';


class EmailValidator {
  static String? validate(String email){
    if (email.isNotEmpty && email.contains('@' )&& email.contains('.com')) {
      return  null;
    } else {
      return  AppStrings.emailError;
    }
  }
}

class PasswordValidator {
  static String? validate(String password){
    if (password.isNotEmpty && password.length >=6) {
      return  null;
    } else {
      return  AppStrings.passwordError;
    }
  }
}
