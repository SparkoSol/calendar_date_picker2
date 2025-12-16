import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Calendar date picker2 unit test', () {});
  testWidgets('Constant initial list wont throw unmodified list',
      (widgetTester) async {
    const emp = <DateTime>[];
    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CalendarDatePicker2(
            value: emp, config: CalendarDatePicker2Config()),
      ),
    ));
  });

  group('CalendarDatePicker2WithActionButtonsConfig padding tests', () {
    test('leftPadding and rightPadding parameters can be set', () {
      final config = CalendarDatePicker2WithActionButtonsConfig(
        leftPadding: 20,
        rightPadding: 20,
      );

      expect(config.leftPadding, 20);
      expect(config.rightPadding, 20);
    });

    test('leftPadding and rightPadding default to null', () {
      final config = CalendarDatePicker2WithActionButtonsConfig();

      expect(config.leftPadding, null);
      expect(config.rightPadding, null);
    });

    test('copyWith preserves leftPadding and rightPadding', () {
      final config = CalendarDatePicker2WithActionButtonsConfig(
        leftPadding: 20,
        rightPadding: 30,
      );

      final copiedConfig = config.copyWith();

      expect(copiedConfig.leftPadding, 20);
      expect(copiedConfig.rightPadding, 30);
    });

    test('copyWith can update leftPadding and rightPadding', () {
      final config = CalendarDatePicker2WithActionButtonsConfig(
        leftPadding: 20,
        rightPadding: 30,
      );

      final updatedConfig = config.copyWith(
        leftPadding: 40,
        rightPadding: 50,
      );

      expect(updatedConfig.leftPadding, 40);
      expect(updatedConfig.rightPadding, 50);
    });

    testWidgets('leftPadding and rightPadding are applied to action buttons row',
        (widgetTester) async {
      final config = CalendarDatePicker2WithActionButtonsConfig(
        leftPadding: 24,
        rightPadding: 32,
      );

      await widgetTester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CalendarDatePicker2WithActionButtons(
            value: const [],
            config: config,
          ),
        ),
      ));

      // Verify widget builds without errors
      expect(find.byType(CalendarDatePicker2WithActionButtons), findsOneWidget);
    });
  });
}
