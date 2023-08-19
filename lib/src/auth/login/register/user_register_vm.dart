import 'package:asyncstate/asyncstate.dart';
import 'package:dw11/src/auth/login/register/user_register_provider.dart';
import 'package:dw11/src/core/fp/either.dart';
import 'package:dw11/src/core/providers/application_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_register_vm.g.dart';

enum UserRegisterStateStatus {
  initial,
  success,
  error,
}

@riverpod
class UserRegisterVm extends _$UserRegisterVm {




  @override
  UserRegisterStateStatus build() => UserRegisterStateStatus.initial;
  Future<void> register({
    required String name,
    required String password,
    required String email,
  }) async {
final userRegisterAdmServices = ref.watch(userRegisterAdmServicesProvider);

final userData = (
  name: name,
  email:email,
  password: password,
);

final registerResult = await userRegisterAdmServices.execute(userData). asyncLoader();

switch(registerResult){
  case Success():

ref.invalidate(getMeProvider);
  state = UserRegisterStateStatus.success;
   case Failure():
   state = UserRegisterStateStatus.error;
}

  }
}
