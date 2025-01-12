import 'package:catalyst_test/src/features/users/data/models/user_model.dart';

import '../../domain/entities/property_entity.dart';

class PropertyModel extends PropertyEntity {
  PropertyModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.description,
    required super.price,
    required super.location,
    required super.images,
    required super.video,
    required super.createdAt,
    required super.updatedAt,
    required super.user,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
      location: json['location'],
      images: List<String>.from(
        json['images']
            .replaceAll('\\', '') // To handle escaped paths
            .replaceAll('["', '')
            .replaceAll('"]', '')
            .split('","'),
      ),
      video: json['video'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user:
          UserModel.fromJson(json['user']), // Assuming you have a `User` model.
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'description': description,
      'price': price.toStringAsFixed(2),
      'location': location,
      'images': images,
      'video': video,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user': (user as UserModel)
          .toJson(), // Assuming UserModel is your implementation.
    };
  }
}
