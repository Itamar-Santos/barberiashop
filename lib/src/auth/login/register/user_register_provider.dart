import 'package:dw11/src/auth/login/user_register/user_register_adm_services.dart';
import 'package:dw11/src/auth/login/user_register/user_register_adm_services_impl.dart';
import 'package:dw11/src/core/providers/application_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_register_provider.g.dart';


@Riverpod(keepAlive: true )
UserRegisterAdmServices userRegisterAdmServices(UserRegisterAdmServicesRef ref) =>
UserRegisterAdmServicesImpl(userRepository: ref.watch(userRepositoryProvider), 
userLoginService: ref.watch(usersLoginServiceProvider));