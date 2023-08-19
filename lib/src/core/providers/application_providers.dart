import 'package:dw11/src/core/fp/either.dart';
import 'package:dw11/src/core/restClient/rest_client.dart';
import 'package:dw11/src/model/barbershop_model.dart';
import 'package:dw11/src/model/user_model.dart';
import 'package:dw11/src/repositories/user/barbershop_repository.dart';
import 'package:dw11/src/repositories/user/barbershop_repositoryimpl.dart';
import 'package:dw11/src/repositories/user/user_repository.dart';
import 'package:dw11/src/repositories/user/user_repository_impl.dart';
import 'package:dw11/src/services/user_login_service.dart';
import 'package:dw11/src/services/user_login_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_providers.g.dart'; 

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) =>
UserRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
UsersLoginService usersLoginService(UsersLoginServiceRef ref) => 
UsersLoginServiceImpl(userRepository: ref.read(userRepositoryProvider));

@Riverpod(keepAlive: true)
Future<UserModel> getMe(GetMeRef ref) async {
final result = await ref.watch(userRepositoryProvider).me();

return switch (result){
  Success(value: final userModel) => userModel,
  Failure(:final exception) => throw exception,
};
} 


@Riverpod(keepAlive: true)
BarbershopRepository barberShopRepository(BarberShopRepositoryRef ref ) =>
BarbershopRepositoryimpl(restClient: ref.watch(restClientProvider));

@Riverpod(keepAlive: true)
Future<BarberShopModel> getMyBarberShop(GetMyBarberShopRef ref) async
{
  final userModel = await ref.watch(getMeProvider.future);
  final barbershopRepository = ref.watch(barberShopRepositoryProvider);
  final result = await barbershopRepository.getMyBarberShop(userModel);


return switch (result){
  Success(value: final barbershop) => barbershop,
  Failure(:final exception) => throw exception
};
}