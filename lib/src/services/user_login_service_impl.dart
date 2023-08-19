import 'package:dw11/src/core/constants/local_storage_keys.dart';
import 'package:dw11/src/core/exceptions/auth_exception.dart';
import 'package:dw11/src/core/exceptions/service_exception.dart';
import 'package:dw11/src/core/fp/either.dart';
import 'package:dw11/src/core/fp/nil.dart';
import 'package:dw11/src/repositories/user/user_repository.dart';
import 'package:dw11/src/services/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersLoginServiceImpl implements UsersLoginService {
  final UserRepository userRepository;

  UsersLoginServiceImpl({required this.userRepository});

  @override
  Future<Either<ServiceException, Nil>> execute(
      String email, String password) async {
    final loginResult = await userRepository.login(email, password);

    switch (loginResult) {
      case Success(value: final accessToken):
      final sp = await SharedPreferences.getInstance();
      sp.setString(LocalStorageKeys.accessToken, accessToken);
        return Success(nil);
      case Failure(:final exception):
        return switch (exception) {
           AuthError() =>
            Failure(ServiceException(message: 'erro ao realizar login')),

           AuthUnauthorizedException() =>
             Failure(
                ServiceException(message: 'login ou senha inválidos')),
        };
    }
  }
}
