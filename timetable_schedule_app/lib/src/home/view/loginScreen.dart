import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/view/addLesson.dart';
import 'package:timetable_schedule_app/src/home/controller/login-register-controller.dart';
import 'package:timetable_schedule_app/src/home/model/formtype.dart';
import 'package:timetable_schedule_app/src/home/view.dart';
import 'package:timetable_schedule_app/src/weekScreen/view.dart';

const users = const {
  'w@w.com': '123',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  bool isLogin = false;
  bool isRegister = false;

  Duration get loginTime => Duration(milliseconds: 2250);
  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Podana nazwa użytkownika nie istnieje';
      }
      if (users[data.name] != data.password) {
        return 'Bład podczas wprowadzania hasła';
      }
      isLogin = true;
      return null;
    });
  }

  Future<String> _regAuthUser(LoginData data) {
    LogRegController ctrl = new LogRegController();
    isRegister = true;
    
    return ctrl.authRegUser(data.name, data.password);
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Podana nazwa użytkownika nie istnieje';
      }
      isRegister = true;
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Planner',
      onLogin: _authUser,
      onSignup: _regAuthUser,
      onSubmitAnimationCompleted: () {
        if (isLogin == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => WeekPlanScreen(),
            ),
          );
        }
        if (isRegister == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen(),
            ),
          );
        }
        ;
      },
      emailValidator: (value) {
        if (!value.contains('@') || !value.endsWith('.com')) {
          return "Email musi zawierać '@''";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Hasło nie może być puste';
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
