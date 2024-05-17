import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShowTicketsButtonWidget extends StatelessWidget {
  const ShowTicketsButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.go("/tickets");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(34, 97, 188, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Посмотреть все билеты',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
