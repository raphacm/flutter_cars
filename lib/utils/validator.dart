String validateLoginField(String text) {
  if (text.isEmpty) {
    return "This field can't be null";
  }
  return null;
}

String validatePasswordField(String text) {
  if (text.trim().isEmpty) {
    return "This field can't be null";
  }

  if (text.length < 4) {
    return "Password must be greater than 3";
  }
  return null;
}
