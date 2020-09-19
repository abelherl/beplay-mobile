import 'package:beplay/bloc/account/account_bloc.dart';
import 'package:beplay/bloc/class/class_bloc.dart';
import 'package:beplay/bloc/login/login_bloc.dart';
import 'package:beplay/bloc/register/register_bloc.dart';
import 'package:beplay/const.dart';
import 'package:beplay/pages/checkout_screen.dart';
import 'package:beplay/pages/classes.dart';
import 'package:beplay/pages/detail_dance.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:beplay/pages/intro_screen.dart';
import 'package:beplay/pages/login_screen.dart';
import 'package:beplay/pages/orders_screen.dart';
import 'package:beplay/pages/page_home_screen.dart';
import 'package:beplay/pages/profile/account_screen.dart';
import 'package:beplay/pages/profile/change_password_screen.dart';
import 'package:beplay/pages/profile/faq_screen.dart';
import 'package:beplay/pages/profile/language_screen.dart';
import 'package:beplay/pages/profile/notification_screen.dart';
import 'package:beplay/pages/profile/privacy_screen.dart';
import 'package:beplay/pages/profile_screen.dart';
import 'package:beplay/pages/signup_screen.dart';
import 'package:beplay/pages/verification_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/logout/logout_bloc.dart';
import 'bloc/orders/orders_bloc.dart';
import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
          child: LoginScreen(),
        ),
        BlocProvider<RegisterBloc>(
          create: (_) => RegisterBloc(),
          child: SignupScreen(),
        ),
        BlocProvider<LogOutBloc>(
          create: (_) => LogOutBloc(),
          child: ProfileScreen(),
        ),
        BlocProvider<ClassBloc>(
          create: (_) => ClassBloc(),
          child: ClassesScreen(),
        ),
        BlocProvider<ClassBloc>(
          create: (_) => ClassBloc(),
          child: DetailDance(),
        ),
        BlocProvider<ClassBloc>(
          create: (_) => ClassBloc(),
          child: CheckoutScreen(),
        ),
        BlocProvider<OrdersBloc>(
          create: (_) => OrdersBloc(),
          child: OrdersScreen(),
        ),
        BlocProvider<AccountBloc>(
          create: (_) => AccountBloc(),
          child: AccountSettingScreen(),
        ),
        BlocProvider<AccountBloc>(
          create: (_) => AccountBloc(),
          child: ChangePasswordScreen(),
        ),
      ],
      child: MaterialApp(
        title: "Be Play",
        initialRoute: '/splash',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: bPrimaryColor,
            accentColor: bPrimaryLightColor,
            backgroundColor: Colors.white),
        routes: {
          '/splash': (context) => SplashScreen(),
          '/intro': (context) => IntroScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/verification': (context) => VerificationScreen(),
          '/home': (context) => HomeScreen(),
          '/page_HomeScreen': (context) => PageHomeSceen(),
          '/classes': (context) => ClassesScreen(),

          //Settings Page
          '/account': (context) => AccountSettingScreen(),
          '/change_password': (context) => ChangePasswordScreen(),
          '/language': (context) => ChangeLanguageScreen(),
          '/notification': (context) => NotificationSettingScreen(),
          '/privacy': (context) => PrivacyScreen(),
          '/faq': (context) => FAQScreen(),
        },
      ),
    );
  }
}
