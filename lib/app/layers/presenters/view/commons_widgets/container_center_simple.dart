import 'package:flutter/material.dart';

class BoxCardCenterSimple extends StatelessWidget {
  const BoxCardCenterSimple(
      {super.key, this.child = const SizedBox(), this.backgroundColor});
  final Widget child;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16),
        color: backgroundColor,
        elevation: backgroundColor != null ? 0 : 4,
        child: Padding(padding: const EdgeInsets.all(16.0), child: child),
      ),
    );
  }
}
