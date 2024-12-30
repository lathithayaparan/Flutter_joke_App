import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/main.dart'; // Make sure this path is correct

void main() {
  testWidgets(
      'App starts with no jokes and fetches jokes on refresh button press',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Replace with your root widget name

    // Verify that our app initially shows a message indicating no jokes are available.
    expect(find.text('No jokes available.'), findsOneWidget);

    // Verify the presence of the refresh button (FloatingActionButton).
    expect(find.byIcon(Icons.refresh), findsOneWidget);

    // Tap the refresh button to simulate fetching jokes and trigger a frame.
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // Optionally, verify that a loading indicator appears after the button is pressed.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Optionally, verify that after the jokes are fetched, they are displayed in the app.
    // You can adjust this part based on how your app displays the fetched jokes.
    // For example, check if a joke is displayed:
    // expect(find.text('Some joke text'), findsOneWidget);
  });
}
