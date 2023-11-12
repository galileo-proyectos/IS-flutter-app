class ModelUser {
  final String _token;

  ModelUser.notSignedIn(): _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJhbGVzc2FuZHJvLm1vcmFsZXNAZ2FsaWxlby5lZHUiLCJzdHJpcGVVc2VySWQiOiJjdXNfT3pIcEJORUJCVmM4eHgiLCJpYXQiOjE2OTk3NTAxNDh9.tBNm7mCnoFeF2766bTYQJHOwcW8MrpyJ3eOKR6Tt-w4'; // named constructor
  ModelUser(this._token);

  String get token => _token;

  bool isLoggedIn () => _token.isNotEmpty;

  @override
  String toString () => '(USER)[\n  token: $_token\n]';
}
