import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<User> execute(String email, String password) {
    return _authRepository.signIn(email, password);
  }
}