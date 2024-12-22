import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/generic_error_indicator.dart';
import 'package:ngpiteapp/screens/custom_widgets/exception_indicators/no_connection_indicator.dart';
// TODO : Edit this
/// Based on the received error, displays either a [NoConnectionIndicator] or
/// a [GenericErrorIndicator].
class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    required this.error,
    required this.onTryAgain,
    Key? key,
  })  : assert(error != null),
        super(key: key);

  final dynamic error;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => error is SocketException
      ? NoConnectionIndicator(
          onTryAgain: onTryAgain,
        )
      : GenericErrorIndicator(
          onTryAgain: onTryAgain,
        );
}
