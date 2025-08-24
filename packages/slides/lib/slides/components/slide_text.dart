import 'package:flame_3d_workshop_slides/utils/code.dart';
import 'package:flutter/material.dart';

class SlideText {
  static Text title(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 64.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text bullet(String text) {
    return Text(
      '• $text',
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static Text p(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static Text italics(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  static Text code(String text) {
    return Text.rich(
      Code.highlight(text),
      style: const TextStyle(
        fontSize: 24.0,
        fontFamily: 'Monaco',
      ),
    );
  }
}
