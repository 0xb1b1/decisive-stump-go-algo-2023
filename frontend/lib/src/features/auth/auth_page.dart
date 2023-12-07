import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/border_radius/border_radius.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';

import '../../common/strings.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(95),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.authTitle,
                    style: AppTypography.sectionTitle.copyWith(fontSize: 44),
                  ),
                  const SizedBox(
                    height: 67,
                  ),
                  const Text(
                    Strings.authSubtitle,
                    style: AppTypography.regularBlack,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'img/auth.png',
                height: 378,
                width: 295,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: Strings.enterEmail,
                      filled: true,
                      fillColor: AppPalette.greyBg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(largeRadius),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: Strings.enterPassword,
                      filled: true,
                      fillColor: AppPalette.greyBg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(largeRadius),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true, // To hide password text
                  ),
                  const SizedBox(height: 36), // Spacing before the button
                  ElevatedButton(
                    onPressed: () {
                      // Your login action here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppPalette.mainBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(mediumRadius),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: const Text(Strings.signUp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
