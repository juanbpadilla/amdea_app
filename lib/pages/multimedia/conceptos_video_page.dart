import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ConceptosVideoPage extends StatefulWidget {
  const ConceptosVideoPage({super.key});

  @override
  State<ConceptosVideoPage> createState() => _ConceptosVideoPageState();
}

class _ConceptosVideoPageState extends State<ConceptosVideoPage> {
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