import 'package:injectable/injectable.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';

import '../../data/data_provider/sign_in_data_provider.dart';
import '../../domain/repository/sign_in_repository.dart';

@Injectable(as: SignInRepository)
class SignInRepositoryImpl implements SignInRepository {
  final SignInDataProvider _signInDataProvider;
  final UserPublicApi _userPublicApi;

  SignInRepositoryImpl(this._signInDataProvider, this._userPublicApi);

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _signInDataProvider.signIn(email, password);

      await _userPublicApi.getUser();
    } catch (e) {
      rethrow;
    }
  }
}
