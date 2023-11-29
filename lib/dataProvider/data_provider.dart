import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_with_api/models/models.dart';

import '../services/service.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});