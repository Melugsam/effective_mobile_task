import 'package:effective_mobile_task/features/menu/data/api/model/menu_get_model.dart';
import 'package:effective_mobile_task/features/menu/domain/bloc/menu_bloc.dart';
import 'package:effective_mobile_task/features/menu/presentation/widgets/show_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController _fromTextEditingController = TextEditingController();
  final TextEditingController _toTextEditingController = TextEditingController();
  final String _textFieldKey = 'last_text_input';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MenuBloc>(context).add(FetchMenuEvent());
    _loadLastTextInput();
  }

  @override
  void dispose() {
    _fromTextEditingController.dispose();
    super.dispose();
  }

  Future<void> _loadLastTextInput() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lastInput = prefs.getString(_textFieldKey) ?? '';
    setState(() {
      _fromTextEditingController.text = lastInput;
    });
  }

  Future<void> _saveLastTextInput(String input) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_textFieldKey, input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 12, 12, 1),
      body: SafeArea(
        child: SingleChildScrollView(
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
                              controller: _fromTextEditingController,
                              onChanged: (value) {
                                _saveLastTextInput(value);
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
                                showModal(context, _fromTextEditingController, _toTextEditingController, _saveLastTextInput);
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
        ),
      ),
    );
  }
}

class CitiesListWidget extends StatelessWidget {
  const CitiesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is MenuLoadingState) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          } else if (state is MenuLoadedState) {
            final MenuGetModel menuGetModel = state.offers;
            return SizedBox(
              height: 300,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: menuGetModel.offers.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 67,);
                },
                itemBuilder: (context, index) {
                  final offer = menuGetModel.offers[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/${offer.id}.png',
                        width: 132,
                        height: 132,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        offer.title,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        offer.town,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/menu_plane.svg',
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            "от ${offer.price.value.toString()} ₽",
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          } else if (state is MenuErrorState) {
            return Text('Ошибка: ${state.errorMessage}');
          } else {
            return const Text('Неизвестное состояние');
          }
        },
      ),
    );
  }
}

