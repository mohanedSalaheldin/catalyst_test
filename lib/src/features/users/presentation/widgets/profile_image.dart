import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hexcolor/hexcolor.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.src,
  });

  final String src;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: badges.Badge(
        badgeStyle: badges.BadgeStyle(
            badgeColor: HexColor("#e51e54"),
            borderRadius: BorderRadius.circular(8),
            elevation: 4),
        position: badges.BadgePosition.bottomEnd(bottom: -5, end: -5),
        badgeContent: const Icon(
          Icons.verified,
          color: Colors.white,
        ),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
            src,
          ),
          // child: const Text('Hiiiii'),
        ),
      ),
    );
  }
}
