import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app/src/models/ModelUser.dart';

class CubitUser extends Cubit<ModelUser> {
  CubitUser(ModelUser state): super(state);

  static final ModelUser unauthenticatedUser = ModelUser('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiJBbGVzc2FuZHJvLm1vcmFsZXNAZ2FsaWxlby5lZHUiLCJpYXQiOjE2OTY3MjEwMDd9.EV_XWz8wypCdPRfAD97e4oi8fQrPfIVlcSvHWqMD4C8');

  void signIn (ModelUser state) => emit(state);
  void signOut () => emit(unauthenticatedUser);

  String getToken () => state.token;
  bool isAuth () => state != unauthenticatedUser;
}
