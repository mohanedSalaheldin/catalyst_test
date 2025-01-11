import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';
import 'package:catalyst_test/src/features/users/presentation/cubit/users_cubit.dart';
import 'package:flutter/material.dart';

void editUserDialog({required BuildContext context, required UserEntity user}) {
  // Temporary variables for the dialog
  TextEditingController nameController = TextEditingController(text: user.name);
  TextEditingController emailController =
      TextEditingController(text: user.email);
  TextEditingController phoneController =
      TextEditingController(text: user.phone);
  TextEditingController roleController = TextEditingController(text: user.role);

  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController roleController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Edit User'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: roleController,
                decoration: const InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              var cubit = UsersCubit.get(context);
              UserEntity updatedUser = UserEntity(
                id: cubit.curUserDetails.id,
                name: nameController.text,
                email: emailController.text,
                phone: phoneController.text,
                role: roleController.text,
                profileImage: '',
                introVideo: '',
                createdAt: cubit.curUserDetails.createdAt,
                updatedAt: cubit.curUserDetails.updatedAt,
              );
              cubit.editUserDetails(user: updatedUser);

              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
