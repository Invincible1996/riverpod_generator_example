import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user/user_model.dart';
import 'provider/user_repository_provider.dart';

part 'user_controller.g.dart';

@Riverpod(keepAlive: true)
class UserController extends _$UserController {
  @override
  FutureOr<UserModel?> build() async {
    return null;
  }

  Future<void> getUserInfo() async {
    state = const AsyncValue.loading();
    try {
      final userService = ref.read(userRepositoryProvider);
      final userInfo = await userService.getCurrentUser();
      state = AsyncValue.data(userInfo);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
