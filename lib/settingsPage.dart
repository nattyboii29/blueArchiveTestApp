import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Function(bool) onThemeToggle;

  const SettingsPage({super.key, required this.onThemeToggle});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              'Display',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ListTile(
              title: Text('Dark Mode'),
              subtitle: Text('Toggle dark theme'),
              trailing: Switch(
                value: isDarkMode,
                activeColor: Colors.amber,
                activeTrackColor: Colors.amber.shade200,
                inactiveThumbColor: Colors.grey[400],
                inactiveTrackColor: Colors.grey[300],
                onChanged: (value) {
                  widget.onThemeToggle(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}