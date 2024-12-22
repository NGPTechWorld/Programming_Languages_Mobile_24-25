import 'package:flutter/cupertino.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/exception_indicator.dart';

/// Indicates that a connection error occurred.
class NoConnectionIndicator extends StatelessWidget {
  const NoConnectionIndicator({
    Key? key,
    required this.onTryAgain,
  }) : super(key: key);
// TODO : Edit this
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'No connection',
        message: 'Please check internet connection and try again.',
        assetName: 'assets/frustrated-face.png',
        onTryAgain: onTryAgain,
      );
}
