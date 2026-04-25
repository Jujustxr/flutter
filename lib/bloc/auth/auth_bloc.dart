// lib/bloc/auth/auth_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository(),
        super(AuthInitial()) {
    on<LoginSubmitted>(_onLogin);
    on<RegisterSubmitted>(_onRegister);
    on<AuthReset>((_, emit) => emit(AuthInitial()));
  }

  Future<void> _onLogin(LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.login(
        username: event.username,
        password: event.password,
      );
      emit(AuthSuccess(
        message: 'Selamat datang, ${user.firstName}!',
        data: user,
      ));
    } catch (e) {
      emit(AuthFailure(e.toString().replaceAll('Exception: ', '')));
    }
  }

  Future<void> _onRegister(RegisterSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // DummyJSON tidak punya endpoint register.
      // Kita simulasi dengan login menggunakan credential yang sama.
      // Ganti dengan API register real kamu jika sudah ada.
      final user = await _authRepository.login(
        username: event.username,
        password: event.password,
      );
      emit(AuthSuccess(
        message: 'Akun berhasil dibuat! Selamat datang, ${user.firstName}!',
        data: user,
      ));
    } catch (e) {
      emit(AuthFailure(e.toString().replaceAll('Exception: ', '')));
    }
  }
}