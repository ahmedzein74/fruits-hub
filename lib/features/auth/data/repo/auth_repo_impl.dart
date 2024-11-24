// This class handles all authentication operations (e.g., login, signup, Google or Facebook login).
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/database_services.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  // Service for managing authentication via Firebase.
  final FirebaseAuthServices firebaseAuthServices;

  // Service for handling database operations.
  final DatabaseServices databaseServices;

  // Constructor to initialize the services needed for this repository.
  AuthRepoImpl({
    required this.databaseServices,
    required this.firebaseAuthServices,
  });

  // Function to create a new user with email and password.
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user; // Variable to hold the created user's data.
    try {
      // Create a new user using Firebase Authentication.
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);

      // Convert the user's data to a UserEntity for use in the app.
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);

      // Add the user data to the database.
      await addUserData(user: userEntity);

      // Return the user entity if the creation is successful.
      return right(userEntity);
    } on CustomException catch (e) {
      // If a specific error occurs, delete the created user (rollback).
      await deleteUser(user);

      return left(ServerFailure(e.message));
    } catch (e) {
      // Handle any other generic error.
      await deleteUser(user);
      log('Error in createUserWithEmailAndPassword: ${e.toString()}');
      return left(
        ServerFailure('حدث خطأ . يرجى المحاولة مرة أخرى'),
      );
    }
  }

  // Function to delete a user account if already created.
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser(); // Delete the user from Firebase.
    }
  }

  // Function to sign in with email and password.
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // Sign in using Firebase Authentication.
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);

      // Fetch the user's data from the database.
      var userEntity = await getUserData(uId: user.uid);

      // Return the user data if sign-in is successful.
      return right(userEntity);
    } on CustomException catch (e) {
      // Log specific errors and return them.
      log('Error in signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      // Handle generic errors.
      log('Error in signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(
          'An unexpected error occurred. Please try again later.'));
    }
  }

  // Function to sign in with Google.
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      // Authenticate the user via Google.
      user = await firebaseAuthServices.signInWithGoogle();

      // Convert Firebase user data to a UserEntity.
      var userEntity = UserModel.fromFirebaseUser(user);

      // Check if the user already exists in the database.
      var isUserExists = await databaseServices.checkisUserExist(
          documentId: user.uid, path: BackendEndpoints.checkUserExists);

      if (isUserExists) {
        // If the user exists, fetch their data.
        await getUserData(uId: user.uid);
      } else {
        // If the user doesn't exist, add them to the database.
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      // If an error occurs, delete the user and log the error.
      await deleteUser(user);
      log('Error in signInWithGoogle: ${e.toString()}');
      return left(ServerFailure(
          'An unexpected error occurred. Please try again later.'));
    }
  }

  // Function to sign in with Facebook.
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      // Authenticate the user via Facebook.
      user = await firebaseAuthServices.signInWithFacebook();

      // Convert Firebase user data to a UserEntity.
      var userEntity = UserModel.fromFirebaseUser(user);

      // Check if the user already exists in the database.
      var isUserExists = await databaseServices.checkisUserExist(
          documentId: user.uid, path: BackendEndpoints.checkUserExists);

      if (isUserExists) {
        // If the user exists, fetch their data.
        await getUserData(uId: user.uid);
      } else {
        // If the user doesn't exist, add them to the database.
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      // If an error occurs, delete the user and log the error.
      await deleteUser(user);
      log('Error in signInWithFacebook: ${e.toString()}');
      return left(ServerFailure(
          'An unexpected error occurred. Please try again later.'));
    }
  }

  // Function to add user data to the database.
  @override
  Future addUserData({required UserEntity user}) async {
    await databaseServices.addData(
        documentId: user.uId,
        path: BackendEndpoints.addUserData,
        data: user.toMap());
  }

  // Function to fetch user data from the database using their unique ID.
  @override
  Future<UserEntity> getUserData({required String uId}) async {
    // Retrieve the user data from the database.
    var userData = await databaseServices.getData(
        path: BackendEndpoints.getUserData, documentId: uId);

    // Convert the data to a UserEntity and return it.
    return UserModel.fromJson(userData);
  }
}
