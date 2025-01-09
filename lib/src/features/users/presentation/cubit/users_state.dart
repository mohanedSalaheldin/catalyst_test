abstract class UsersState {
  const UsersState();
}

class UsersInitial extends UsersState {}

class UsersFetchAllError extends UsersState {}

class UsersFetchAllSuccess extends UsersState {}

class UsersFetchAllLoading extends UsersState {}

class UsersFetchDetailsLoading extends UsersState {}

class UsersFetchDetailsSuccess extends UsersState {}

class UsersFetchDetailsError extends UsersState {}
