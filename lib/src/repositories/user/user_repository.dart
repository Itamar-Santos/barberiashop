import 'package:dw11/src/core/fp/either.dart';
import 'package:dw11/src/core/exceptions/auth_exception.dart';
import 'package:dw11/src/core/fp/nil.dart';
import 'package:dw11/src/model/user_model.dart';
import 'package:dw11/src/repositories/user/repository_exception.dart';

abstract interface class UserRepository {
  
  
Future<Either<AuthException, String>> login(String email, String password);

Future<Either<RepositoryException, UserModel>> me();

Future<Either<RepositoryException, Nil>> registerAdmin(({
  String name,
  String email,
  String password
}) userData);

}


