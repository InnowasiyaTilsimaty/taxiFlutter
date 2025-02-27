class Validator {
  static String? emptyField(String? value) {
    if (value == null) {
      return null;
    }
    final trimmedValue = value.trim();
    if (trimmedValue.isEmpty) {
      return 'Boş bolup bilmez!';
    }
    return null;
  }
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) return 'Telefon belginizi girizin!';

  final trimmedValue = value.trim();

  if (trimmedValue.length < 8) {
    return 'Nadogry telefon belli!';
  }

  if (value.length >= 2) {
    const allowedPhonePrefixes = ['60', '61', '62', '63', '64', '65', '71'];
    if (allowedPhonePrefixes.contains(value.substring(0, 2))) {
      return null;
    }
    return 'Nadogry telefon belli!';
  }
  return null;
}
