import 'package:amdea_app/models/user.dart';
import 'package:amdea_app/sercices/auth_service.dart';
import 'package:flutter/material.dart';

// import '../models/models.dart';

// import '../services/services.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey();

  User? _user;

  String name = '';
  String number = '';
  String username = '';
  String email = '';
  String password = '';
  String passwordConfirmation = '';

  User? get user => _user;
  final AuthService _apiService = AuthService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {

    return formKey.currentState?.validate() ?? false;
  }

  Future<void> fetchUserDetails() async {
    _user = await _apiService.show();
    print(_user);
  }

  

}