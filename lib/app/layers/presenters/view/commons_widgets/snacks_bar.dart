import 'package:flutter/material.dart';

SnackBar snackBar(text) => SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red[800],
    );
