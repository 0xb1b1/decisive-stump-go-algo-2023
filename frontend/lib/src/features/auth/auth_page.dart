import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/common/theme/border_radius/border_radius.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/features/auth/auth_state.dart';
import 'package:frontend/src/features/current_page/current_page.dart';
import 'package:get_it/get_it.dart';

import '../../common/strings.dart';
import 'auth_cubit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void transition() => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const CurrentPage(),
        ),
      );

  void showToast() {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50.0,
        left: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: AppPalette.mainBlue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Text(
              Strings.errorMessage,
              style: TextStyle(color: AppPalette.white),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  List<String> _getInputValues() => [_controller1.text, _controller2.text];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<AuthCubit>(),
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(95),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (BuildContext context, AuthState state) {
              return state.maybeWhen(
                orElse: () => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.authTitle,
                            style: AppTypography.sectionTitle
                                .copyWith(fontSize: 44),
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
                                borderRadius:
                                    BorderRadius.circular(largeRadius),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: _controller1,
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          TextField(
                            controller: _controller2,
                            decoration: InputDecoration(
                              hintText: Strings.enterPassword,
                              filled: true,
                              fillColor: AppPalette.greyBg,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(largeRadius),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 36),
                          ElevatedButton(
                            onPressed: () async {
                              final values = _getInputValues();
                              final isSuccess =
                                  await BlocProvider.of<AuthCubit>(context)
                                      .enterToApp(
                                email: values[0],
                                password: values[1],
                              );
                              if (isSuccess) {
                                transition();
                              } else {
                                showToast();
                                _controller1.clear();
                                _controller2.clear();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: AppPalette.white,
                              backgroundColor: AppPalette.mainBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(mediumRadius),
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
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
