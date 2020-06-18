import 'dart:async';
import 'dart:io';
import 'package:flutter_customs/plugins/dart_extensions.dart';

List<String> _avrDudePossibleLocations = [
  './',
  './assets/',
  './build/flutter_assets/packages/avr_dude/assets/',
  './data/flutter_assets/packages/avr_dude/assets/',
];

Future<bool> _directoryExists(String directory) async => await Directory(directory).exists();

class AvrDude {
  Future<ProcessResult> upload(AvrDudeConfig config) async => Process.run(
    'avrdude.exe',
    config.arguments(),
    workingDirectory: config.workingDirectory,
    runInShell: true,);
  ProcessResult uploadSync(AvrDudeConfig config) => Process.runSync(
    'avrdude.exe',
    config.arguments(),
    workingDirectory: config.workingDirectory,
    runInShell: true,);
}
class AvrDudeConfig {
  final String configFile;
  final String comPort;
  final String controller;
  final String programmer;
  final String baudRate;
  final String hexFile;
  final String workingDirectory;
  AvrDudeConfig({
    this.programmer = 'arduino',
    this.controller = 'atmega328p',
    this.baudRate = '115200',
    this.configFile = 'avrdude.conf',
    this.comPort = 'COM8',
    this.hexFile = 'blink.ino.hex',
    this.workingDirectory,
  });
  List<String> arguments() => [
    '-C$configFile',
    '-p$controller',
    '-c$programmer',
    '-P$comPort',
    '-b$baudRate',
    '-Uflash:w:$hexFile:i'];
  static Future<String> getAvrDudeLocation() async => _avrDudePossibleLocations.
  let((locations) async => locations.length.let((position) async {
    while(!await _directoryExists(locations[--position]) && position>= 0){}
    return position != -1 ? locations[position] + 'avrdude' : '';
  }));
}

