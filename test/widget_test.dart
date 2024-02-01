import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:app_project/main.dart';

void main() {
  testWidgets('Check AppBar and Company Name', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our AppBar contains the correct icons.
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    expect(find.byIcon(Icons.account_circle), findsOneWidget);

    // Verify that our company name is displayed correctly.
    expect(find.text('Nishkaam Innovations'), findsOneWidget);
  });
}
