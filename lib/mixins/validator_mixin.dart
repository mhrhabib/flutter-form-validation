class ValidatorMixin {
  String validateEmail(value) {
    if (!value!.contains('@')) {
      return 'please enter a valid email';
    }
    return 'validate';
  }

  String validatePassword(value) {
    if (value!.length < 4) {
      return 'Password can"t be less than 4';
    }
    return "validate";
  }
}
