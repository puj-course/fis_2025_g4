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
  Future<void> fetchUser() async {
    final uid = firebaseProvider.firebaseAuth.currentUser?.uid;
    if (uid == null) {
      emit(UserState.unauthenticated());
      return;
    }
    user = await userRepository.getUserDocument(uid);
    emit(UserState.authenticated(user!));
  }

  /// Sign out the user
  Future<void> signOut() async {
    await firebaseProvider.firebaseAuth.signOut();
    emit(UserState.unauthenticated());
  }
}
