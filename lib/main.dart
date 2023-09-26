import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homekitchen_customer_mobile/app/app.dart';
import 'package:homekitchen_customer_mobile/presentation/login/login_page_basic.dart';
import 'package:homekitchen_customer_mobile/presentation/navigator.dart';
import 'package:homekitchen_customer_mobile/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:authentication_repository/authentication_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(MyApp());
  Bloc.observer = const AppBlocObserver();
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  runApp(App(authenticationRepository: authenticationRepository));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mom Kitchen',
      theme: mainTheme,
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
