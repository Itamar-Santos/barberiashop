import 'package:asyncstate/asyncstate.dart';
import 'package:dw11/src/auth/login/login_state.dart';
import 'package:dw11/src/core/exceptions/service_exception.dart';
import 'package:dw11/src/core/fp/either.dart';
import 'package:dw11/src/core/providers/application_providers.dart';
import 'package:dw11/src/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {
    
    final loaderHandle = AsyncLoaderHandler()..start();
    
    final loginService = ref.watch(usersLoginServiceProvider);
    
    final result = await loginService.execute(email, password);
    switch (result) {
      case Success():
// buscar dados  do usuário logado
//fazer uma análise para qual tipo de login
//! Inválidando caches de login
        ref.invalidate(getMeProvider);
        ref.invalidate(getMyBarberShopProvider);

        final userModel = await ref.read(getMeProvider.future);
        
        switch (userModel) {
          case UserModelADM():
            state = state.copyWith(status: LoginStateStatus.admLogin);
          case UserModelEmployee():
            state = state.copyWith(status: LoginStateStatus.employeeLogin);
        }
        break;

      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: () => message,
        );
    }
    loaderHandle.close();
  }
}
