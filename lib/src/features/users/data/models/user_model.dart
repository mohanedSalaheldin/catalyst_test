import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.role,
    required super.profileImage,
    required super.introVideo,
    required super.createdAt,
    required super.updatedAt,
  });

  // Factory constructor to create an instance from JSON

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      // profileImage: json['profile_image'] ?? src,
      profileImage:
          'https://bio3.catalyst.com.eg/public/Catalyst_portfolio/IMG_0997%20(1).jpg',

      introVideo:
          "https://bio3.catalyst.com.eg/public/Catalyst_portfolio/techtest.mp4",
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'profile_image': profileImage,
      'intro_video': introVideo,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
