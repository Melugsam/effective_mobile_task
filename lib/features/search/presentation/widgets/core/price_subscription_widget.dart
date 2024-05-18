import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceSubscriptionWidget extends StatefulWidget {

  const PriceSubscriptionWidget({super.key});

  @override
  State<PriceSubscriptionWidget> createState() => _PriceSubscriptionWidgetState();
}

class _PriceSubscriptionWidgetState extends State<PriceSubscriptionWidget> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(36, 37, 51, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              SvgPicture.asset(
                'assets/svg/search_notification.svg',
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8,),
              const Text(
                "Подписка на цену",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ],
          ),
          Switch(
            value: light,
            activeColor: const Color.fromRGBO(34, 97, 188, 1),
            onChanged: (bool value) {
              setState(() {
                light = value;
              });
            },
          )
        ],
      ),
    );
  }
}
