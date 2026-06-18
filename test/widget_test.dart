import 'package:flutter_test/flutter_test.dart';
import 'package:vika_vitamin_companion/main.dart'; // Sesuaikan dengan nama package kamu

void main() {
  testWidgets('Counter blackjack test', (WidgetTester tester) async {
    await tester.pumpWidget(const VikaApp());
  });
}