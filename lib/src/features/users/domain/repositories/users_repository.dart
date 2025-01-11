import 'package:catalyst_test/src/core/errors/failures.dart';
import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<UserEntity>>> fetchAllUsers();
  Future<Either<Failure, UserEntity>> fetchUserDetails({required String uID});
  Future<Either<Failure, Unit>> editUserDetails(
      {required UserEntity user});
  Future<Either<Failure, String>> deleteUser({required String uID});
}
