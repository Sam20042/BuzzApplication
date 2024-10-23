import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Message Like Logic', () {
    int likes = 0;

    test('increment like count', () {
      likes++;
      expect(likes, 1);
    });

    test('decrement like count', () {
      likes--;
      expect(likes, 0);
    });
  });
}
