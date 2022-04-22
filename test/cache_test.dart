import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';

void main(List<String> args) {
  setUp(() {
    Hive.init("hive");
  });

  test('Name Box Create and Put', () async {
    final box = await Hive.openBox<String>('db');
    await box.add('dbOneItem');
    expect(box.values.first, 'dbOneItem');
  });
}
