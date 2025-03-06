import '../../configs/app_url.dart';
import '../../model/model.dart';
import '../../service/service.dart';
import 'user_repository.dart';

class UserApiRepository extends UserRepository {
  final HttpClientService httpClientService;

  UserApiRepository({required this.httpClientService});

  @override
  Future<Response> signup(SignUpModel users) async {
    return httpClientService.httpClient.post(
      AppUrl.register,
      body: users.toJson(),
      mapper: (data) => Response.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  Future<Response> login(LoginModel users) async {
    return httpClientService.httpClient.post(
      AppUrl.login,
      body: users.toJson(),
      mapper: (data) => Response.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  Future<GetMe> getMe() async {
    return httpClientService.httpClient.get(
      AppUrl.getMe,
      mapper: (data) => GetMe.fromJson(data as Map<String, dynamic>),
    );
  }
}
