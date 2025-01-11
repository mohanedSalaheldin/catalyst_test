import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_cubit.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_state.dart';
import 'package:catalyst_test/src/features/users/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../responsive.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          var cubit = UsersCubit.get(context);
          List<UserEntity> users = cubit.users;
          int count = ResponsiveWidget.isDesktop(context)
              ? 3
              : ResponsiveWidget.isMobileLarge(context)
                  ? 1
                  : 2;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state is UsersFetchAllLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: count,
                          childAspectRatio: 1,
                          mainAxisExtent: 220),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return UserCard(
                          userEntity: users[index],
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
