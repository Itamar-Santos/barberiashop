import 'package:dw11/src/core/fp/either.dart';
import 'package:dw11/src/model/barbershop_model.dart';
import 'package:dw11/src/model/user_model.dart';
import 'package:dw11/src/repositories/user/repository_exception.dart';

abstract class BarbershopRepository {
Future<Either<RepositoryException, BarberShopModel>> getMyBarberShop(UserModel userModel);
}