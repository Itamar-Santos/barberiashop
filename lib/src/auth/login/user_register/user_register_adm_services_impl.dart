import 'package:dw11/src/core/exceptions/service_exception.dart';
import 'package:dw11/src/core/fp/either.dart';
import 'package:dw11/src/core/fp/nil.dart';
import 'package:dw11/src/repositories/user/user_repository.dart';
import 'package:dw11/src/services/user_login_service.dart';
import 'user_register_adm_services.dart';

class UserRegisterAdmServicesImpl implements UserRegisterAdmServices {
  final UserRepository userRepository;
  final UsersLoginService userLoginService;

  UserRegisterAdmServicesImpl({
    required this.userRepository,
    required this.userLoginService,
  });
  
  @override
  Future<Either<ServiceException, Nil>> execute(
    ({String email, String name, String password}) userData) async {
final registerResult = await userRepository.registerAdmin(userData);

switch(registerResult){
  case Success():
  return await userLoginService.execute(userData.email, userData.password);
  case Failure(:final exception):
  return Failure(ServiceException(message: exception.message));
}
  }

}