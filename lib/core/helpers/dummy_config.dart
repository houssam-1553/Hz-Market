class DummyConfig {
  // This class store dummy data and methods that will be used during the dev phase

  static Future future(
      {int ms = 1000, bool hasException = false, String? errorMessage}) async {
    if (hasException) {
      await Future.delayed(const Duration(milliseconds: 500 * 3));
      throw Exception(errorMessage);
    }
    return Future.delayed(Duration(milliseconds: ms));
  }
}
