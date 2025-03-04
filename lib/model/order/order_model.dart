import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class CreateOrderModel {
  @JsonKey(name: 'pickup_latitude')
  final String pickupLatitude;
  @JsonKey(name: 'pickup_longitude')
  final String pickupLongitude;
  @JsonKey(name: 'dropoff_latitude')
  final String dropOffLatitude;
  @JsonKey(name: 'dropoff_longitude')
  final String dropOffLongitude;
  final String? comment;
  @JsonKey(name: 'estimated_fare')
  final String estimatedFare;
  @JsonKey(name: 'date_book')
  final String dateBook;

  CreateOrderModel({
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.dropOffLatitude,
    required this.dropOffLongitude,
    required this.comment,
    required this.estimatedFare,
    required this.dateBook,
  });

  Map<String, dynamic> toJson() => _$CreateOrderModelToJson(this);

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) => _$CreateOrderModelFromJson(json);
}

@JsonSerializable()
class OrderResponse {
  @JsonKey(name: 'pickup_latitude')
  final String pickupLatitude;
  @JsonKey(name: 'pickup_longitude')
  final String pickupLongitude;
  @JsonKey(name: 'dropoff_latitude')
  final String dropOffLatitude;
  @JsonKey(name: 'dropoff_longitude')
  final String dropOffLongitude;
  final String? comment;
  @JsonKey(name: 'estimated_fare')
  final String estimatedFare;
  final String status;
  final String? driver;
  @JsonKey(name: 'date_book')
  final String dateBook;
  @JsonKey(name: 'date_created')
  final String dateCreated;

  OrderResponse({
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.dropOffLatitude,
    required this.dropOffLongitude,
    required this.comment,
    required this.estimatedFare,
    required this.status,
    required this.driver,
    required this.dateBook,
    required this.dateCreated,
  });

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
}
