import 'package:catalyst_test/src/config/routes/navigation.dart';
import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_cubit.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_state.dart';
import 'package:catalyst_test/src/features/users/presentation/pages/user_details_screen.dart';
import 'package:catalyst_test/src/features/users/presentation/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userEntity,
  });

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: 400.0,
            height: 150.0,
            child: InkWell(
              onTap: () {
                UsersCubit.get(context)
                    .getUserDetails(uID: userEntity.id.toString());
                navigateTo(
                    context: context,
                    screen: UserDetailsScreen(
                      uID: userEntity.id.toString(),
                    ));
              },
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileImage(src: userEntity.profileImage),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      const SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userEntity.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 10.0),

                          Text(
                            userEntity.phone,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            userEntity.role,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          // Text(
                          //   userEntity.phone,
                          //   style: Theme.of(context).textTheme.titleSmall,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
