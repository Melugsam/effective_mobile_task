// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_get_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuGetModel _$MenuGetModelFromJson(Map<String, dynamic> json) => MenuGetModel(
      offers: (json['offers'] as List<dynamic>)
          .map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuGetModelToJson(MenuGetModel instance) =>
    <String, dynamic>{
      'offers': instance.offers,
    };

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      town: json['town'] as String,
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'town': instance.town,
      'price': instance.price,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'value': instance.value,
    };
