import 'package:flutter/material.dart';

extension WidgetExtension on Widget{


  Widget scaleDown({Alignment alignment=Alignment.center,BoxFit fit=BoxFit.scaleDown}){
    return FittedBox(
      child: this,
      alignment: alignment,
      fit: fit,
    );

  }



}