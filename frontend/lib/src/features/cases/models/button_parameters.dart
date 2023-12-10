import 'package:frontend/src/api/models/portfolio_stock.dart';

class ButtonParameters {
  final void Function(List<PortfolioStock> companyList) action;
  final String title;

  ButtonParameters({
    required this.action,
    required this.title,
  });
}
