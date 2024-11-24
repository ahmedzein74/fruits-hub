import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

// UserModel class extends UserEntity and inherits its properties (name, email, uId).
class UserModel extends UserEntity {
  // Constructor that initializes the UserModel with inherited properties.
  UserModel({required super.name, required super.email, required super.uId});

  // Factory constructor to create a UserModel instance from a Firebase User object.
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ??
          '', // Use Firebase's displayName or an empty string if null.
      email:
          user.email ?? '', // Use Firebase's email or an empty string if null.
      uId: user.uid, // Firebase's unique user ID.
    );
  }

  // Factory constructor to create a UserModel instance from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'], // Extract 'name' field from the JSON.
      email: json['email'], // Extract 'email' field from the JSON.
      uId: json['uId'], // Extract 'uId' field from the JSON.
    );
  }
}
