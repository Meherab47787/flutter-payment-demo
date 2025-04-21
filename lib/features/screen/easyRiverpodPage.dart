import 'package:flutter/material.dart';
import 'package:flutter_payment_demo/utils/buttons/custom_floating_action_button.dart';
import 'package:flutter_payment_demo/utils/dimensions.dart';
import 'package:flutter_payment_demo/utils/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Easyriverpodpage extends ConsumerWidget {
  const Easyriverpodpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Riverpod Easy"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ref.watch(riverpodEasy).toString(),
              style: TextStyle(
                  fontSize: Dimensions.doubleExtralgSize,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Dimensions.defaultSize,
            ),
            CustomFAB(
              onPressed: () => {
                ref.read(riverpodEasy.notifier).state+=1,
              },
              backgroundColor: Colors.black,
              textColor: Colors.white,
              string: "+ Add",
              width: Dimensions.avatarSize * 2,
            ),
            SizedBox(
              height: Dimensions.defaultSize,
            ),
            CustomFAB(
              onPressed: () => {
                ref.read(riverpodEasy.notifier).state-=1,
              },
              backgroundColor: Colors.black,
              textColor: Colors.white,
              string: "- Remove",
              width: Dimensions.avatarSize * 2,
            )
          ],
        ),
      ),
    );
  }
}
