import 'package:flutter/material.dart';
import 'package:flutter_payment_demo/features/screen/easyRiverpodPage.dart';
import 'package:flutter_payment_demo/utils/buttons/custom_floating_action_button.dart';
import 'package:flutter_payment_demo/utils/dimensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Easyriverpodpage(),
    );
  }
}
