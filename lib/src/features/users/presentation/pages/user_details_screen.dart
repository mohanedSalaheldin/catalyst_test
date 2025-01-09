import 'package:catalyst_test/src/features/users/presentation/cubit/users_cubit.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_state.dart';
import 'package:catalyst_test/src/features/users/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        var cubit = UsersCubit.get(context);
        return Scaffold(
          body: Center(
            child: UserCard(userEntity: cubit.curUserDetails),
          ),
        );
      },
    );
  }
}
