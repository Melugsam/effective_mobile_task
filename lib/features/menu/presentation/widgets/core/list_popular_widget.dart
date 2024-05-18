import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../search/domain/bloc/search_info/search_info_bloc.dart';

class ListPopular extends StatelessWidget {
  final SearchInfoBloc searchInfoBloc;
  const ListPopular({super.key, required this.searchInfoBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 21),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(47, 48, 53, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              searchInfoBloc.toTextEditingController.text="Стамбул";
              context.go("/search");
            },
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/modal_istanbul.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Стамбул",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Популярное направление",
                        style: TextStyle(
                            color: Color.fromRGBO(94, 95, 74, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(
            color: Color.fromRGBO(94, 95, 74, 1),
          ),
          const SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: () {
              searchInfoBloc.toTextEditingController.text="Сочи";
              context.go("/search");
            },
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/modal_sochi.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Сочи",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Популярное направление",
                        style: TextStyle(
                            color: Color.fromRGBO(94, 95, 74, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(
            color: Color.fromRGBO(94, 95, 74, 1),
          ),
          const SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: () {
              searchInfoBloc.toTextEditingController.text="Пхукет";
              context.go("/search");
            },
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/modal_phuket.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Пхукет",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Популярное направление",
                        style: TextStyle(
                            color: Color.fromRGBO(94, 95, 74, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(
            color: Color.fromRGBO(94, 95, 74, 1),
          ),
        ],
      ),
    );
  }
}
