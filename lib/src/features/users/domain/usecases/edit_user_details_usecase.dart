import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:catalyst_test/src/features/users/domain/repositories/users_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

class EditUserDetailsUsecase {
  final UsersRepository repository;

  EditUserDetailsUsecase({required this.repository});
  Future<Either<Failure, UserEntity>> call({required uID}) {
    return repository.editUserDetails(uID: uID);
  }
}
