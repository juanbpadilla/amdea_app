import 'package:amdea_app/models/user.dart';
import 'package:amdea_app/sercices/auth_service.dart';
import 'package:flutter/material.dart';

// import '../models/models.dart';

// import '../services/services.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey();

  User? _user;
  String? _role;

  String name = '';
  String number = '';
  String username = '';
  String email = '';
  String password = '';
  String passwordConfirmation = '';

  String? get role => _role;

  User? get user => _user;
  final AuthService _apiService = AuthService();

  bool _isLoading = false;
  bool _isSaving = false;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;

  LoginFormProvider() {
    print('Login Form Provider Inicializado');

    fetchUserDetails();
  }
  
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }
  
  set isSaving( bool value ) {
    _isSaving = value;
    notifyListeners();
  }
  
  set user( User? value ) {
    _user = value;
  }

  bool isValidForm() {

    return formKey.currentState?.validate() ?? false;
  }

  Future<void> fetchUserDetails() async {
    _user = await _apiService.show();
    String? id = _user?.id.toString();
    _role = await _apiService.permissionShow(id!);
    // print(_user?.id.toString());
    // print(_role);
  }

  void saveUserData(User newUser) {
    print(user!.email == '' ? 'no email' : user!.email);
    print(user!.phone == '' ? 'no phone' : user!.phone);
    _user = newUser;
  }
  

}