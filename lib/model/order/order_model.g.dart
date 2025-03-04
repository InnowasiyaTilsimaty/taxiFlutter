// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderModel _$CreateOrderModelFromJson(Map<String, dynamic> json) =>
    CreateOrderModel(
      pickupLatitude: json['pickup_latitude'] as String,
      pickupLongitude: json['pickup_longitude'] as String,
      dropOffLatitude: json['dropoff_latitude'] as String,
      dropOffLongitude: json['dropoff_longitude'] as String,
      comment: json['comment'] as String?,
      estimatedFare: json['estimated_fare'] as String,
      dateBook: json['date_book'] as String,
    );

Map<String, dynamic> _$CreateOrderModelToJson(CreateOrderModel instance) =>
    <String, dynamic>{
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'dropoff_latitude': instance.dropOffLatitude,
      'dropoff_longitude': instance.dropOffLongitude,
      'comment': instance.comment,
      'estimated_fare': instance.estimatedFare,
      'date_book': instance.dateBook,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      pickupLatitude: json['pickup_latitude'] as String,
      pickupLongitude: json['pickup_longitude'] as String,
      dropOffLatitude: json['dropoff_latitude'] as String,
      dropOffLongitude: json['dropoff_longitude'] as String,
      comment: json['comment'] as String?,
      estimatedFare: json['estimated_fare'] as String,
      status: json['status'] as String,
      driver: json['driver'] as String?,
      dateBook: json['date_book'] as String,
      dateCreated: json['date_created'] as String,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'dropoff_latitude': instance.dropOffLatitude,
      'dropoff_longitude': instance.dropOffLongitude,
      'comment': instance.comment,
      'estimated_fare': instance.estimatedFare,
      'status': instance.status,
      'driver': instance.driver,
      'date_book': instance.dateBook,
      'date_created': instance.dateCreated,
    };
