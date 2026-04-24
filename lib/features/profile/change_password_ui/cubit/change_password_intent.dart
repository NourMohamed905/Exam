abstract class ChangePasswordIntent {}

class OldPasswordChanged extends ChangePasswordIntent {
  final String value;
  OldPasswordChanged(this.value);
}

class NewPasswordChanged extends ChangePasswordIntent {
  final String value;
  NewPasswordChanged(this.value);
}

class ConfirmPasswordChanged extends ChangePasswordIntent {
  final String value;
  ConfirmPasswordChanged(this.value);
}

class ChangePasswordPressed extends ChangePasswordIntent {
  ChangePasswordPressed();
}