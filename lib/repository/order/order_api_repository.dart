import '../../configs/app_url.dart';
import '../../model/model.dart';
import '../../service/service.dart';
import 'order_repository.dart';

class OrderApiRepository extends OrderRepository {
  final HttpClientService httpClientService;

  OrderApiRepository({required this.httpClientService});

  @override
  Future<OrderResponse> createOrder(CreateOrderModel order) async {
    return httpClientService.httpClient.post(
      AppUrl.createOrder,
      body: order.toJson(),
      mapper: (data) => OrderResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
