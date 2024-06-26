import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/bloc/search_info/search_info_bloc.dart';

class CustomSearchBarWidget extends StatelessWidget {

  const CustomSearchBarWidget(
      {super.key});

  @override
  Widget build(BuildContext context) {
    final searchInfoBloc = context.read<SearchInfoBloc>();
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 47, 16, 0),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(47, 48, 53, 1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.go("/"),
            child: SvgPicture.asset(
              'assets/svg/search_arrow_back.svg',
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              children: [
                TextField(
                  controller: searchInfoBloc.fromTextEditingController,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    decorationThickness: 0,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[а-яА-Я]')),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Откуда - Москва',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                    ),
                    border: InputBorder.none,
                    filled: false,
                    suffixIcon: IconButton(
                      icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          'assets/svg/search_change.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      onPressed: () {
                        String fromText = searchInfoBloc.fromTextEditingController.text;
                        String toText = searchInfoBloc.toTextEditingController.text;
                        searchInfoBloc.fromTextEditingController.text = toText;
                        searchInfoBloc.toTextEditingController.text = fromText;
                      },
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromRGBO(94, 95, 97, 1),
                  height: 1,
                ),
                TextField(
                  controller: searchInfoBloc.toTextEditingController,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    decorationThickness: 0,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[а-яА-Я]'),
                    ),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Куда - Турция',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                      decorationColor: Color.fromRGBO(62, 63, 67, 1),
                    ),
                    border: InputBorder.none,
                    filled: false,
                    suffixIcon: IconButton(
                      icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          'assets/svg/search_close.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      onPressed: () {
                        searchInfoBloc.toTextEditingController.clear();
                      },
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
