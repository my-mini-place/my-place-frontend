import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';
import 'package:elegant_notification/elegant_notification.dart';

class NotificationManager {
  static void showSuccess(
      BuildContext context, String title, String description) {
    ElegantNotification.success(
      width: 360,
      isDismissable: false,
      animationCurve: Curves.bounceOut,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      title: Text(title),
      description: Text(description),
      onDismiss: () {},
      shadow: BoxShadow(
        color: Colors.green.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 4),
      ),
    ).show(context);
  }

  static void showError(
      BuildContext context, String title, String description) {
    ElegantNotification.error(
      width: 360,
      position: Alignment.topRight,
      animation: AnimationType.fromRight,
      title: Text(title),
      description: Text(description),
      onDismiss: () {},
      stackedOptions: StackedOptions(
        key: 'topRight',
        type: StackedType.below,
        itemOffset: const Offset(0, 5),
      ),
    ).show(context);
  }
}
