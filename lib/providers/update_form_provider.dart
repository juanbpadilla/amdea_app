import 'package:flutter/material.dart';

class UpdateFormProvider extends ChangeNotifier {
  
  GlobalKey<FormState> formKey = GlobalKey();

  String id = '';
  String old_password = '';
  String password = '';
  String passwordConfirmation = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _obscureText = true;
  bool get obscureText => _obscureText;
  
  void toggleVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  set obscureText( bool value ) {
    _obscureText = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$id - $old_password - $password - $passwordConfirmation');

    return formKey.currentState?.validate() ?? false;
  }

}