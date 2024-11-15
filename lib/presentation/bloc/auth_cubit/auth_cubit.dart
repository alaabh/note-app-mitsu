import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../../domain/entities/user.dart' as domainUser;
import '../../../domain/usecases/sign_in_use_case.dart';
import '../../../domain/usecases/sign_up_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
 final SignInUseCase _signInUseCase;
 final SignUpUseCase _signUpUseCase;

 AuthCubit(this._signInUseCase, this._signUpUseCase) : super(AuthInitial());

 Future<void> signIn(String email, String password) async {
   emit(AuthLoading());
   try {
     final user = await _signInUseCase.execute(email, password);
     emit(AuthSuccess(user));
   } catch (e) {
     emit(AuthFailure(e.toString()));
   }
 }

 Future<void> signUp(String email, String password) async {
   emit(AuthLoading());
   try {
     final user = await _signUpUseCase.execute(email, password);
     emit(AuthSuccess(user));
   } catch (e) {
     emit(AuthFailure(e.toString()));
   }
 }
}
