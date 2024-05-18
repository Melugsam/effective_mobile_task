import 'package:effective_mobile_task/features/tickets/presentation/widgets/core/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api/model/tickets_get_model.dart';
import '../../../domain/bloc/tickets_info/tickets_info_bloc.dart';

class TicketsListViewWidget extends StatelessWidget {
  const TicketsListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsInfoBloc, TicketsInfoState>(
      builder: (context, state) {
        if (state is TicketsInfoLoadingState) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        } else if (state is TicketsInfoLoadedState) {
          final TicketsGetModel ticketsGetModel = state.tickets;
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ticketsGetModel.tickets.length,
            itemBuilder: (context, index) {
              final ticket = ticketsGetModel.tickets[index];
              return ticket.badge != null
                  ? Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TicketWidget(ticket: ticket),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(34, 97, 188, 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              ticket.badge.toString(),
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TicketWidget(ticket: ticket),
                    );
            },
          );
        } else if (state is TicketsInfoErrorState) {
          return Text('Ошибка: ${state.errorMessage}');
        } else {
          return const Text('Неизвестное состояние');
        }
      },
    );
  }
}
