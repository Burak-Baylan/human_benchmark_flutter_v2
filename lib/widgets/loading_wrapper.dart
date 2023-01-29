import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class LoadingWrapper extends StatelessWidget {
  const LoadingWrapper({Key? key, required this.child, required this.isLoading})
      : super(key: key);

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: isLoading,
          child: child,
        ),
        if (isLoading)
          Container(
            width: context.width,
            height: context.height,
            color: Colors.black.withOpacity(.4),
            child: const Center(
              child: SizedBox(
                width: 75,
                height: 75,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          )
      ],
    );
  }
}
