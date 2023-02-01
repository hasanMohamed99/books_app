import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }
  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          AssetsData.logo,
          width: MediaQuery.of(context).size.width * 0.07,
          height: MediaQuery.of(context).size.height * 0.07,
        ),
        const SizedBox(
          height: 10.0,
        ),
        AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context , _) {
              return SlideTransition(
                position: slidingAnimation,
                child: const Text(
                  'Read Free Books',
                  textAlign: TextAlign.center,
                ),
              );
            }
        ),
      ],
    );
  }

  void initSlidingAnimation(){
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    slidingAnimation = Tween<Offset>(begin: const Offset(0, 4) , end: Offset.zero,).animate(animationController);
    animationController.forward();
  }
  void navigateToHome(){
    Future.delayed(const Duration(seconds: 4), (){
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
