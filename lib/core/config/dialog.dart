library config.globals;


import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'global.dart';


vshowInfo(BuildContext context, String pesan, String judul,
    {bool persistent = true, Function? onConfirm}) {
  return context.showFlashDialog(
      constraints: BoxConstraints(maxWidth: 300),
      persistent: persistent,
      title: Text(judul),
      content: Text('⚡️$pesan'),
      positiveActionBuilder: (context, controller, _) {
        return TextButton(
            onPressed: () async {
              onConfirm!(true);
              controller.dismiss();
            },
            child: Text('OK'));
      });
}







vdiaologtanyabool(
    BuildContext context, {
      String title = "",
      String pesan = "",
      Function? onConfirm,
      Function? onCancel,
    }) {
  return context.showFlashDialog(
      constraints: BoxConstraints(maxWidth: 300),
      title: Text(title),
      content: Text('⚡️$pesan'),
      negativeActionBuilder: (context, controller, _) {
        return TextButton(
            onPressed: () async {
              onCancel!(true);
              controller.dismiss();
            },
            child: Text('Yes'));
      },
      positiveActionBuilder: (context, controller, _) {
        return TextButton(
            onPressed: () async {
              onConfirm!(true);
              controller.dismiss();
            },
            child: Text('Yes'));
      });
}
