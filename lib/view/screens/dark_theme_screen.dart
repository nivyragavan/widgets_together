import 'package:flutter/material.dart';
import 'package:new_widgets/provider/my-themes.dart';
import 'package:new_widgets/widget/theme_switch_button.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatelessWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'Dark Theme'
        : 'Light Theme';
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Text(
          'Mode : $text!',
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: const Text('Dark Theme'),
      centerTitle: true,
      backgroundColor: Colors.purple.shade900,
      actions: const [ThemeSwitchButton()],
    );
  }
}
