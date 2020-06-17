import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:avr_dude/avr_dude.dart';

void main() {
  const MethodChannel channel = MethodChannel('avr_dude');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AvrDude.platformVersion, '42');
  });
}
