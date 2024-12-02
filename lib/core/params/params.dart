// ignore_for_file: public_member_api_docs, sort_constructors_first
class TemplateParams {
  final String id;
  TemplateParams({required this.id});
}

class SignUpParams {
  final String name;
  final String password;
  final String passwordConfirmation;
  final String numberPhone;
  final String type;
  SignUpParams({
    required this.name,
    required this.password,
    required this.passwordConfirmation,
    required this.numberPhone,
    required this.type,
  });
}
