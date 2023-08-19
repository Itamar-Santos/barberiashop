// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:dw11/src/core/fp/either.dart';
import 'package:dw11/src/core/restClient/rest_client.dart';
import 'package:dw11/src/model/barbershop_model.dart';
import 'package:dw11/src/model/user_model.dart';
import 'package:dw11/src/repositories/user/barbershop_repository.dart';

import 'package:dw11/src/repositories/user/repository_exception.dart';

class BarbershopRepositoryimpl implements BarbershopRepository {
  final RestClient restClient;
  BarbershopRepositoryimpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, BarberShopModel>> getMyBarberShop(
      UserModel userModel) async {
    switch (userModel) {
      case UserModelADM():
        final Response(data: List(first: data)) = await restClient.auth.get(
          '/barbershop',
          queryParameters: {'user_id': '#userAuthRef'},
        );
        return Success(BarberShopModel.fromMap(data));
      case UserModelEmployee():
        final Response(:data) = await restClient.auth.get(
          '/barbershop/${userModel.babershopId}',
          queryParameters: {'user_id': '#userAuthRef'},
        );
        return Success(BarberShopModel.fromMap(data));
    }
  }
}
