import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class TestSlide extends FlutterDeckSlideWidget {
  const TestSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/00_test',
          header: FlutterDeckHeaderConfiguration(title: 'Test Slide'),
        ),
      );

  @override
  Widget build(BuildContext context) {
    const quote =
        'He has all of the virtues I dislike and none of the vices I admire.';
    const attribution = '- Winston Churchill';

    return FlutterDeckSlide.quote(
      quote: quote,
      attribution: attribution,
      theme: FlutterDeckTheme.of(context).copyWith(
        quoteSlideTheme: const FlutterDeckQuoteSlideThemeData(
          quoteTextStyle: TextStyle(color: Colors.yellowAccent),
        ),
      ),
    );
  }
}
