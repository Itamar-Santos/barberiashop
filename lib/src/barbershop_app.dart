import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:dw11/src/auth/login/login_page.dart';
import 'package:dw11/src/auth/login/register/user_register_page.dart';
import 'package:dw11/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dw11/src/core/ui/widgets/barbershop_nav_global_key.dart';
import 'package:dw11/src/core/ui/widgets/barbershop_theme.dart';
import 'package:dw11/src/features/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {

  const BarbershopApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return AsyncStateBuilder(
        customLoader: const BarbershopLoader(),
        builder: (asyncNavigatorObserver){
        return MaterialApp(
        navigatorObservers: [asyncNavigatorObserver],
        navigatorKey: BarbershopNavGlobalKey.instance.navKey,
        title: "DW Barbershop",
        theme: BarbershopTheme.themeData,
        routes: {
          '/':(_) => const SplashPage(), 
          '/auth/login': (_) => const LoginPage(),
          '/auth/register/user': (_) => const UserRegisterPage(),
          '/auth/register/barbershop': (_) => const Center(child: Text('ADM')),
          '/home/adm':(_) =>  const Text('ADM'),
          '/home/employee':(_) =>  const Text('Employee'),  
        
        },
       );
       }, 
       );
  }
}
