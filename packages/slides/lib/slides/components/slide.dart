import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

abstract class Slide extends FullPageSlide {
  Slide({
    required super.route,
    super.key,
  });
  @override
  Widget child(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32.0,
      children: children(context),
    );
  }

  List<Widget> children(BuildContext context);
}

abstract class FullPageSlide extends FlutterDeckSlideWidget {
  FullPageSlide({
    required String route,
    super.key,
  }) : super(
         configuration: FlutterDeckSlideConfiguration(
           route: route,
           header: const FlutterDeckHeaderConfiguration(
             title: 'Flame 3D Workshop',
           ),
         ),
       );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: child(context),
      ),
    );
  }

  Widget child(BuildContext context);
}
