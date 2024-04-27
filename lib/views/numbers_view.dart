import 'package:alpha/constants.dart';
import 'package:alpha/models/model.dart';
import 'package:alpha/views/letters_view.dart';
import 'package:alpha/widgets/custom_app_bar.dart';
import 'package:alpha/widgets/custom_clip_path.dart';
import 'package:alpha/widgets/custom_speed_dial_and_draggable_fab.dart';
import 'package:alpha/widgets/custom_text.dart';
import 'package:alpha/widgets/custom_grid_view_item.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class NumbersView extends StatefulWidget {
  const NumbersView({super.key});

  @override
  State<NumbersView> createState() => _NumbersViewState();
}

class _NumbersViewState extends State<NumbersView>
    with SingleTickerProviderStateMixin {
  // final List<ColorModel> colorsList = const [
  //   ColorModel(
  //       color: Color(0xFF2196F3),
  //       alignment: Alignment.topLeft,
  //       image: 'assets/numbers/one.png'),
  //   ColorModel(
  //       color: Color(0xFFF44336),
  //       alignment: Alignment.topCenter,
  //       image: 'assets/numbers/two.png'),
  //   ColorModel(
  //       color: Color(0xFF4CAF50),
  //       alignment: Alignment.topRight,
  //       image: 'assets/numbers/three.png'),
  //   ColorModel(
  //       color: Color(0xFF9E9E9E),
  //       alignment: Alignment.centerRight,
  //       image: 'assets/numbers/four.png'),
  //   ColorModel(
  //       color: Color(0xFFFFC107),
  //       alignment: Alignment.center,
  //       image: 'assets/numbers/five.png'),
  //   ColorModel(
  //       color: Color(0xFF9C27B0),
  //       alignment: Alignment.centerLeft,
  //       image: 'assets/numbers/six.png'),
  //   ColorModel(
  //       color: Color(0xFF795548),
  //       alignment: Alignment.bottomLeft,
  //       image: 'assets/numbers/seven.png'),
  //   ColorModel(
  //       color: Color(0xFF2196F3),
  //       alignment: Alignment.bottomCenter,
  //       image: 'assets/numbers/eight.png'),
  //   ColorModel(
  //       color: Color(0xFFF44336),
  //       alignment: Alignment.bottomRight,
  //       image: 'assets/numbers/nine.png'),
  //   ColorModel(
  //       color: Color(0xFF4CAF50),
  //       alignment: Alignment.center,
  //       image: 'assets/numbers/ten.png'),
  // ];

  late AnimationController animationController;

  late AlphaModel currColor, prevColor;
  late AlphaModel currImage, prevImage;

  late bool isShown = true;

  @override
  void initState() {
    super.initState();

    currColor = alphaModelNumbersList.first;
    prevColor = alphaModelNumbersList.last;

    currImage = alphaModelNumbersList.first;
    prevImage = alphaModelNumbersList.last;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor,
      appBar: const CustomAppBar(title: 'Numbers', titleColor: Colors.green),
      floatingActionButton: const CustomSpeedDialAndDraggableFAB(
        icon: Icons.abc,
        label: 'Letters',
        childIconColor: Colors.purple,
        closeMenuColor: Colors.green,
        mainIconColor: Colors.green,
        width: double.infinity,
        height: 550,
        widget: LettersView(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.6,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30.0),
                //     color: kColor,
                //     gradient: LinearGradient(
                //       colors: [
                //         prevColor.color.withOpacity(0.5),
                //         prevColor.color,
                //       ],
                //     ),
                //   ),
                // ),
                isShown
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: kColor,
                          // image: DecorationImage(
                          //   fit: BoxFit.fill,
                          //   image: AssetImage(currentImage.image),
                          // ),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     prevColor.color.withOpacity(0.5),
                          //     prevColor.color,
                          //   ],
                          // ),
                        ),
                        child: const CustomText(text: 'number'),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: kColor,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(currImage.image),
                          ),
                          // gradient: LinearGradient(
                          //   colors: [
                          //     prevColor.color.withOpacity(0.5),
                          //     prevColor.color,
                          //   ],
                          // ),
                        ),
                      ),
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, _) {
                    return ClipPath(
                      clipper: CustomClipPath(
                        value: animationController.value,
                        alignment: currColor.alignment,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: currColor.color,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(currImage.image),
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                            colors: [
                              currColor.color.withOpacity(0.5),
                              currColor.color,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.builder(
                    itemCount: alphaModelNumbersList.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final assetsAudioPlayer = AssetsAudioPlayer();
                          assetsAudioPlayer.open(
                            Audio(alphaModelNumbersList[index].sound),
                          );
                          //prevColor = currentColor;
                          prevImage = currImage;

                          currColor = alphaModelNumbersList[index];
                          currImage = alphaModelNumbersList[index];

                          animationController
                              .forward(from: 0.0)
                              .whenCompleteOrCancel(() {
                            //prevColor = currentColor;
                            prevImage = currImage;
                            isShown = false;
                            setState(() {});
                          });
                        },
                        child: CustomGridViewItem(
                          alphaModel: alphaModelNumbersList[index],
                          //colorModel: colorsList[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
