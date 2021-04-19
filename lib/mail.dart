import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

sendMail() async {
  String username = 'fewaclothingstore@gmail.com';
  String password = 'fewaclothing55';

  final smtpServer = gmail(username, password);
  // Creating the Message
  final message = Message()
    ..from = Address(username, 'Fewa Clothing')
    ..recipients.add('srokrij@gmail.com')
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
  // Send the first message
  await connection.send(message);
  // close the connection
  await connection.close();
}