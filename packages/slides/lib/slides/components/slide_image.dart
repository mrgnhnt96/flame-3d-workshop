import 'package:flutter/material.dart';

class SlideImage extends StatelessWidget {
  final String asset;
  final String credit;

  const SlideImage({
    required this.asset,
    required this.credit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(asset, fit: BoxFit.contain),
        Positioned(
          bottom: 16,
          right: 16,
          child: Text(credit),
        ),
      ],
    );
  }
}
