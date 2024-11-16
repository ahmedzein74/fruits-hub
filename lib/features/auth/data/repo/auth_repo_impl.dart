import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('Exception in authRepoImpl createUserWithEmailAndPassword:  ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in authRepoImpl createUserWithEmailAndPassword:  ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما ، يرجى المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('Exception in authRepoImpl signInWithEmailAndPassword:  ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in authRepoImpl signInWithEmailAndPassword:  ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما ، يرجى المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in authRepoImpl signInWithGoogle:  ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما ، يرجى المحاولة في وقت لاحق'));
    }
  }
}
