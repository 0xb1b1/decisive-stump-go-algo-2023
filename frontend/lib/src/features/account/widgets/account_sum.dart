import 'package:flutter/material.dart';

class AccountSum extends StatelessWidget {
  const AccountSum({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Всего на счетах',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF14161C),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '10 000 000 ₽',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 306,
            padding: const EdgeInsets.symmetric(vertical: 14),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFF3F4F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Вывести средства',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF14161C),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 306,
            padding: const EdgeInsets.symmetric(vertical: 14),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFF3F4F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Переводы между счетами',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF14161C),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
