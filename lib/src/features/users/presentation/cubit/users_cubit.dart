import 'package:catalyst_test/src/core/errors/failures.dart';
import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:catalyst_test/src/features/users/domain/usecases/delete_user_details_usecase.dart';
import 'package:catalyst_test/src/features/users/domain/usecases/edit_user_details_usecase.dart';
import 'package:catalyst_test/src/features/users/domain/usecases/fetch_all_users_usecase.dart';
import 'package:catalyst_test/src/features/users/domain/usecases/fetch_user_details_usecase.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  final FetchAllUsersUsecase fetchAllUsers;
  final FetchUserDetailsUsecase fetchUserDetailsUsecase;
  final DeleteUserUsecase deleteUserUsecase;
  final EditUserDetailsUsecase editUserDetailsUsecase;

  UsersCubit({
    required this.fetchUserDetailsUsecase,
    required this.deleteUserUsecase,
    required this.fetchAllUsers,
    required this.editUserDetailsUsecase,
  }) : super(UsersInitial());

  static UsersCubit get(context) => BlocProvider.of<UsersCubit>(context);

  List<UserEntity> _users = List.empty();
  List<UserEntity> get users => _users;

  void getAllUsers() async {
    emit(UsersFetchAllLoading());
    Either<Failure, List<UserEntity>> response = await fetchAllUsers.call();
    response.fold(
      (_) {
        emit(UsersFetchAllError());
      },
      (fetchedUsers) {
        _users = fetchedUsers;
        emit(UsersFetchAllSuccess());
      },
    );
  }

  UserEntity _curUserDetails = const UserEntity(
    id: 1,
    name: '',
    email: '',
    phone: '',
    role: '',
    profileImage: '',
    introVideo: '',
    createdAt: '',
    updatedAt: '',
  );
  UserEntity get curUserDetails => _curUserDetails;

  void getUserDetails({required String uID}) async {
    emit(UsersFetchDetailsLoading());
    Either<Failure, UserEntity> response =
        await fetchUserDetailsUsecase.call(uID: uID);
    response.fold(
      (_) {
        emit(UsersFetchDetailsError());
      },
      (user) {
        _curUserDetails = user;
        emit(UsersFetchDetailsSuccess());
      },
    );
  }

  void editUserDetails({required UserEntity user}) async {
    emit(UsersEditDetailsLoading());
    Either<Failure, Unit> response =
        await editUserDetailsUsecase.call(user: user);
    response.fold(
      (_) {
        emit(UsersEditDetailsError());
      },
      (_) {
        // _curUserDetails = user;
        // emit(UsersEditDetailsSuccess());
        getUserDetails(uID: user.id.toString());
        getAllUsers();
      },
    );
  }

  String _deleteionMessage = '';
  String get deleteionMessage => _deleteionMessage;

  void deleteUserByID({required String uID}) async {
    emit(UsersDeletionLoading());
    Either<Failure, String> response = await deleteUserUsecase.call(uID: uID);
    response.fold(
      (_) {
        emit(UsersDeletionError());
      },
      (msg) {
        _deleteionMessage = msg;
        emit(UsersDeletionSuccess());

        getAllUsers();
      },
    );
  }
}
