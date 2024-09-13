class Endpoints {
  // a class that store api endpoints
  static const String ip = '127.0.0.1';
  static const String port = '3000';
  // static const String ip = '192.168.86.88';
  // static const String port = '4000';

  static final String getCurrentUser =
      getEndpoint('market/account/current/get');
  static final String loginWithPassword = getEndpoint('account/login/password');
  static final String sendLoginOtp = getEndpoint('account/login/otp/send');
  static final String validateLoginOtp =
      getEndpoint('account/login/otp/verify');
  static final String updatePassword =
      getEndpoint('market/update/account/password');
  static final String createMarket = getEndpoint('market/create');

  static String getEndpoint(String endpoint) => '$host/$endpoint';

  static const String host = 'https://$ip';
  // static const String websocketHost = 'ws://$ip:$port';
}
