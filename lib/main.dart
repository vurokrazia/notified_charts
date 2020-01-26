import 'package:flutter/material.dart';
import 'package:mobile_veco/pages/home_page.dart';
import 'package:mobile_veco/pages/message_page.dart';
import 'package:mobile_veco/providers/push_notifications_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    final pushProvider = PushNotificationsProvider();
    pushProvider.initNotifications();
    pushProvider.messages.listen((arg) {
      navigatorKey.currentState.pushNamed('message', arguments: arg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.purple,
        ),
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'message': (BuildContext context) => MessagePage(),
        });
  }
}
