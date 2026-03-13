class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    } else if (!emailRegex.hasMatch(val)) {
      return 'This Email is not valid';
    }
    return null;
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])');

    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'Must be 8+ chars, 1 uppercase & 1 number';
    }
    return null;
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (val != password) {
      return 'Password not matched';
    }
    return null;
  }

  static String? validateUsername(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (val.length < 3) {
      return 'This user name is not valid';
    }
    return null;
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    } else if (int.tryParse(val.trim()) == null) {
      return 'Enter numbers only';
    } else if (val.trim().length != 11) {
      return 'Enter value must equal 11 digit';
    }
    return null;
  }
}
