import 'package:catalyst_test/src/features/users/presentation/cubit/users_cubit.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_state.dart';
import 'package:catalyst_test/src/features/users/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key, required this.uID});
  final String uID;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    var cubit = UsersCubit.get(context);
    cubit.getUserDetails(uID: widget.uID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          var cubit = UsersCubit.get(context);
          // return const Center();
          return Center(
            child: UserCard(userEntity: cubit.curUserDetails),
          );
        },
      ),
    );
  }
}
