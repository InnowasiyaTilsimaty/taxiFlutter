import '../../model/model.dart';

abstract class UserRepository {
  Future<void> signup(SignUpModel users);
}
