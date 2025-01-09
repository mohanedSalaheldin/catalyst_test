import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:catalyst_test/src/features/users/domain/repositories/users_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

class FetchAllUsersUsecase {
  final UsersRepository repository;

  FetchAllUsersUsecase({required this.repository});
  Future<Either<Failure, List<UserEntity>>> call() {
    return repository.fetchAllUsers();
  }
}
