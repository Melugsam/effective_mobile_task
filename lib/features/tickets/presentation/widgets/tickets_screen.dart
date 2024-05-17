import 'package:effective_mobile_task/features/tickets/domain/model/tickets_route_params.dart';
import 'package:flutter/material.dart';

class TicketsScreen extends StatefulWidget {
  final TicketsRouteParams ticketsRouteParams;
  const TicketsScreen({super.key, required this.ticketsRouteParams});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
