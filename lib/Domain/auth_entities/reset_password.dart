class ResetPassword {
  final String Email;
  final String ResetCode;
  final String NewPassword;

  ResetPassword(
      {required this.Email,
      required this.ResetCode,
      required this.NewPassword});

  // name errors fix that later

  Map<String, dynamic> toJson() {
    return {"Email": Email, "ResetCode": ResetCode, "NewPassword": NewPassword};
  }
}
