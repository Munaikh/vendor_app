import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../services/services.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.red.withOpacity(0.7),
                width: double.infinity,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final storageService = serviceLocator<StorageService>();

                        await storageService.set('test', 'Hala2');
                      },
                      child: const Text('Set Data locally'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final storageService = serviceLocator<StorageService>();

                        final value = storageService.get('test');

                        BotToast.showText(text: value);
                      },
                      child: const Text('Read Data locally'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  BotToast.showText(text: "الاول بأذن الله");
                },
                child: const Text('Toast'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).toggleThemeMode();
                },
                child: const Text('Change Theme'),
              ),
              const SignOutButton(),
            ],
          ),
        )

        // ProfileScreen(
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {},
        //       child: Text('Test'),
        //     )
        //   ],
        // ),
        );
  }
}
