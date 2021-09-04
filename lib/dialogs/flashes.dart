// // import 'package:flash/flash.dart';
// import 'package:flutter/material.dart';

// class FlashHelper {
//   static Color _backgroundColor(BuildContext context) {
//     var theme = Theme.of(context);
//     return theme.dialogTheme?.backgroundColor ?? theme.dialogBackgroundColor;
//   }

//   static TextStyle _titleStyle(BuildContext context, [Color color]) {
//     var theme = Theme.of(context);
//     return (theme.dialogTheme?.titleTextStyle ?? theme.textTheme.headline6)
//         .copyWith(color: color);
//   }

//   static TextStyle _contentStyle(BuildContext context, [Color color]) {
//     var theme = Theme.of(context);
//     return (theme.dialogTheme?.contentTextStyle ?? theme.textTheme.bodyText2)
//         .copyWith(color: color);
//   }

//   static Future<T> bottomBar<T>(
//     BuildContext context, {
//     String title,
//     Color leftBarColor,
//     Icon icon,
//     @required String message,
//     Duration duration = const Duration(seconds: 3),
//   }) {
//     return showFlash<T>(
//       context: context,
//       duration: duration,
//       builder: (context, controller) {
//         return Flash(
//           controller: controller,
//           horizontalDismissDirection: HorizontalDismissDirection.horizontal,
//           backgroundColor: Colors.black87,
//           child: FlashBar(
//             title: title == null
//                 ? null
//                 : Text(title, style: _titleStyle(context, Colors.white)),
//             message: Text(message, style: _contentStyle(context, Colors.white)),
//             icon: icon,
//             leftBarIndicatorColor: leftBarColor,
//           ),
//         );
//       },
//     );
//   }

//   static Future<T> simpleDialog<T>(
//     BuildContext context, {
//     String title,
//     @required String message,
//     Color messageColor,
//     ChildBuilder<T> negativeAction,
//     ChildBuilder<T> positiveAction,
//   }) {
//     return showFlash<T>(
//       context: context,
//       persistent: true,
//       builder: (context, controller) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Flash.dialog(
//               controller: controller,
//               backgroundColor: _backgroundColor(context),
//               margin: const EdgeInsets.only(left: 40.0, right: 40.0),
//               borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//               child: FlashBar(
//                 title: title == null
//                     ? null
//                     : Text(title, style: _titleStyle(context)),
//                 message:
//                     Text(message, style: _contentStyle(context, messageColor)),
//                 actions: <Widget>[
//                   if (negativeAction != null)
//                     negativeAction(context, controller, setState),
//                   if (positiveAction != null)
//                     positiveAction(context, controller, setState),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// typedef ChildBuilder<T> = Widget Function(
//     BuildContext context, FlashController<T> controller, StateSetter setState);
