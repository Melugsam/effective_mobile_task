import 'package:effective_mobile_task/features/menu/domain/model/search_route_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

void showModal(

    BuildContext context,
    TextEditingController fromTextEditingController,
    TextEditingController toTextEditingController,
    Function(String) saveLastTextInput) {
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
                        controller: fromTextEditingController,
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
                        controller: toTextEditingController,
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
                              toTextEditingController.clear();
                            },
                          ),
                        ),
                        onSubmitted: (value) {
                          final searchRouterParams = SearchRouteParams(fromTextEditingController: fromTextEditingController, toTextEditingController: toTextEditingController);
                          context.go("/search", extra: searchRouterParams);

                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const ListAdvice(),
                const SizedBox(
                  height: 30,
                ),
                const ListPopular(),
              ],
            )),
      );
    },
  );
}

class ListAdvice extends StatelessWidget {
  const ListAdvice({super.key});

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

class ListPopular extends StatelessWidget {
  const ListPopular({super.key});

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
          Row(
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
          const SizedBox(
            height: 4,
          ),
          const Divider(
            color: Color.fromRGBO(94, 95, 74, 1),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
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
          const SizedBox(
            height: 4,
          ),
          const Divider(
            color: Color.fromRGBO(94, 95, 74, 1),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
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
