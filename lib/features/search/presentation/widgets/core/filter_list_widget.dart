import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class FilterListWidget extends StatefulWidget {
  const FilterListWidget({super.key});

  @override
  State<FilterListWidget> createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  String currentDate = DateFormat('d MMM, E').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2030),
              );
              // дата меняется и сохраняется у следующего контейнера
              if (pickedDate != null) {
                print('Выбранная дата: $pickedDate');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(47, 48, 53, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/search_plus.svg',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "обратно",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(47, 48, 53, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: InkWell(
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2030),
                );
                if (pickedDate != null) {
                  setState(() {
                    currentDate = DateFormat('d MMM, E').format(pickedDate);
                  });
                }
              },
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: translateMonth(currentDate.split(', ')[0]),
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: ", ${translateDay(currentDate.split(', ')[1])}",
                          style: const TextStyle(
                            color: Color.fromRGBO(159, 159, 159, 1),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8,),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(47, 48, 53, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/search_person.svg',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "1,эконом",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8,),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(47, 48, 53, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/search_filter.svg',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "фильтр",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String translateMonth(String englishMonth) {
    final Map<String, String> monthTranslations = {
      'Jan': 'янв',
      'Feb': 'фев',
      'Mar': 'мар',
      'Apr': 'апр',
      'May': 'май',
      'Jun': 'июн',
      'Jul': 'июл',
      'Aug': 'авг',
      'Sep': 'сен',
      'Oct': 'окт',
      'Nov': 'ноя',
      'Dec': 'дек',
    };
    List<String> dateParts = englishMonth.split(' ');
    String russianMonth = monthTranslations[dateParts[1]] ?? dateParts[1];

    return '${dateParts[0]} $russianMonth';
  }

  String translateDay(String englishDay) {
    final Map<String, String> dayTranslations = {
      'Mon': 'пн',
      'Tue': 'вт',
      'Wed': 'ср',
      'Thu': 'чт',
      'Fri': 'пт',
      'Sat': 'сб',
      'Sun': 'вс',
    };
    return dayTranslations[englishDay] ?? englishDay;
  }
}