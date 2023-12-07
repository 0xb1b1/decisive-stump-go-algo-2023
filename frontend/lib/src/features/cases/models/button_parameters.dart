import 'dart:html';

import 'company.dart';

class ButtonParameters {
  final void Function(List<Company> companyList) action;
  final String title;

  ButtonParameters({
    required this.action,
    required this.title,
  });
}
