class ApiSettings {
  static const String _baseUri = 'http://demo-api.mr-dev.tech';
  static const String baseApiUri = _baseUri + '/api/';
  static const String indexUser = baseApiUri + 'users';
  static const String category = baseApiUri + 'categories';
  static const String login = baseApiUri + 'students/auth/login';
  static const String register= baseApiUri + '/students/auth/register';
  static const String forget= baseApiUri + 'students/auth/forget-password';
  static const String rest= baseApiUri + 'students/auth/reset-password';
  static const String logout= baseApiUri + 'students/auth/reset-password';

}
