
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void topSnackBar(BuildContext ctx,String msg){
showTopSnackBar(
ctx,
Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8)
  ),
  elevation: 0,
  color: Theme.of(ctx).primaryColor,
  child: Container(
    padding: const EdgeInsets.all(16),
    child: Text(
      msg,
      style: const TextStyle(color: Colors.white),
    ),
  ),
),
displayDuration: const Duration(milliseconds: 2000),
showOutAnimationDuration:const Duration(milliseconds: 600),
);
}