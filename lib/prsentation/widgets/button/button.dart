import 'package:flutter/material.dart';

Widget button(String title) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(20))),
    height: 40,
    width: 85,
    child: Center(child: Text(title,style: const TextStyle(fontWeight: FontWeight.w600),)),
  );
}
