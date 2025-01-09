import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';

abstract class UsersRemoteDatasource {
  Future<List<UserEntity>> fetchAllUsers();
}
class UsersRemoteDatasourceImpl implements UsersRemoteDatasource {
  @override
  Future<List<UserEntity>> fetchAllUsers() {
    throw UnimplementedError();
  }
  
}
