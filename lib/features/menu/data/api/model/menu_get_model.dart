import 'package:json_annotation/json_annotation.dart';

part 'menu_get_model.g.dart';

@JsonSerializable()
class MenuGetModel {
  final List<Offer> offers;

  MenuGetModel({required this.offers});

  factory MenuGetModel.fromJson(Map<String, dynamic> json) => _$MenuGetModelFromJson(json);
  Map<String, dynamic> toJson() => _$MenuGetModelToJson(this);
}

@JsonSerializable()
class Offer {
  final int id;
  final String title;
  final String town;
  final Price price;

  Offer({required this.id, required this.title, required this.town, required this.price});

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
  Map<String, dynamic> toJson() => _$OfferToJson(this);
}

@JsonSerializable()
class Price {
  final int value;

  Price({required this.value});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
