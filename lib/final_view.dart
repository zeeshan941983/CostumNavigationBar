import 'package:custom_nav/app_config.dart';
import 'package:custom_nav/btm_Nav_btn.dart';
import 'package:custom_nav/position_constrants.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  int _currentIndex = 0;
  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void animatedto(int page) {
    controller.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    AppSize().initSizes(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Custom Bottom Navigation Bar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
                child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: listScreen,
            )),
            Positioned(
                bottom: 0, left: 0, right: 0, child: _buildBottomNavBar())
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSize.blockSizeHorizontal * 4.5, 0,
          AppSize.blockSizeHorizontal * 4.5, 70),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 10,
        color: Colors.transparent,
        child: Container(
          width: AppSize.screenWidth,
          height: AppSize.blockSizeHorizontal * 18,
          decoration: BoxDecoration(
              color: Colors.grey[800], borderRadius: BorderRadius.circular(30)),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                top: 0,
                left: AppSize.blockSizeHorizontal * 3,
                right: AppSize.blockSizeHorizontal * 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomNavBotton(
                      icon: IconlyLight.home,
                      index: 0,
                      currentIndex: _currentIndex,
                      onpressed: (val) {
                        animatedto(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBotton(
                      icon: IconlyLight.search,
                      index: 1,
                      currentIndex: _currentIndex,
                      onpressed: (val) {
                        animatedto(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBotton(
                      icon: IconlyLight.activity,
                      index: 2,
                      currentIndex: _currentIndex,
                      onpressed: (val) {
                        animatedto(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBotton(
                      icon: IconlyLight.profile,
                      index: 3,
                      currentIndex: _currentIndex,
                      onpressed: (val) {
                        animatedto(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 300),
                left: animatedPositionLeftValue(_currentIndex),
                child: Column(
                  children: [
                    Container(
                      height: AppSize.blockSizeHorizontal * 1.0,
                      width: AppSize.blockSizeHorizontal * 12,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                      ),
                    ),
                    ClipPath(
                      clipper: lightClipper(),
                      child: Container(
                        height: AppSize.blockSizeHorizontal * 15,
                        width: AppSize.blockSizeHorizontal * 12,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: gradiant,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class lightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path _path = Path();
    _path.lineTo(AppSize.blockSizeHorizontal * 3, 0);
    _path.lineTo(0, size.height);
    _path.lineTo(size.width, size.height);
    _path.lineTo(size.width - AppSize.blockSizeHorizontal * 3, 0);

    return _path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
