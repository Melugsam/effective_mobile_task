// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_flights_get_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFlightsGetModel _$SearchFlightsGetModelFromJson(
        Map<String, dynamic> json) =>
    SearchFlightsGetModel(
      tickets_offers: (json['tickets_offers'] as List<dynamic>)
          .map((e) => TicketOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchFlightsGetModelToJson(
        SearchFlightsGetModel instance) =>
    <String, dynamic>{
      'tickets_offers': instance.tickets_offers,
    };

TicketOffer _$TicketOfferFromJson(Map<String, dynamic> json) => TicketOffer(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      time_range: (json['time_range'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: TicketPrice.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketOfferToJson(TicketOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'time_range': instance.time_range,
      'price': instance.price,
    };

TicketPrice _$TicketPriceFromJson(Map<String, dynamic> json) => TicketPrice(
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$TicketPriceToJson(TicketPrice instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
