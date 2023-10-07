import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app/src/models/ModelUser.dart';

class CubitUser extends Cubit<ModelUser> {
  CubitUser(ModelUser state): super(state);

  static final ModelUser unauthenticatedUser = ModelUser('');

  void signIn (ModelUser state) => emit(state);
  void signOut () => emit(unauthenticatedUser);

  String getToken () => state.token;
  bool isAuth () => state != unauthenticatedUser;
}
