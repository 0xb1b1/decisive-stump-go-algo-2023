import 'package:frontend/src/api/models/portfolios_dashboard.dart';

class CasesProvider {
  PortfoliosDashboard _data = const PortfoliosDashboard(strippedPortfolios: []);

  PortfoliosDashboard get data => _data;

  void updateData(PortfoliosDashboard newData) {
    _data = newData;
  }
}
