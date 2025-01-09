import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var src =
        'data:image/jpeg;base64,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';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: SizedBox(
                width: 400.0,
                height: 200.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileImage(src: src),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Admin',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mohaned Salaheldin',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'braun.ashley@example.org',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '+09182736473',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.src,
  });

  final String src;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
          src,
        ),
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
