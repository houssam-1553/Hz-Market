class Validator {
  static final RegExp algerianPhoneNumberRegExp = RegExp(r'^(05|06|07)\d{8}$');
  static final RegExp otpRegExp = RegExp(r'^\d{8}$');

  static String? fullnameValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'error';
      }
    }
    return null;
  }

  static String? brandValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'error';
      }
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'error';
      }
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value != null) {
      value = value.replaceAll(RegExp(r' '), '');
      if (algerianPhoneNumberRegExp.hasMatch(value)) {
        return null;
      }
    }
    return 'error';
  }

  static String? passwordValidator(String? value) {
    if (value != null) {
      if (value.isNotEmpty) {
        return null;
      }
    }
    return 'error';
  }

  static String? emailValidator(String? value) {
    if (value != null) {
      if (otpRegExp.hasMatch(value)) {
        return null;
      }
    }
    return 'error';
  }

  static String? otpValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'error';
      }
    }
    return null;
  }

  static String? adresseValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'error';
      }
    }
    return null;
  }

  static String? notNullValidator(String? value) {
    if (value == null) {
      return 'error';
    }
    return null;
  }
}
