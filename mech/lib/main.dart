import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mech/screen/autoshop_profile.dart';
import 'package:mech/screen/user_profile.dart';

void main() {
  runApp(
    DevicePreview(enabled: true, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: AutoshopProfile(),
    );
  }
}
