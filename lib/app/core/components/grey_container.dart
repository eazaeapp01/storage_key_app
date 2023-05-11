import 'package:flutter/material.dart';

class GreyContainer extends StatelessWidget {
  final child;
  final padding;
  const GreyContainer({Key? key, this.child, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: .3),
      ),
      child: child,
    );
  }
}
