class UserEntity {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String profileImage;
  final String introVideo;
  final String createdAt;
  final String updatedAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.profileImage,
    required this.introVideo,
    required this.createdAt,
    required this.updatedAt,
  });
}
