import 'dart:convert';

import 'package:fruits_hub/constant.dart';
import 'package:fruits_hub/core/services/shared_preferences.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonString = SharedPreferencesService.getData(key: kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
