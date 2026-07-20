import 'package:flutter_test/flutter_test.dart';
import 'package:gangadhar_portfolio/app/portfolio_app.dart';

void main() {
  testWidgets('Portfolio app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.byType(PortfolioApp), findsOneWidget);
  });
}
