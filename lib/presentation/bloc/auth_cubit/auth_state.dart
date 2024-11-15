part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}


class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
 final domainUser.User user;

 AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
 final String error;

 AuthFailure(this.error);
}
