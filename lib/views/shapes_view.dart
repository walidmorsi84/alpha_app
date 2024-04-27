import 'package:alpha/constants.dart';
import 'package:alpha/models/model.dart';
import 'package:alpha/views/numbers_view.dart';
import 'package:alpha/widgets/custom_app_bar.dart';
import 'package:alpha/widgets/custom_speed_dial_and_draggable_fab.dart';
import 'package:alpha/widgets/custom_text.dart';
import 'package:alpha/widgets/custom_grid_view_item.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class ShapesView extends StatefulWidget {
  const ShapesView({super.key});

  @override
  State<ShapesView> createState() => _ShapesViewState();
}

class _ShapesViewState extends State<ShapesView>
    with SingleTickerProviderStateMixin {
  final List<AlphaModel> alphaModelList = const [
    AlphaModel(
      color: Colors.blue,
      letter: 'أسد',
      name: 'أ',
      sound: 'assets/num_sounds/ar_one.mp3',
      alignment: Alignment.topLeft,
      image: 'assets/numbers/one.png',
    ),
    AlphaModel(
      color: Colors.red,
      letter: 'بطة',
      name: 'ب',
      sound: 'assets/num_sounds/ar_two.mp3',
      alignment: Alignment.topCenter,
      image: 'assets/numbers/two.png',
    ),
    AlphaModel(
      color: Colors.green,
      name: 'ت',
      letter: 'تفاحة',
      sound: 'assets/num_sounds/ar_three.mp3',
      alignment: Alignment.topRight,
      image: 'assets/numbers/three.png',
    ),
    AlphaModel(
      color: Colors.grey,
      name: 'ث',
      letter: 'ثعلب',
      sound: 'assets/num_sounds/ar_four.mp3',
      alignment: Alignment.centerRight,
      image: 'assets/numbers/four.png',
    ),
    AlphaModel(
      color: Colors.amber,
      name: 'ج',
      letter: 'جمل',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.purple,
      name: 'ح',
      letter: 'حصان',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.brown,
      name: 'خ',
      letter: 'خروف',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.blue,
      name: 'د',
      letter: 'ديك',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.red,
      name: 'ذ',
      letter: 'ذئب',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.green,
      name: 'ر',
      letter: 'رمان',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.grey,
      name: 'ز',
      letter: 'زرافة',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.amber,
      name: 'س',
      letter: 'سلحفاة',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.purple,
      name: 'ش',
      letter: 'شمس',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.orange,
      name: 'ص',
      letter: 'صاروخ',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.blue,
      name: 'ض',
      letter: 'ضفدع',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.red,
      name: 'ط',
      letter: 'طماطم',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.green,
      name: 'ظ',
      letter: 'ظبي',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.grey,
      name: 'ع',
      letter: 'عصفور',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.brown,
      name: 'غ',
      letter: 'غراب',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.purple,
      name: 'ف',
      letter: 'فيل',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.orange,
      name: 'ق',
      letter: 'قطة',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.blue,
      name: 'ك',
      letter: 'كلب',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.red,
      name: 'ل',
      letter: 'ليمون',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.green,
      name: 'م',
      letter: 'مروحة',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.grey,
      name: 'ن',
      letter: 'نملة',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.lime,
      name: 'هـ',
      letter: 'هدهد',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.purple,
      name: 'و',
      letter: 'وردة',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
    AlphaModel(
      color: Colors.orange,
      name: 'ي',
      letter: 'يد',
      sound: 'assets/num_sounds/ar_five.mp3',
      alignment: Alignment.center,
      image: 'assets/numbers/five.png',
    ),
  ];

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

    currColor = alphaModelList.first;
    prevColor = alphaModelList.last;

    currImage = alphaModelList.first;
    prevImage = alphaModelList.last;

    currName = alphaModelList.first;
    prevName = alphaModelList.last;

    currLetter = alphaModelList.first;
    prevLetter = alphaModelList.last;

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
                              child: const CustomText(text: 'shape'),
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
                    itemCount: alphaModelList.length,
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
                            Audio(alphaModelList[index].sound),
                          );
                          prevColor = currColor;
                          prevImage = currImage;
                          prevName = currName;
                          prevLetter = currLetter;

                          currColor = alphaModelList[index];
                          currImage = alphaModelList[index];
                          currName = alphaModelList[index];
                          currLetter = alphaModelList[index];

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
                          alphaModel: alphaModelList[index],
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
