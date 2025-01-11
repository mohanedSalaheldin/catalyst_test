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

class UsersEditDetailsLoading extends UsersState {}

class UsersEditDetailsSuccess extends UsersState {}

class UsersEditDetailsError extends UsersState {}

class UsersDeletionLoading extends UsersState {}

class UsersDeletionSuccess extends UsersState {}

class UsersDeletionError extends UsersState {}
