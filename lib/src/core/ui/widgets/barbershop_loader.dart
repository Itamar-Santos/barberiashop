import 'package:dw11/src/core/ui/widgets/constantes.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BarbershopLoader extends StatelessWidget {

  const BarbershopLoader({ super.key });

   @override
   Widget build(BuildContext context) {
       return Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: ColorsConstants.brown, 
          size: 60),
       );
  }
}