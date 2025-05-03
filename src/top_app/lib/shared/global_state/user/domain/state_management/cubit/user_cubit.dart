import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/shared/entities/templates/goal.dart';
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

  /// Get the goals of the current user
  List<Goal> getUserGoals() {
    if (state is Authenticated) {
      return (state as Authenticated).user.goals;
    }
    return <Goal>[];
  }

  /// Initialize the user cubit
  Future<UserEntity?> getUser() async {
    if (state is Authenticated && user != null) {
      _fetchUser();
      return user;
    }
    await _fetchUser();
    return user;
  }

  Future<void> _fetchUser() async {
    try {
      final String? uid = firebaseProvider.firebaseAuth.currentUser?.uid;
      if (uid == null) {
        await signOut();
        emit(UserState.unauthenticated());
        return;
      }
      user = await userRepository.getUserDocument(uid);
      if (user == null) {
        await signOut();
        emit(UserState.unauthenticated());
        return;
      }

      emit(UserState.authenticated(user!));
    } catch (e) {
      await signOut();
      emit(UserState.unauthenticated());
    }
  }

  /// Push the user changes to the database
  Future<void> updateUser(UserEntity user) async {
    this.user = user;
    await userRepository.updateUserDocument(user);
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
