import 'package:flutter/material.dart';
import 'package:flutter_gymapp/telas/minhas_cores.dart';

InputDecoration getAuthenticationInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: MinhasCores.amareloFit, width: 2)),
  );
}
