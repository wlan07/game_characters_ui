import 'package:flutter/material.dart';

class MyCloseButton extends StatelessWidget {
  const MyCloseButton({Key? key,required this.onTap}) : super(key: key);


final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return CloseButton(
      color: Colors.white,
      onPressed: (){
        onTap();
        Navigator.of(context).pop();
      },
    );
  }







}
