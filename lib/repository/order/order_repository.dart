import '../../model/model.dart';

abstract class OrderRepository {
  Future<OrderResponse> createOrder(CreateOrderModel order);
}
