import 'dart:io';

import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:provider/provider.dart';

sendMail(BuildContext context) async {
  String username = 'fewaclothingstore@gmail.com';
  String password = 'fewaclothing55';

  final smtpServer = gmail(username, password);
  // Creating the Message
  final message = Message()
    ..from = Address(username, 'Fewa Clothing')
    ..recipients.add(Provider.of<UserAuthProvider>(context, listen: false).email)
    ..subject = 'Your Order has been confirmed successfully !!'
    ..html = "<h1>Order Confirmed !!!</h1><p>Dear Customer, Your order has been confirmed.\nThankyou for shopping with us.\nIf you got any feedback, We're just one email away.\n Also you can follow us on instagram: https://www.instagram.com/fewaclothingstore </p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  var connection = PersistentConnection(smtpServer);

  await connection.send(message);
  // close the connection
  await connection.close();
}