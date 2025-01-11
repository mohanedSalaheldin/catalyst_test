import 'package:catalyst_test/src/features/users/domain/repositories/users_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

class DeleteUserUsecase {
  final UsersRepository repository;

  DeleteUserUsecase({required this.repository});
  Future<Either<Failure, String>> call({required uID}) {
    return repository.deleteUser(uID: uID);
  }
}
