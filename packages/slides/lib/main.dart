import 'package:flame_3d_workshop_slides/slides/slides.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

void main() {
  runApp(const FlutterDeckExample());
}

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) {
    // This is an entry point for the Flutter Deck app.
    return FlutterDeckApp(
      themeMode: ThemeMode.dark,
      darkTheme: FlutterDeckThemeData.dark(),
      configuration: const FlutterDeckConfiguration(
        background: FlutterDeckBackgroundConfiguration(
          dark: FlutterDeckBackground.solid(Color(0xFF16222A)),
        ),
      ),
      slides: const [
        Slide00Intro(),
        Slide01Bg(),
      ],
    );
  }
}
