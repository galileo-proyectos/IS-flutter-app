class ModelUser {
  final String token;

  ModelUser(this.token);

  @override
  String toString () {
    return '(USER)[\n  token: ${token}\n]';
  }
}
