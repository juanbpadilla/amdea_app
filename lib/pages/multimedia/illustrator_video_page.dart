import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class IllustratorVideoPage extends StatefulWidget {
  const IllustratorVideoPage({super.key});

  @override
  State<IllustratorVideoPage> createState() => _IllustratorVideoPageState();
}

class _IllustratorVideoPageState extends State<IllustratorVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
      ),
      body: const Center(child: Text('video multimedia')),
    );
  }
}