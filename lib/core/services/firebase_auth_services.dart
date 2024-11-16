import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in firebase auth: ${e.toString()} and e.code= ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الالكتروني مستخدم بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomException(message: 'حدث خطأ . يرجى المحاولة مرة أخرى');
      }
    } catch (e) {
      throw CustomException(message: 'حدث خطأ . يرجى المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in firebase auth: ${e.toString()} and e.code= ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'البريد الالكتروني او الرقم السري غير صحيح');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'البريد الالكتروني او الرقم السري غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');

      }
      else if (e.code == 'invalid-credential') {
                throw CustomException(message: 'البريد الالكتروني او الرقم السري غير صحيح');

      }
       else {
        throw CustomException(message: 'حدث خطأ . يرجى المحاولة مرة أخرى');
      }
    } catch (e) {
      throw CustomException(message: 'حدث خطأ . يرجى المحاولة مرة أخرى');
    }
  }
}
