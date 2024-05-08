import 'dart:developer' as logger show log;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screen/daftar_screen.dart';
import 'constant.dart';
import 'extensions.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget Function(BuildContext) screenTujuan;
    Map<String, dynamic>? arguments;
    if (settings.arguments != null) {
      arguments = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {

      case Constant.kRouteDaftarScreen:
        screenTujuan = (_) => const DaftarScreen();
        break;
      default:
        // Sama dengan 404 not found.
        // Jika ada route name yg tidak terdaftar maka akan memicu halaman ini.
        screenTujuan = (_) => Builder(builder: (context) {
              return Scaffold(
                body: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/icons/ic_launcher.png',
                            width: context.dp(80)),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Text(
                            '404',
                            textAlign: TextAlign.center,
                            style: context.text.bodyLarge,
                          ),
                        ),
                        Text(
                          'Belum ada halaman',
                          textAlign: TextAlign.center,
                          style: context.text.labelSmall
                              ?.copyWith(color: context.hintColor),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
    }
    // Execute methodChannel for prevent screenshot in specific page.
    // Jangan lupa mematikan secure screen saat On Will Pop Scope.
    // dengan cara menjalankan PlatformChannel.setSecureScreen('RANDOM STRING')
    // PlatformChannel.setSecureScreen(settings.name);
    // Future.delayed(Duration(milliseconds: 200));
    if (kDebugMode) {
      logger.log('SCREEN-NAME: ${settings.name}');
      logger.log('GENERATE ROUTE: arguments >> $arguments');
    }
    return MaterialPageRoute(builder: screenTujuan, settings: settings);
  }
}
