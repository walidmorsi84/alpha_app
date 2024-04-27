import 'package:alpha/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CustomHomeGridView extends StatelessWidget {
  const CustomHomeGridView({
    super.key,
    required this.customCardList,
  });

  final List<CustomCard> customCardList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: customCardList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4,
            mainAxisSpacing: 32,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return customCardList[index];
          },
        ),
      ),
    );
  }
}
