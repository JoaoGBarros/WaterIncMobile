import 'package:app/core/core.dart';

abstract class IUserAPI {
  FutureEitherVoid saveUserData();
}

class UserAPI implements IUserAPI {}
