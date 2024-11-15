import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/firebase_auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<User> signIn(String email, String password) {
    return _authDataSource.signIn(email, password);
  }

  @override
  Future<User> signUp(String email, String password) {
    return _authDataSource.signUp(email, password);
  }
}