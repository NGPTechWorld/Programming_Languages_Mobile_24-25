import 'package:flutter/material.dart';

class Subtitile extends StatelessWidget {
  const Subtitile({
    super.key,
    required this.subtitle,
  });
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        subtitle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
