import "package:test/test.dart";
import 'package:timetable_schedule_app/src/home/controller/login-register-controller.dart';

void main() {
  test('empty email returns error string', () {
    var result = LogRegController.emailValidator('');
    expect(result, 'Email nie może być pusty');
  });
  test('email without @ returns error string', () {
    var result = LogRegController.emailValidator('test');
    expect(result, 'Email musi zawierać @');
  });
  test('correct email should returns null', () {
    var result = LogRegController.emailValidator('test@test.com');
    expect(result, null);
  });
  test('empty password returns error string', () {
    var result = LogRegController.passwordValidator('');
    expect(result, 'Hasło nie może być puste');
  });
  test('password shorter than 6 letters should return error', () {
    var result = LogRegController.passwordValidator('test');
    expect(result, 'Hasło powinno zawierać minimum 6 znaków');
  });
  test('correct password should returns null', () {
    var result = LogRegController.passwordValidator('123456');
    expect(result, null);
  });
}
