import 'package:flutter_test/flutter_test.dart';
import 'package:movie_watchlist/main.dart';

void main() {
  testWidgets('Smoke test app launch', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Movie Watchlist Ready'), findsOneWidget);
  });
}
