import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatefulWidget {
  final TextEditingController wantedNumController;
  const Settings({
    super.key, 
    required this.wantedNumController
  });

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: TextField(
                
                controller: widget.wantedNumController,
                decoration: const InputDecoration(labelText: "Desired result"),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const ListTile(
              title: Text('Long press on "Generate" to obtain the desired result.'),
            )
          ],
        ),
      ),
    );
  }
}
