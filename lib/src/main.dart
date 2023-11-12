import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:multi_screen_app/src/ui/mainWidget.dart';

void main() {
  Stripe.publishableKey = 'pk_test_51OADyLF0SvbXIeECkjwFMh1yBuvXtVkWyGVHCeOrbdbLLtJjWV8RTU7z22Dab0q1AhGZkcjcLfY6S12GnEqdBmCO000ovKPWMH';
  runApp(const MyApp());
}