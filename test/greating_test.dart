import 'package:simple_auth/src/presentation/resources/strings_manager.dart';
import 'package:simple_auth/src/presentation/views/home.dart';
import 'package:test/test.dart';

void main() {
  test('from 0 to 12 should retun good morning', () {
    var result = Greeting.get(5);
    expect(result, AppStrings.goodMorning);
  });

  test('from 12 to 17 should retun good afternoon', () {
    var result = Greeting.get(13);
    expect(result, AppStrings.goodAfternoon);
  });

  test('from 17 to 24 should retun good evening', () {
    var result = Greeting.get(19);
    expect(result, AppStrings.goodEvening);
  });
}
