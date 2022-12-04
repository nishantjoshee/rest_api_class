import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_class/data/api_service.dart';
import 'package:rest_api_class/data/user_model.dart';

final userListProvider = FutureProvider<List<UserModel>>(
  (ref) async {
    return ApiService().getData();
  },
);
