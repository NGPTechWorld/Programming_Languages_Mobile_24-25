import 'package:flutter/cupertino.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/exception_indicator.dart';

/// Indicates that an unknown error occurred.
class GenericErrorIndicator extends StatelessWidget {
  const GenericErrorIndicator({
    Key? key,
    required this.onTryAgain,
  }) : super(key: key);

  final VoidCallback onTryAgain;
// TODO : Edit this
  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'Something went wrong',
        message: 'The application has encountered an unknown error.\n'
            'Please try again later.',
        assetName: 'assets/confused-face.png',
        onTryAgain: onTryAgain,
      );
}
