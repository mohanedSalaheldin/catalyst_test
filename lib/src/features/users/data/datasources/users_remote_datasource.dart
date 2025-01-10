import 'package:catalyst_test/src/core/utils/consts/constatnts.dart';
import 'package:catalyst_test/src/features/users/data/models/user_model.dart';
import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';

abstract class UsersRemoteDatasource {
  Future<List<UserEntity>> fetchAllUsers();
  Future<UserEntity> fetchUserDetails({required uID});
}

class UsersRemoteDatasourceImpl implements UsersRemoteDatasource {
  final Dio _dio = Dio();

  @override
  Future<List<UserEntity>> fetchAllUsers() async {
    try {
      Response response = await _dio.get(ApiEndPoints.users);

      List<dynamic> data = response.data;

      final List<UserModel> users = data
          .map<UserModel>((userJson) {
            try {
              return UserModel.fromJson(userJson);
            } catch (e) {
              print('Error parsing user: $e');
              return UserModel(
                id: -1,
                name: 'name',
                email: 'email',
                phone: 'phone',
                role: 'role',
                profileImage: 'profileImage',
                introVideo: 'introVideo',
                createdAt: 'createdAt',
                updatedAt: 'updatedAt,',
              );
            }
          })
          .where((user) => user.id != -1)
          .toList();

      return users;
    } catch (e) {
      print(e.toString());
      throw ();
    }
  }

  @override
  Future<UserEntity> fetchUserDetails({required uID}) async {
    try {
      Response response = await _dio.get(ApiEndPoints.users + uID);
      dynamic data = response.data;
      print(data);
      UserModel model = UserModel.fromJson(response.data);
      return model;
    } catch (e) {
      print(e.toString());
      throw ();
    }
  }
}
