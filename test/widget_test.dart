import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanjay_and_benita/main.dart';

void main() {
  testWidgets('App renders wedding invitation title', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const ProviderScope(child: SanjayAndBenitaWeddingApp()));
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('SANJAY'), findsWidgets);
    expect(find.text('BENITA'), findsWidgets);

    // Pump and dispose cleanly
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 2));
  });
}
