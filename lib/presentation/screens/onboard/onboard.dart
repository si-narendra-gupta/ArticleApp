part of 'onboard_imports.dart';

@RoutePage()
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {

  OnBoardViewModel onBoardViewModel = OnBoardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    MyAssets.splashLogo,
                    color: MyColors.primaryColor,
                    height: 42.h,
                  ),
                ),
                Expanded(
                    child: PageView(
                  controller: onBoardViewModel.pageController,
                  children: const [
                    OnBoardFirst(),
                    OnBoardSecond(),
                    OnBoardThird()
                  ],
                )),
                ElevatedButton(
                    onPressed: () {
                        AutoRouter.of(context).push(const AuthRoute());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 44)),
                    child: Text(
                      MyStrings.getStarted,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        MyStrings.skip,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor),
                      ),
                      SmoothPageIndicator(
                          controller:
                              onBoardViewModel.pageController, // PageController
                          count: 3,
                          effect: WormEffect(
                              dotHeight: 12.0.h,
                              dotWidth: 12.0.w,
                              activeDotColor: MyColors
                                  .primaryColor), // your preferred effect
                          onDotClicked: (index) {}),
                      Text(
                        MyStrings.next,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnBoardFirst extends StatelessWidget {
  const OnBoardFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(MyAssets.onStep1, fit: BoxFit.fill)),
        Text(
          textAlign: TextAlign.center,
          MyStrings.stepOne,
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
        )
      ],
    );
  }
}

class OnBoardSecond extends StatelessWidget {
  const OnBoardSecond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(MyAssets.onStep2, fit: BoxFit.fill)),
        Text(
          textAlign: TextAlign.center,
          MyStrings.stepTwo,
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
        )
      ],
    );
  }
}

class OnBoardThird extends StatelessWidget {
  const OnBoardThird({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(
              MyAssets.onStep3,
              fit: BoxFit.fill,
            )),
        Text(
          textAlign: TextAlign.center,
          MyStrings.stepThree,
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
        )
      ],
    );
  }
}
