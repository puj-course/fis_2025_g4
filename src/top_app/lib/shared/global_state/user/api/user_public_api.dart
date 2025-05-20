import 'package:injectable/injectable.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

import '../domain/entity/user_entity.dart';

@LazySingleton()
class UserPublicApi {
  final UserCubit userCubit;

  UserPublicApi({required this.userCubit});

  Future<UserEntity?> getUser() async {
    final UserEntity? user = await userCubit.getUser();
    return user;
  }

  Future<void> signOut() async {
    await userCubit.signOut();
  }

  Future<void> createUser(UserEntity user) async {
    await userCubit.createUser(user);
  }

  Future<int> getUserSignUpRank(int signUpSeconds) async {
    return await userCubit.getUserSignUpRank(signUpSeconds);
  }

  Future<void> updateUser(UserEntity user) async {
    await userCubit.updateUser(user);
  }
}
