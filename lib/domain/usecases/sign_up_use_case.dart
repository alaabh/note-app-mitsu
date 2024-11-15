import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  Future<User> execute(String email, String password) {
    return _authRepository.signUp(email, password);
  }
}