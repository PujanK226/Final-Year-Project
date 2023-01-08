import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

class ThemeSwitcher extends StatefulWidget {
  ThemeSwitcher({Key? key, required this.toggleTheme, required this.isDarkMode})
      : super(key: key);
  dynamic toggleTheme;
  bool isDarkMode;

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: DayNightSwitcher(
          isDarkModeEnabled: widget.isDarkMode,
          onStateChanged: widget.toggleTheme,
        ),
      ),
    );
  }
}
