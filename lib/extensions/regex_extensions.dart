extension RegexExtensions on String {
  static final RegExp _syrianPhoneNumberRegExp =
      RegExp(r'^09[3-6,8-9][0-9]{7}$');

  bool get isSyrianPhoneNumber => _syrianPhoneNumberRegExp.hasMatch(this);
}
