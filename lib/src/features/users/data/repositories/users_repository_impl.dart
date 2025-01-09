import 'package:catalyst_test/src/core/errors/failures.dart';
import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:catalyst_test/src/features/users/domain/repositories/users_repository.dart';
import 'package:dartz/dartz.dart';

class  UsersRepositoryImpl implements UsersRepository {
  @override
  Future<Either<Failure, List<UserEntity>>> fetchAllUsers() {
    // TODO: implement fetchAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> fetchUserDetails({required String uID}) {
    // TODO: implement fetchUserDetails
    throw UnimplementedError();
  }
  
}