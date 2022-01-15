class ValidatorMixin {
  String? validateEmail(value) {
    if (!value.contains('@com')) {
      return 'please enter a valid email';
    }
  }

  String? validatePassword(value) {
    if (value!.length < 4) {
      return 'Password can"t be less than 4';
    }
  }
}
