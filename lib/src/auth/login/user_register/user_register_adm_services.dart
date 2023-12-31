import 'package:dw11/src/core/exceptions/service_exception.dart';
import 'package:dw11/src/core/fp/either.dart';
import 'package:dw11/src/core/fp/nil.dart';
abstract interface class UserRegisterAdmServices {
Future<Either<ServiceException, Nil>> execute(({
  String name,
  String email,
  String password
}) userData);
}
