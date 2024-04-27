import 'package:alpha/constants.dart';
import 'package:alpha/models/model.dart';
import 'package:alpha/views/numbers_view.dart';
import 'package:alpha/widgets/custom_app_bar.dart';
import 'package:alpha/widgets/custom_speed_dial_and_draggable_fab.dart';
import 'package:alpha/widgets/custom_text.dart';
import 'package:alpha/widgets/custom_grid_view_item.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class LettersView extends StatefulWidget {
  const LettersView({super.key});

  @override
  State<LettersView> createState() => _LettersViewState();
}

class _LettersViewState extends State<LettersView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late AlphaModel currColor, prevColor;
  late AlphaModel currImage, prevImage;
  late AlphaModel currName, prevName;
  late AlphaModel currLetter, prevLetter;

  int currIndex = 0;
  double opacityLevel = 0;
  double imageSize = 0;

  late bool isShown = true;

  @override
  void initState() {
    super.initState();

    currColor = alphaModelLettersList.first;
    prevColor = alphaModelLettersList.last;

    currImage = alphaModelLettersList.first;
    prevImage = alphaModelLettersList.last;

    currName = alphaModelLettersList.first;
    prevName = alphaModelLettersList.last;

    currLetter = alphaModelLettersList.first;
    prevLetter = alphaModelLettersList.last;

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
      appBar: const CustomAppBar(title: 'Letters', titleColor: Colors.purple),
      floatingActionButton: const CustomSpeedDialAndDraggableFAB(
        icon: Icons.onetwothree,
        label: 'Numbers',
        childIconColor: Colors.green,
        closeMenuColor: Colors.purple,
        mainIconColor: Colors.purple,
        width: 0,
        height: double.infinity,
        widget: NumbersView(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        child: Row(
          children: [
            AnimatedSwitcher(
              transitionBuilder: (child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              duration: const Duration(seconds: 1),
              child: Stack(
                key: ValueKey(currIndex),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: isShown
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.9,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: kColor,
                              ),
                              child: const CustomText(text: 'letter'),
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: kColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 32.0, right: 8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    textAlign: TextAlign.end,
                                    currName.name,
                                    style: TextStyle(
                                      color: currColor.color,
                                      fontSize: 128,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: imageSize,
                                    height: imageSize,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(64),
                                      color: kColor,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(currImage.image),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    currLetter.letter,
                                    style: TextStyle(
                                      fontSize: 64,
                                      fontWeight: FontWeight.bold,
                                      color: currColor.color,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: kColor,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.builder(
                    itemCount: alphaModelLettersList.length,
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final assetsAudioPlayer = AssetsAudioPlayer();
                          assetsAudioPlayer.open(
                            Audio(alphaModelLettersList[index].sound),
                          );
                          prevColor = currColor;
                          prevImage = currImage;
                          prevName = currName;
                          prevLetter = currLetter;

                          currColor = alphaModelLettersList[index];
                          currImage = alphaModelLettersList[index];
                          currName = alphaModelLettersList[index];
                          currLetter = alphaModelLettersList[index];

                          animationController
                              .forward(from: 0.0)
                              .whenCompleteOrCancel(() {
                            isShown = false;
                            setState(() {
                              currIndex++;
                              opacityLevel = opacityLevel == 0 ? 1 : 0;
                              //imageSize = 300;
                              imageSize = imageSize == 300 ? 300 : 300;
                              //currentIndex = 0;
                            });
                          });
                        },
                        child: CustomGridViewItem(
                          alphaModel: alphaModelLettersList[index],
                          //colorModel: colorsList[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
