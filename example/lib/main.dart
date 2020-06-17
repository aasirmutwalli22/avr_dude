import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:avr_dude/avr_dude.dart';
import 'package:flutter_customs/plugins/dart_extensions.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.windows;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String uploadLogs = '';
  @override Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(
        children: [
          Center(
            child: FlatButton(
              child: Text('Upload'),
              onPressed: () async => AvrDude().
              upload(AvrDudeConfig(comPort: 'COM7', workingDirectory: await AvrDudeConfig.getAvrDudeLocation(),)).
              then((ProcessResult value) => setState(() => uploadLogs=value.stderr)),
            ),
          ),
          Text(uploadLogs),
        ],
      ),
    ),
  );
}
