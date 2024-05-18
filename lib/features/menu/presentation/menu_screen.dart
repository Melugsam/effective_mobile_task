import 'package:effective_mobile_task/features/menu/domain/bloc/menu_bloc.dart';
import 'package:effective_mobile_task/features/menu/presentation/widgets/core/cities_list_widget.dart';
import 'package:effective_mobile_task/features/menu/presentation/widgets/modules/show_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../search/domain/bloc/search_info/search_info_bloc.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final String _textFieldKey = 'last_text_input';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MenuBloc>(context).add(FetchMenuEvent());
    _loadLastTextInput();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadLastTextInput() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lastInput = prefs.getString(_textFieldKey) ?? '';
    setState(() {
      _textEditingController.text = lastInput;
    });
  }

  Future<void> _saveLastTextInput(String input) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_textFieldKey, input);
  }

  @override
  Widget build(BuildContext context) {
    final searchInfoBloc = context.read<SearchInfoBloc>();
    searchInfoBloc.fromTextEditingController = _textEditingController;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          const Center(
            child: Text(
              "Поиск дешевых\nавиабилетов",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(47, 48, 53, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 63, 67, 1),
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
                  SvgPicture.asset(
                    'assets/svg/menu_search.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          controller: _textEditingController,
                          onChanged: (value) {
                            _saveLastTextInput(value);
                            searchInfoBloc.fromTextEditingController =
                                _textEditingController;
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
                          decoration: const InputDecoration(
                            hintText: 'Откуда - Москва',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(159, 159, 159, 1),
                            ),
                            border: InputBorder.none,
                            filled: false,
                          ),
                        ),
                        const Divider(
                          color: Color.fromRGBO(94, 95, 97, 1),
                          height: 1,
                        ),
                        TextFormField(
                          readOnly: true,
                          onTap: () {
                            showModal(
                                context, searchInfoBloc, _saveLastTextInput);
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
                              RegExp(r'[а-яА-Я]'),
                            ),
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Куда - Турция',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(159, 159, 159, 1),
                              decorationColor: Color.fromRGBO(62, 63, 67, 1),
                            ),
                            border: InputBorder.none,
                            filled: false,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Музыкально отлететь",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const CitiesListWidget(),
        ],
      ),
    );
  }
}
