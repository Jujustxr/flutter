import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// State awal
class AuthInitial extends AuthState {}

// Lagi loading (nunggu response API)
class AuthLoading extends AuthState {}

// Login/Register berhasil
class AuthSuccess extends AuthState {
  final String message;
  const AuthSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

// Login/Register gagal
class AuthFailure extends AuthState {
  final String error;
  const AuthFailure({required this.error});

  @override
  List<Object> get props => [error];
}