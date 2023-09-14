
import 'package:flutter/material.dart';

class AudioWidget extends StatelessWidget {
  AudioWidget({
    super.key,
    required this.controller,
  })  : containerMargin = Tween<double>(begin: 0.0, end: 20.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        containerPadding = Tween<double>(begin: 20.0, end: 13.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        containerHeight = Tween<double>(begin: 95.0, end: 145.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        containerBorderRadius = Tween<double>(begin: 0, end: 20.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        containerBgColor = ColorTween(
                begin: Colors.white,
                end: const Color.fromRGBO(241, 241, 241, 1))
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.5,
              curve: Curves.ease,
            ),
          ),
        ),
        iconBgColor = ColorTween(begin: Colors.black26, end: Colors.white).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        iconPositionTop = Tween<double>(begin: 0.0, end: 70.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.4,
              curve: Curves.ease,
            ),
          ),
        ),
        iconBtnSize = Tween<double>(begin: 50.0, end: 40.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.4,
              curve: Curves.ease,
            ),
          ),
        ),
        iconForwardOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        iconBackWardOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        iconData =
            Tween<IconData>(begin: Icons.play_circle, end: Icons.pause).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        titleTextPaddingLeft = Tween<double>(begin: 60.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.2,
              0.4,
              curve: Curves.ease,
            ),
          ),
        );
  final Animation<double> controller;

  final Animation<double> containerMargin;
  final Animation<double> containerPadding;
  final Animation<double> containerBorderRadius;
  final Animation<Color?> containerBgColor;
  final Animation<double> containerHeight;

  final Animation<double> titleTextPaddingLeft;

  final Animation<Color?> iconBgColor;
  final Animation<double> iconPositionTop;
  final Animation<double> iconBtnSize;
  final Animation<double> iconForwardOpacity;
  final Animation<double> iconBackWardOpacity;

  final Animation<IconData> iconData;

  @override
  Widget build(BuildContext context) {
    Widget workingWidget(BuildContext context, Widget? child) {
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: containerMargin.value, vertical: 0),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: containerPadding.value,
            vertical: containerPadding.value - 10),
        height: containerHeight.value,
        decoration: BoxDecoration(
            color: containerBgColor.value,
            borderRadius: BorderRadius.circular(containerBorderRadius.value)),
        child: Stack(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: titleTextPaddingLeft.value, top: 5),
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Flexible(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Audio Title",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "by teacher",
                            style: TextStyle(),
                          ),
                        ]),
                  ),
                 const  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: iconBgColor.value,borderRadius: BorderRadius.circular(20)),
                    child: const Icon(Icons.download,color: Colors.yellow,))
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: iconPositionTop.value,
              width: iconBtnSize.value,
              child: Container(
                width: iconBtnSize.value,
                height: iconBtnSize.value,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: iconBgColor.value,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Opacity(
                        opacity: iconForwardOpacity.value,
                        child: const Icon(Icons.audio_file,
                            size: 20, color: Colors.yellow),
                      ),
                    ),
                    Center(
                      child: Opacity(
                        opacity: iconBackWardOpacity.value,
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.yellow,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            iconPositionTop.value == 70
                ? Positioned(
                    left: iconBtnSize.value + 10,
                    top: iconPositionTop.value - 5,
                    child: Container())
                : const SizedBox()
          ],
        ),
      );
    }

    return AnimatedBuilder(
      builder: workingWidget,
      animation: controller,
    );
  }
}
