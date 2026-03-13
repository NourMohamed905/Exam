abstract class SignupIntent {}

class SignupPressed extends SignupIntent {}

class UserNameChanged extends SignupIntent {
  final String username;
  UserNameChanged(this.username);
}

class FirstNameChanged extends SignupIntent {
  final String firstName;
  FirstNameChanged(this.firstName);
}

class LastNameChanged extends SignupIntent {
  final String lastName;
  LastNameChanged(this.lastName);
}

class EmailChanged extends SignupIntent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends SignupIntent {
  final String password;
  PasswordChanged(this.password);
}

class ConfirmPasswordChanged extends SignupIntent {
  final String confirmPassword;
  ConfirmPasswordChanged(this.confirmPassword);
}

class PhoneChanged extends SignupIntent {
  final String phone;
  PhoneChanged(this.phone);
}
