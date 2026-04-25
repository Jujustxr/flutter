// lib/bloc/auth/auth_event.dart

part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginSubmitted extends AuthEvent {
  final String username;
  final String password;
  final bool rememberMe;

  LoginSubmitted({
    required this.username,
    required this.password,
    this.rememberMe = false,
  });
}

class RegisterSubmitted extends AuthEvent {
  final String fullName;
  final String username;
  final String password;

  RegisterSubmitted({
    required this.fullName,
    required this.username,
    required this.password,
  });
}

class AuthReset extends AuthEvent {}