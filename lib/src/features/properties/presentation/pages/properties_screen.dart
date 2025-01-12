import 'package:catalyst_test/responsive.dart';
import 'package:catalyst_test/src/features/properties/presentation/widgets/my_slider.dart';
import 'package:flutter/material.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int count = ResponsiveWidget.isDesktop(context)
        ? 4
        : ResponsiveWidget.isMobileLarge(context)
            ? 1
            : 2;

    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            childAspectRatio: 1,
            mainAxisExtent: 450,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 150,
                minHeight: 100,
              ),
              child: const ProperyCard(),
            );
          },
        ),
      ),
    );
  }
}

class ProperyCard extends StatelessWidget {
  const ProperyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      width: 300,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 280,
                height: 280,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const MySlider(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5.0),
                  Text(
                    'ea doloribus consequuntur',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    '43313 Jacynthe Forge Suite 521\r\nEast Roma, MN 99831',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    '4682.63 \$',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String src =
    'https://a0.muscache.com/im/pictures/miso/Hosting-544083491272917079/original/c08fe587-b87f-41fb-96a0-0723b55058ea.jpeg?im_w=960&im_format=avif';
