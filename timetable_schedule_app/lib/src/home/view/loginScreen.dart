import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:timetable_schedule_app/src/home/controller/login-register-controller.dart';
import 'package:timetable_schedule_app/src/weekScreen/view.dart';

const users = const {
  'w@w.com': '123456',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {

  Duration get loginTime => Duration(milliseconds: 2250);
  Future<String> _logAuthUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    LogRegController ctrl = new LogRegController();
    return ctrl.authUser(data.name, data.password,true);
  }

  Future<String> _regAuthUser(LoginData data) {
    LogRegController ctrl = new LogRegController();
  return ctrl.authUser(data.name, data.password,false);
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Podana nazwa użytkownika nie istnieje';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Planner',
      onLogin: _logAuthUser,
      onSignup: _regAuthUser,
      onSubmitAnimationCompleted: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => WeekPlanScreen(),
          ),
        );
      },
      emailValidator: (value) {
        if (!value.contains('@')) {
          return "Email musi zawierać '@''";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Hasło nie może być puste';
        }
        if (value.length < 6) {
          return 'Hasło powinno zawierać minimum 6 znaków';
        }
        return null;
      },
      showDebugButtons: false,
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        usernameHint: 'Nazwa użytkownika',
        passwordHint: 'Hasło',
        confirmPasswordHint: 'Wpisz ponownie hasło',
        loginButton: 'ZALOGUJ SIĘ',
        signupButton: 'REJESTRACJA',
        goBackButton: 'Powrót',
        forgotPasswordButton: 'Zapomniałeś hasła?',
        confirmPasswordError: 'Hasła do siebie nie pasują',
        recoverPasswordDescription:
            'Aby otrzymać ponownie hasło musisz podać mail użyty podczas rejestracji',
        recoverPasswordSuccess: 'Email z potwierdzeniem został wysłany',
      ),
    );
  }
}
