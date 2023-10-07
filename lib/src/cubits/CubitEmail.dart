import 'package:flutter_bloc/flutter_bloc.dart';

class CubitEmail extends Cubit<String> {
  CubitEmail() : super('alssdev.com');

  void setEmail (String email) => emit(email);
  String getEmail () => state;
}
