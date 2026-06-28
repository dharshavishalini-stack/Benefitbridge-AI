import 'package:benefitbridge_ai/app.dart';
import 'package:benefitbridge_ai/core/constants/app_strings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BenefitBridgeApp loads initial splash route', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BenefitBridgeApp());

    expect(find.text(AppStrings.appName), findsOneWidget);
    expect(
      find.text('Bridging Citizens to Government Benefits'),
      findsOneWidget,
    );
  });
}
