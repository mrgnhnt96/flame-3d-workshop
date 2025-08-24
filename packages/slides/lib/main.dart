import 'package:flame_3d_workshop_slides/slides/components/slides.dart';
import 'package:flame_3d_workshop_slides/slides/slides.dart';
import 'package:flame_3d_workshop_slides/utils/code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Code.init();

  runApp(const FlutterDeckExample());
}

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) {
    // This is an entry point for the Flutter Deck app.
    return FlutterDeckApp(
      themeMode: ThemeMode.dark,
      darkTheme: FlutterDeckThemeData.fromTheme(
        ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF16222A),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
      ),
      configuration: const FlutterDeckConfiguration(
        background: FlutterDeckBackgroundConfiguration(
          dark: FlutterDeckBackground.solid(Color(0xFF16222A)),
        ),
      ),
      slides: [
        Slide00Title(),
        Slide01Intro(),
        Slide02Agenda(),
        Slides.title('Flame Game Loop'),
        Slide03FlameGameLoop(),
        Slide04FlameComponents(),
        SlideSampleImage(),
        SlideSampleCode(),
        SlideSampleGame(),
      ],
    );
  }
}
