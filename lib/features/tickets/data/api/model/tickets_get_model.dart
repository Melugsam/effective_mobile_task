import 'package:json_annotation/json_annotation.dart';

part 'tickets_get_model.g.dart';

@JsonSerializable()
class TicketsGetModel {
  final List<Ticket> tickets;

  TicketsGetModel({required this.tickets});

  factory TicketsGetModel.fromJson(Map<String, dynamic> json) => _$TicketsGetModelFromJson(json);
  Map<String, dynamic> toJson() => _$TicketsGetModelToJson(this);
}

@JsonSerializable()
class Ticket {
  final int id;
  final String? badge;
  final Price price;
  final String provider_name;
  final String company;
  final FlightInfo departure;
  final FlightInfo arrival;
  final bool has_transfer;
  final bool has_visa_transfer;
  final Luggage luggage;
  final HandLuggage hand_luggage;
  final bool is_returnable;
  final bool is_exchangable;

  Ticket({
    required this.id,
    this.badge,
    required this.price,
    required this.provider_name,
    required this.company,
    required this.departure,
    required this.arrival,
    required this.has_transfer,
    required this.has_visa_transfer,
    required this.luggage,
    required this.hand_luggage,
    required this.is_returnable,
    required this.is_exchangable,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}

@JsonSerializable()
class Price {
  final int value;

  Price({required this.value});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class FlightInfo {
  final String town;
  final DateTime date;
  final String airport;

  FlightInfo({
    required this.town,
    required this.date,
    required this.airport,
  });

  factory FlightInfo.fromJson(Map<String, dynamic> json) => _$FlightInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FlightInfoToJson(this);
}

@JsonSerializable()
class Luggage {
  final bool has_luggage;
  final Price? price;

  Luggage({
    required this.has_luggage,
    this.price,
  });

  factory Luggage.fromJson(Map<String, dynamic> json) => _$LuggageFromJson(json);
  Map<String, dynamic> toJson() => _$LuggageToJson(this);
}

@JsonSerializable()
class HandLuggage {
  final bool has_hand_luggage;
  final String? size;

  HandLuggage({
    required this.has_hand_luggage,
    this.size,
  });

  factory HandLuggage.fromJson(Map<String, dynamic> json) => _$HandLuggageFromJson(json);
  Map<String, dynamic> toJson() => _$HandLuggageToJson(this);
}
