import 'package:custom_nav/app_config.dart';
import 'package:flutter/material.dart';

class BottomNavBotton extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onpressed;
  const BottomNavBotton(
      {super.key,
      required this.icon,
      required this.index,
      required this.currentIndex,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    AppSize().initSizes(context);
    return InkWell(
      onTap: () {
        onpressed(index);
      },
      child: Container(
          height: AppSize.blockSizeHorizontal * 13,
          width: AppSize.blockSizeHorizontal * 17,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Stack(
            alignment: Alignment.center,
            children: [
              (currentIndex == index)
                  ? Positioned(
                      left: AppSize.blockSizeHorizontal * 4,
                      bottom: AppSize.blockSizeHorizontal * 1.5,
                      child: Icon(
                        icon,
                        color: Colors.black,
                        size: AppSize.blockSizeHorizontal * 8,
                      ),
                    )
                  : Container(),
              AnimatedOpacity(
                opacity: (currentIndex == index) ? 1 : 0.2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: Icon(
                  icon,
                  size: AppSize.blockSizeHorizontal * 8,
                  color: Colors.yellow,
                ),
              ),
            ],
          )),
    );
  }
}
