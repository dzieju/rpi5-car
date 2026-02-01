import 'package:flutter_test/flutter_test.dart';
import 'package:rpi5_car_radio/main.dart';

void main() {
  testWidgets('Car Radio Interface has correct title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CarRadioApp());

    // Verify that the app title appears in the AppBar.
    expect(find.text('Car Radio'), findsOneWidget);
  });

  testWidgets('Car Radio Interface has three main buttons', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CarRadioApp());

    // Verify that all three buttons are present.
    expect(find.text('Spotify'), findsOneWidget);
    expect(find.text('YouTube'), findsOneWidget);
    expect(find.text('Google Maps'), findsOneWidget);
  });

  testWidgets('Car Radio Interface has bottom navigation bar with message', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CarRadioApp());

    // Verify that the bottom navigation bar message is displayed.
    expect(find.text('Twoje Centrum Multimedialne'), findsOneWidget);
  });

  testWidgets('Buttons are tappable', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CarRadioApp());

    // Tap the Spotify button.
    await tester.tap(find.text('Spotify'));
    await tester.pump();

    // Tap the YouTube button.
    await tester.tap(find.text('YouTube'));
    await tester.pump();

    // Tap the Google Maps button.
    await tester.tap(find.text('Google Maps'));
    await tester.pump();

    // If we reach here without errors, buttons are working.
  });
}
