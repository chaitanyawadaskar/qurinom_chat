import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user.dart';
import '../../repositories/auth_repository.dart';

// Events
abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email, password, role;
  LoginRequested(this.email, this.password, this.role);
}

class LogoutRequested extends AuthEvent {}

// States
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserModel user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginRequested>(_login);
    on<LogoutRequested>((_, emit) => emit(Unauthenticated()));
  }

  Future<void> _login(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.login(
        event.email,
        event.password,
        event.role,
      );
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
