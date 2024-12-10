// Import necessary packages for handling errors, user data, and functional programming.
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

// Defines a contract (interface) for authentication-related actions.
abstract class AuthRepo {
  // Creates a new user with email, password, and name.
  // Returns either an error (Failure) or the user info (UserEntity).
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  // Logs in a user with email and password.
  // Returns either an error (Failure) or the user info (UserEntity).
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  // Logs in a user with their Google account.
  // Returns either an error (Failure) or the user info (UserEntity).
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  // Logs in a user with their Facebook account.
  // Returns either an error (Failure) or the user info (UserEntity).
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  // Saves user data to the database.
  Future addUserData({required UserEntity user});

  Future saveUserData({required UserEntity user});

  // Gets user data by user ID.
  Future<UserEntity> getUserData({required String uId});
}
