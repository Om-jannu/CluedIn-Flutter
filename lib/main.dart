// ignore_for_file: camel_case_types
import 'package:cluedin_app/widgets/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cluedin_app/utils/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';
import 'utils/globals.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        scaffoldMessengerKey: snackbarKey,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        routerConfig: router
        // initialRoute: MyRoutes.notificationRoute,
        // initialRoute: 'notification',
        // routes: {
        //   // "/": (context) => LoginPage(),

        //   // MyRoutes.notificationRoute: (context) => NotificationPage(),
        //   MyRoutes.loginRoute: (context) => LoginPage(),
        //   'phone': (context) => MyPhone(),
        //   'profile': (context) => MyProfile(),
        //   'events': (context) => MyEvents(),
        //   'notification': (context) => NotificationPage(),
        // },
        // home: NotificationPage(),
        );
  }
}

// ignore_for_file: prefer_const_constructors