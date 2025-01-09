import 'package:catalyst_test/src/core/errors/failures.dart';
import 'package:catalyst_test/src/core/utils/network/network_info.dart';
import 'package:catalyst_test/src/features/users/data/datasources/users_remote_datasource.dart';
import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:catalyst_test/src/features/users/domain/repositories/users_repository.dart';
import 'package:dartz/dartz.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDatasource datasource;
  final NetworkInfo networkInfo;

  UsersRepositoryImpl({required this.networkInfo, required this.datasource});

  @override
  Future<Either<Failure, List<UserEntity>>> fetchAllUsers() async {
    if (await networkInfo.isConnected) {
      try {
        List<UserEntity> users = await datasource.fetchAllUsers();
        return Right(users);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> fetchUserDetails(
      {required String uID}) async {
    if (await networkInfo.isConnected) {
      try {
        UserEntity users = await datasource.fetchUserDetails(uID: uID);
        return Right(users);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
