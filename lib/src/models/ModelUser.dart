class ModelUser {
  final String _token;

  ModelUser.notSignedIn(): _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiJBbGVzc2FuZHJvLm1vcmFsZXNAZ2FsaWxlby5lZHUiLCJpYXQiOjE2OTY5NDczNzF9.gkdti8fB3Isw2oTrj0lJoU70Mn1-Tj73eqSLasO5lHQ'; // named constructor
  ModelUser(this._token);

  String get token => _token;

  bool isLoggedIn () => _token.isNotEmpty;

  @override
  String toString () => '(USER)[\n  token: $_token\n]';
}
