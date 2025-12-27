// Basic Flutter widget test for VolleyPass.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volleypass/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: VolleyPassApp()));

    // Verify that the app title is displayed
    expect(find.text('VolleyPass'), findsOneWidget);
    expect(find.text('VolleyPass Mobile'), findsOneWidget);
  });
}
