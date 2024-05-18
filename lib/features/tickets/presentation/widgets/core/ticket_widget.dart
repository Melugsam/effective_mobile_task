import 'package:flutter/material.dart';
import '../../../data/api/model/tickets_get_model.dart';

class TicketWidget extends StatelessWidget {
  final Ticket ticket;

  const TicketWidget({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(29, 30, 32, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${formatPriceWithSpaces(ticket.price.value.toString())} ₽",
              style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 12,
                backgroundColor: Color.fromRGBO(255, 94, 94, 1),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatDateTime(ticket.departure.date),
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            ticket.departure.airport,
                            style: const TextStyle(
                              color: Color.fromRGBO(159, 159, 159, 1),
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(4),
                            width: 10,
                            height: 1,
                            color: const Color.fromRGBO(159, 159, 159, 1),
                          ),
                          const Text("")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatDateTime(ticket.arrival.date),
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            ticket.arrival.airport,
                            style: const TextStyle(
                              color: Color.fromRGBO(159, 159, 159, 1),
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            calculateTime(
                                ticket.departure.date, ticket.arrival.date),
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text("")
                        ],
                      ),
                      if (ticket.has_transfer) ...[
                        const Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  " / ",
                                  style: TextStyle(
                                    color: Color.fromRGBO(159, 159, 159, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Без пересадок",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text("")
                          ],
                        ),
                      ],
                    ],
                  ),
                ],
              ),

            ],
          )
        ],
      ),
    );
  }

  String formatPriceWithSpaces(String price) {
    String reversed = price.split('').reversed.join('');
    StringBuffer formatted = StringBuffer();
    for (int i = 0; i < reversed.length; i++) {
      if (i > 0 && i % 3 == 0) {
        formatted.write(' ');
      }
      formatted.write(reversed[i]);
    }
    return formatted.toString().split('').reversed.join('');
  }

  String formatDateTime(DateTime dateTime) {
    String hours = dateTime.hour.toString().padLeft(2, '0');
    String minutes = dateTime.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  String calculateTime(DateTime departureDate, DateTime arrivalDate) {
    Duration difference = arrivalDate.difference(departureDate);
    double hours = difference.inMinutes / 60;
    int roundedHours = hours.floor();
    int minutes = difference.inMinutes % 60;
    if (minutes > 30) {
      return "${roundedHours + 0.5}ч в пути";
    } else {
      return "$roundedHoursч в пути";
    }
  }
}
