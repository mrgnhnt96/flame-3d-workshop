import 'package:flutter/material.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

class Code {
  static late Highlighter _highlighter;

  static Future<void> init() async {
    await Highlighter.initialize(['dart']);
    final theme = await HighlighterTheme.loadDarkTheme();
    _highlighter = Highlighter(
      language: 'dart',
      theme: theme,
    );
  }

  static TextSpan highlight(String code) {
    return _highlighter.highlight(code);
  }
}
