import 'package:catalyst_test/src/core/utils/network/network_info.dart';
import 'package:catalyst_test/src/features/users/data/datasources/users_remote_datasource.dart';
import 'package:catalyst_test/src/features/users/data/repositories/users_repository_impl.dart';
import 'package:catalyst_test/src/features/users/domain/repositories/users_repository.dart';
import 'package:catalyst_test/src/features/users/domain/usecases/delete_user_details_usecase.dart';
import 'package:catalyst_test/src/features/users/domain/usecases/edit_user_details_usecase.dart';
import 'package:catalyst_test/src/features/users/domain/usecases/fetch_all_users_usecase.dart';
import 'package:catalyst_test/src/features/users/domain/usecases/fetch_user_details_usecase.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
/* --------------------Features-------------------- */
// Users
  // Bloc
  sl.registerFactory(
    () => UsersCubit(
      fetchAllUsers: sl(),
      fetchUserDetailsUsecase: sl(),
      deleteUserUsecase: sl(),
      editUserDetailsUsecase: sl(),
    ),
  );

  // Repository

  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(
        datasource: sl(),
        networkInfo: sl(),
      ));

  // UseCases
  // -------------------------------(Users)--------------------------------
  sl.registerLazySingleton(() => FetchAllUsersUsecase(repository: sl()));
  sl.registerLazySingleton(() => FetchUserDetailsUsecase(repository: sl()));
  sl.registerLazySingleton(() => DeleteUserUsecase(repository: sl()));
  sl.registerLazySingleton(() => EditUserDetailsUsecase(repository: sl()));
  // sl.registerLazySingleton(() => HomeGetCachedNewsUsecase(repository: sl()));
  // sl.registerLazySingleton(() => HomeCacheNewsUsecase(repository: sl()));

/* --------------------Core-------------------- */

  // -------------------------------(Users)--------------------------------
  sl.registerLazySingleton<UsersRemoteDatasource>(
      () => UsersRemoteDatasourceImpl());
  // sl.registerLazySingleton<HomeNewsLocalDatasourse>(
  //     () => HomeNewsLocalDatasourseImpl());
  // -------------------------------(All Courses)--------------------------------

/* --------------------External-------------------- */
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
