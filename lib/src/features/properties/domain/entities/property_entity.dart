import 'package:catalyst_test/src/features/users/domain/entities/user_entity.dart';

class PropertyEntity {
  final int id;
  final int userId;
  final String name;
  final String description;
  final double price;
  final String location;
  final List<String> images;
  final String video;
  final DateTime createdAt;
  final DateTime updatedAt;

  final UserEntity user;

  PropertyEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.price,
    required this.location,
    required this.images,
    required this.video,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });
}
