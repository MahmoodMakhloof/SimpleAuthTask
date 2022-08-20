import 'package:simple_auth/core/validation.dart';
import 'package:simple_auth/src/presentation/resources/strings_manager.dart';
import 'package:test/test.dart';

void main() {
 
  //* Email validation
  test('empty email should returns error string', () {
    var result = EmailValidator.validate('');
    expect(result, AppStrings.emailError);
  });

  test('email not contains (@) or (.com) should returns error string', () {
    var result = EmailValidator.validate('mahmood');
    expect(result, AppStrings.emailError);
  });

  test('non empty email contains (@) and (.com) should returns null', () {
    var result = EmailValidator.validate('mahmoodmakhloof1998@gmail.com');
    expect(result, null);
  });

  //* Password validation
  test('empty password should returns error string', () {
    var result = PasswordValidator.validate('');
    expect(result, AppStrings.passwordError);
  });

  test('password length less than 6 letters should returns error string', () {
    var result = PasswordValidator.validate('12345');
    expect(result, AppStrings.passwordError);
  });

  test('non empty password and length more than or equal 6 should return null', () {
    var result = PasswordValidator.validate('mahmoodmakhloof1998@gmail.com');
    expect(result, null);
  });
}
