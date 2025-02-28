import '../../model/model.dart';

abstract class UserRepository {
  Future<Response> signup(SignUpModel users);

  Future<Response> login(LoginModel users);
}
