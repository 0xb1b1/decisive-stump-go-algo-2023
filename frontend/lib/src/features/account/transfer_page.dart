import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/src/api/models/portfolio_wrapper.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/features/account/widgets/cases_block.dart';

class TransferPage extends StatefulWidget {
  final Function({required PortfolioWrapper from, required PortfolioWrapper to, required double amount}) onTransfer;
  final List<PortfolioWrapper> cases;

  const TransferPage({
    Key? key,
    required this.onTransfer,
    required this.cases,
  }) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  int selectedId1 = 0;
  int selectedId2 = 1;

  TextEditingController textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool hasTransfered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.greyBg,
        foregroundColor: AppPalette.greyBg,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppPalette.greyText,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 36,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Перевести с',
                style: TextStyle(
                  color: Color(0xFF14161C),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              CasesBlock(
                cases: widget.cases,
                onCaseTap: (n) {
                  if (n != selectedId2) {
                    setState(() {
                      selectedId1 = n;
                    });
                  } else {
                    setState(() {
                      selectedId2 = selectedId1;
                      selectedId1 = n;
                    });
                  }
                },
                selectedId: selectedId1,
              ),
              const SizedBox(height: 76),
              const Text(
                'На счет',
                style: TextStyle(
                  color: Color(0xFF14161C),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              CasesBlock(
                cases: widget.cases,
                onCaseTap: (n) {
                  if (n != selectedId1) {
                    setState(() {
                      selectedId2 = n;
                    });
                  } else {
                    setState(() {
                      selectedId1 = selectedId2;
                      selectedId2 = n;
                    });
                  }
                },
                selectedId: selectedId2,
              ),
              const SizedBox(height: 76),
              const Text(
                'Укажите сумму',
                style: TextStyle(
                  color: Color(0xFF14161C),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 360,
                    padding: const EdgeInsets.fromLTRB(26, 20, 26, 0),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: numberValidator(),
                        controller: textController,
                        style: const TextStyle(
                          color: AppPalette.black,
                          fontSize: 16,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        ],
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Сумма от 0.01 ₽ до 200 000 000 ₽',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(102, 102, 102, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 350,
                  //   child: TextField(
                  //     controller: textController,
                  //     inputFormatters: [
                  //       FilteringTextInputFormatter.digitsOnly,
                  //     ],
                  //     decoration: InputDecoration(
                  //       hintText: 'Сумма от 0.01 ₽ до 200 000 000 ₽',
                  //       filled: true,
                  //       fillColor: AppPalette.white,
                  //       hoverColor: AppPalette.white.withOpacity(0.8),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(largeRadius),
                  //         borderSide: BorderSide.none,
                  //       ),
                  //     ),
                  //     obscureText: true, // To hide password text
                  //   ),
                  // ),
                  // const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      if (!hasTransfered) {
                        if (_formKey.currentState!.validate()) {
                          widget.onTransfer(
                              from: widget.cases[selectedId1],
                              to: widget.cases[selectedId2],
                              amount: double.parse(textController.text));
                          setState(() {
                            hasTransfered = true;
                          });
                        }
                      }
                    },
                    child: Container(
                      width: 234,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: !hasTransfered ? const Color(0xFF2C53F4) : const Color(0xFF6783F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          !hasTransfered ? 'Перевести' : 'Перевод выполнен',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: !hasTransfered ? Colors.white : const Color(0xFFC0CBFC),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

FormFieldValidator<String> numberValidator() {
  return (value) {
    final rez = double.tryParse(value ?? '');
    if (rez == null) {
      return 'некорректный формат числа';
    }
    if (rez < 0.01 || rez > 200000000) {
      return 'Сумма должна быть от 0.01 ₽ до 200 000 000 ₽';
    }

    return null;
  };
}
