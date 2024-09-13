// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signup {
    return Intl.message(
      'Signup',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Update your info here:`
  String get update {
    return Intl.message(
      'Update your info here:',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password should include \n(min 8 chars, lowercase, uppercase, and digits)`
  String get passwordErrorMessage {
    return Intl.message(
      'Password should include \n(min 8 chars, lowercase, uppercase, and digits)',
      name: 'passwordErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Edit photo`
  String get editPhoto {
    return Intl.message(
      'Edit photo',
      name: 'editPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Select Image`
  String get selectImage {
    return Intl.message(
      'Select Image',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Return`
  String get ret {
    return Intl.message(
      'Return',
      name: 'ret',
      desc: '',
      args: [],
    );
  }

  /// `Type OTP code we sent :`
  String get OTP {
    return Intl.message(
      'Type OTP code we sent :',
      name: 'OTP',
      desc: '',
      args: [],
    );
  }

  /// `Field cannot be empty`
  String get empty {
    return Intl.message(
      'Field cannot be empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Password should include : \n(min 8 chars,  lower and upper case, digits)`
  String get passworderror {
    return Intl.message(
      'Password should include : \n(min 8 chars,  lower and upper case, digits)',
      name: 'passworderror',
      desc: '',
      args: [],
    );
  }

  /// `Please check your credentials and try again.`
  String get credentilasCheck {
    return Intl.message(
      'Please check your credentials and try again.',
      name: 'credentilasCheck',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all the fields and try again.`
  String get emptyFields {
    return Intl.message(
      'Please fill all the fields and try again.',
      name: 'emptyFields',
      desc: '',
      args: [],
    );
  }

  /// `You are suspended contact your supervisor.`
  String get suspendedAccount {
    return Intl.message(
      'You are suspended contact your supervisor.',
      name: 'suspendedAccount',
      desc: '',
      args: [],
    );
  }

  /// `Check your connection and Try Again`
  String get checkConnection {
    return Intl.message(
      'Check your connection and Try Again',
      name: 'checkConnection',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Login with phone`
  String get loginWithPhone {
    return Intl.message(
      'Login with phone',
      name: 'loginWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Wrong credentials`
  String get wrongC {
    return Intl.message(
      'Wrong credentials',
      name: 'wrongC',
      desc: '',
      args: [],
    );
  }

  /// `Suspended account`
  String get wrongS {
    return Intl.message(
      'Suspended account',
      name: 'wrongS',
      desc: '',
      args: [],
    );
  }

  /// `Empty field(s)`
  String get wrongE {
    return Intl.message(
      'Empty field(s)',
      name: 'wrongE',
      desc: '',
      args: [],
    );
  }

  /// `Connection problem`
  String get wrongCo {
    return Intl.message(
      'Connection problem',
      name: 'wrongCo',
      desc: '',
      args: [],
    );
  }

  /// `we just sent you an otp type it to continue \nwe remind you to use it in less then 5min`
  String get otpsentM {
    return Intl.message(
      'we just sent you an otp type it to continue \nwe remind you to use it in less then 5min',
      name: 'otpsentM',
      desc: '',
      args: [],
    );
  }

  /// `OTP Sent!`
  String get otpsent {
    return Intl.message(
      'OTP Sent!',
      name: 'otpsent',
      desc: '',
      args: [],
    );
  }

  /// `Account existed`
  String get Already {
    return Intl.message(
      'Account existed',
      name: 'Already',
      desc: '',
      args: [],
    );
  }

  /// `this account already existed`
  String get AlreadyM {
    return Intl.message(
      'this account already existed',
      name: 'AlreadyM',
      desc: '',
      args: [],
    );
  }

  /// `Account doesn't exists`
  String get exist {
    return Intl.message(
      'Account doesn\'t exists',
      name: 'exist',
      desc: '',
      args: [],
    );
  }

  /// `this account didnt existe try to sign up or contact your supervisor`
  String get existM {
    return Intl.message(
      'this account didnt existe try to sign up or contact your supervisor',
      name: 'existM',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP`
  String get invalid {
    return Intl.message(
      'Invalid OTP',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `the code you tapped is wrong try again`
  String get invalidM {
    return Intl.message(
      'the code you tapped is wrong try again',
      name: 'invalidM',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get otpex {
    return Intl.message(
      '',
      name: 'otpex',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get otpexM {
    return Intl.message(
      '',
      name: 'otpexM',
      desc: '',
      args: [],
    );
  }

  /// `Brand Name`
  String get Brand {
    return Intl.message(
      'Brand Name',
      name: 'Brand',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get Name {
    return Intl.message(
      'Full Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get fr {
    return Intl.message(
      'French',
      name: 'fr',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
