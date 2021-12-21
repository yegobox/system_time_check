import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_time_check/system_time_check.dart';

void main() {
  const MethodChannel channel = MethodChannel('system_time_check');

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
    expect(await SystemTimeCheck.platformVersion, '42');
  });
}
