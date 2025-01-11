import 'dart:io';

import 'package:catalyst_test/src/features/users/presentation/cubit/users_cubit.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_state.dart';
import 'package:catalyst_test/src/features/users/presentation/widgets/edit_user_dialoge.dart';
import 'package:catalyst_test/src/features/users/presentation/widgets/profile_image.dart';
import 'package:catalyst_test/src/features/users/presentation/widgets/user_card.dart';
import 'package:catalyst_test/src/features/users/presentation/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

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
      appBar: Platform.isAndroid
          ? AppBar(
              actions: [optionsButtons(context)],
            )
          : null,
      body: SafeArea(
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            var cubit = UsersCubit.get(context);
            if (state is UsersFetchDetailsLoading ||
                state is UsersEditDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!Platform.isAndroid)
                    SizedBox(
                      width: 400.0,
                      height: 50.0,
                      child: Card(
                        child: optionsButtons(context),
                      ),
                    ),
                  SizedBox(
                    width: 400.0,
                    height: 150.0,
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
                                ProfileImage(
                                    src: cubit.curUserDetails.profileImage),
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
                                  cubit.curUserDetails.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  cubit.curUserDetails.phone,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  cubit.curUserDetails.role,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 400.0,
                    // height: 150.0,
                    child: Card(
                      child: Column(
                        children: [
                          VideoPlayerScreen(
                            url: cubit.curUserDetails.introVideo,
                          ),
                          ListTile(
                            leading: const Icon(Icons.email),
                            title: Text(
                              cubit.curUserDetails.email,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.create),
                            title: Text(
                              'Created: ${formatDate(cubit.curUserDetails.createdAt)}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.update),
                            title: Text(
                              'Updated: ${formatDate(cubit.curUserDetails.updatedAt)}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget optionsButtons(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        var cubit = UsersCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                cubit.deleteUserByID(uID: widget.uID);

                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                editUserDialog(context: context, user: cubit.curUserDetails);
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ],
        );
      },
    );
  }

  String formatDate(String isoDate) {
    // Parse the date string into a DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Format the date
    return DateFormat('MMMM d, y, h:mm a').format(dateTime);
  }
}
