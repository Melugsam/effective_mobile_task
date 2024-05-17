import 'package:json_annotation/json_annotation.dart';

part 'search_flights_get_model.g.dart';

@JsonSerializable()
class SearchFlightsGetModel {
  final List<TicketOffer> tickets_offers;

  SearchFlightsGetModel({required this.tickets_offers});

  factory SearchFlightsGetModel.fromJson(Map<String, dynamic> json) =>
      _$SearchFlightsGetModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFlightsGetModelToJson(this);
}

@JsonSerializable()
class TicketOffer {
  final int id;
  final String title;
  final List<String> time_range;
  final TicketPrice price;

  TicketOffer({
    required this.id,
    required this.title,
    required this.time_range,
    required this.price,
  });

  factory TicketOffer.fromJson(Map<String, dynamic> json) =>
      _$TicketOfferFromJson(json);

  Map<String, dynamic> toJson() => _$TicketOfferToJson(this);
}

@JsonSerializable()
class TicketPrice {
  final int value;

  TicketPrice({required this.value});

  factory TicketPrice.fromJson(Map<String, dynamic> json) =>
      _$TicketPriceFromJson(json);

  Map<String, dynamic> toJson() => _$TicketPriceToJson(this);
}
