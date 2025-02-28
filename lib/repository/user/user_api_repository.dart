import '../../configs/app_url.dart';
import '../../data/json_http_client.dart';
import '../../model/model.dart';
import 'user_repository.dart';

class UserApiRepository extends UserRepository {
  final JsonHttpClient httpClient;

  UserApiRepository({required this.httpClient});

  @override
  Future<Response> signup(SignUpModel users) async {
    return httpClient.post(
      AppUrl.register,
      body: users.toJson(),
      mapper: (data) => Response.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  Future<Response> login(LoginModel users) async {
    return httpClient.post(
      AppUrl.login,
      body: users.toJson(),
      mapper: (data) => Response.fromJson(data as Map<String, dynamic>),
    );
  }
}
