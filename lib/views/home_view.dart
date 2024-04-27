import 'package:alpha/constants.dart';
import 'package:alpha/views/reading_view.dart';
import 'package:alpha/views/shapes_view.dart';
import 'package:alpha/widgets/custom_card.dart';
import 'package:alpha/views/letters_view.dart';
import 'package:alpha/views/numbers_view.dart';
import 'package:alpha/widgets/custom_home_grid_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CustomCard> customCardList = [
      CustomCard(
        text: 'Letters',
        icon: Icons.abc,
        color: Colors.purple,
        shadowColor: Colors.purple,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LettersView()));
        },
      ),
      CustomCard(
        text: 'Numbers',
        icon: Icons.onetwothree,
        color: Colors.green,
        shadowColor: Colors.green,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const NumbersView()));
        },
      ),
      CustomCard(
        text: 'Shapes',
        icon: Icons.shape_line_outlined,
        iconSize: 60,
        color: Colors.blueAccent,
        shadowColor: Colors.blueAccent,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ShapesView()));
        },
      ),
      CustomCard(
        text: 'Reading',
        icon: Icons.menu_book,
        iconSize: 70,
        color: Colors.orange,
        shadowColor: Colors.orange,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ReadingView()));
        },
      ),
    ];
    return Scaffold(
      backgroundColor: kColor,
      appBar: AppBar(
        title: const Text('Alpha',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
        backgroundColor: kColor,
      ),
      body: CustomHomeGridView(customCardList: customCardList),
    );
  }
}

// Widget goToPage(int index) {
//   Widget page;
//   // You can also use if else here.
//
//   switch (index) {
//     case 0:
//       page = const LettersView();
//       break;
//     case 1:
//       page = const NumbersView();
//       break;
//     case 2:
//       page = const ShapesView();
//       break;
//     case 3:
//       page = const ReadingView();
//       break;
//     default:
//       page = Container(); // default item when no matching card found
//   }
//   return page;
// }
