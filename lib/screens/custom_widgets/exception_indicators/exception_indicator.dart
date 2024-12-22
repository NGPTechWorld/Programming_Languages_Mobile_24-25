import 'package:flutter/material.dart';
// TODO : Edit this
/// Basic layout for indicating that an exception occurred.
class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({
    required this.title,
    required this.assetName,
    required this.message,
    required this.onTryAgain,
    Key? key,
  }) : super(key: key);
  final String title;
  final String message;
  final String assetName;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              Image.asset(
                assetName,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (message != null)
                const SizedBox(
                  height: 16,
                ),
              if (message != null)
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
              if (onTryAgain != null) const Spacer(),
              if (onTryAgain != null)
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: onTryAgain,
                    // icon: const Icon(
                    //   Icons.refresh,
                    //   color: Colors.white,
                    // ),
                    child: const Text(
                      'Try Again',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}
