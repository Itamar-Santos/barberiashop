// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$restClientHash() => r'0ee58f1fd102b2016ed621885f1e8d52ed00da66';

/// See also [restClient].
@ProviderFor(restClient)
final restClientProvider = Provider<RestClient>.internal(
  restClient,
  name: r'restClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$restClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RestClientRef = ProviderRef<RestClient>;
String _$userRepositoryHash() => r'4a324f69804b6738f220b7c48b19aad627021894';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = Provider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = ProviderRef<UserRepository>;
String _$usersLoginServiceHash() => r'6c73960450cc5d774cb0cc2af457e80dd022153d';

/// See also [usersLoginService].
@ProviderFor(usersLoginService)
final usersLoginServiceProvider = Provider<UsersLoginService>.internal(
  usersLoginService,
  name: r'usersLoginServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usersLoginServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UsersLoginServiceRef = ProviderRef<UsersLoginService>;
String _$getMeHash() => r'835de91f459d1216fe7813de1ce4ffa8c28975d4';

/// See also [getMe].
@ProviderFor(getMe)
final getMeProvider = FutureProvider<UserModel>.internal(
  getMe,
  name: r'getMeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getMeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMeRef = FutureProviderRef<UserModel>;
String _$barberShopRepositoryHash() =>
    r'380c2980f3789a11b5931521f7524d801181a04d';

/// See also [barberShopRepository].
@ProviderFor(barberShopRepository)
final barberShopRepositoryProvider = Provider<BarbershopRepository>.internal(
  barberShopRepository,
  name: r'barberShopRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$barberShopRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BarberShopRepositoryRef = ProviderRef<BarbershopRepository>;
String _$getMyBarberShopHash() => r'd2db04a9a6f365b3906a8945790180c8d9aeebf0';

/// See also [getMyBarberShop].
@ProviderFor(getMyBarberShop)
final getMyBarberShopProvider = FutureProvider<BarberShopModel>.internal(
  getMyBarberShop,
  name: r'getMyBarberShopProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMyBarberShopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMyBarberShopRef = FutureProviderRef<BarberShopModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
