import 'package:flutter/material.dart';

class DimissableWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final DismissDirectionCallback onDismiss;
  const DimissableWidget({
    @required this.item,
    @required this.child,
    @required this.onDismiss,
    Key key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ObjectKey(item),
        background: buildSwipLeftAction(),
        child: child,
        onDismissed: onDismiss,
      );

  buildSwipLeftAction() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.grey[300],
      child: Icon(Icons.delete),
    );
  }
}
