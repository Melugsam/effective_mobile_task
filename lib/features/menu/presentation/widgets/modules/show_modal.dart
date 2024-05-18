import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../search/domain/bloc/search_info/search_info_bloc.dart';
import '../core/list_advice_widget.dart';
import '../core/list_popular_widget.dart';

void showModal(
    BuildContext context,
    SearchInfoBloc searchInfoBloc,
    Function(String) saveLastTextInput)
{
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(36, 37, 41, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(94, 95, 97, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 38,
                  height: 5,
                ),
                const SizedBox(
                  height: 34,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(47, 48, 53, 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: searchInfoBloc.fromTextEditingController,
                        onChanged: (value) {
                          saveLastTextInput(value);
                        },
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
                          prefixIcon: SvgPicture.asset(
                            'assets/svg/modal_plane.svg',
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
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
                          ),
                          border: InputBorder.none,
                          filled: false,
                          prefixIcon: SvgPicture.asset(
                            'assets/svg/menu_search.svg',
                            height: 5,
                            width: 5,
                          ),
                          suffixIcon: IconButton(
                            icon: SizedBox(
                              height: 24,
                              width: 24,
                              child: SvgPicture.asset(
                                'assets/svg/modal_close.svg',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            onPressed: () {
                              searchInfoBloc.toTextEditingController.clear();
                            },
                          ),
                        ),
                        onSubmitted: (value) {
                          context.go("/search");
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ListAdvice(searchInfoBloc: searchInfoBloc,),
                const SizedBox(
                  height: 30,
                ),
                ListPopular(searchInfoBloc: searchInfoBloc),
              ],
            )),
      );
    },
  );
}
