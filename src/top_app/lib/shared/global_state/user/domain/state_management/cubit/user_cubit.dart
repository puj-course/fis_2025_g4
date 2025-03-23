import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';

import '../../repository/user_repository.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

@LazySingleton()
class UserCubit extends Cubit<UserState> {
  UserCubit(this.firebaseProvider, this.userRepository) : super(UserState.initial());

  final FirebaseProvider firebaseProvider;
  final UserRepository userRepository;

  /// User with active session
  UserEntity? user;

  /// Initialize the user cubit
  Future<UserEntity?> fetchUser() async {
    final uid = firebaseProvider.firebaseAuth.currentUser?.uid;
    if (uid == null) {
      emit(UserState.unauthenticated());
      return null;
    }
    user = await userRepository.getUserDocument(uid);
    emit(UserState.authenticated(user!));
    return user;
  }

  /// Sign out the user
  Future<void> signOut() async {
    await firebaseProvider.firebaseAuth.signOut();
    emit(UserState.unauthenticated());
  }

  /// Create a user
  Future<void> createUser(UserEntity user) async {
    await userRepository.createUserDocument(user);
  }

  /// Get the rank of a user based on their sign up time
  Future<int> getUserSignUpRank(int signUpSeconds) async {
    return await userRepository.getUserSignUpRank(signUpSeconds);
  }
}
