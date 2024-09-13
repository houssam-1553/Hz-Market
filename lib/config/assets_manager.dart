class AssetManager {
  static const String baseIllustrationsPath = 'assets/illustations';
  static const String baseLangPath = 'assets/lang';
  static const String baseAnimationsPath = 'assets/animations';
  static const String baseImagesPath = 'assets/images';

  // illustations
  static final String auth = getFullPath(baseIllustrationsPath, 'auth.svg');
  static final String logo = getFullPath(baseIllustrationsPath, 'logo.svg');
  // languageCode = ar, en or fr
  static String getFlagIcon(String languageCode) =>
      getFullPath(baseIllustrationsPath, '$languageCode.svg');

  // lang
  static final String ar = getFullPath(baseLangPath, 'ar.json');
  static final String en = getFullPath(baseLangPath, 'en.json');

  // animations
  static final String checked = getFullPath(baseAnimationsPath, 'checked.json');

  // images
  static final String profile = getFullPath(baseImagesPath, 'profile.png');

  // get full assets path from name
  static String getFullPath(String basePath, String assetName) =>
      '$basePath/$assetName';
}
