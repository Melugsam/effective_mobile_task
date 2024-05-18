import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../search/domain/bloc/search_info/search_info_bloc.dart';

class ListAdvice extends StatelessWidget {
  final SearchInfoBloc searchInfoBloc;
  const ListAdvice({super.key, required this.searchInfoBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showPlaceholder(context);
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/modal_list_advice_icon1.svg',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Сложный\nмаршрут",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              searchInfoBloc.toTextEditingController.text="Куда угодно";
              context.go("/search");
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/modal_list_advice_icon2.svg',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Куда угодно",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showPlaceholder(context);
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/modal_list_advice_icon3.svg',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Выходные",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showPlaceholder(context);
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/modal_list_advice_icon4.svg',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Горячие\nбилеты",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showPlaceholder(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'Заглушка',
            style: TextStyle(color: Colors.white),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Это заглушка.', style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Закрыть', style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }
}