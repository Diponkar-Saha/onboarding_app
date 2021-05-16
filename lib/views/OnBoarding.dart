import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:onboarding_app/controllers/OnBoardingController.dart';
class OnBoarding extends StatelessWidget {
  final _controller=OnBoardingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onBoardingPages.length,
                itemBuilder: (context,index){

              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(_controller.onBoardingPages[index].imageAsset),
                    SizedBox(height: 32),
                    Text(_controller.onBoardingPages[index].title,
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      child: Text(_controller.onBoardingPages[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),),
                    ),

                  ],
                ),
              );
            }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(_controller.onBoardingPages.length,
                        (index) => Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(4),
                              width: 13,
                              height: 13,
                              decoration: BoxDecoration(
                                color:_controller.selectedPageIndex.value==index?  Colors.red : Colors.grey,
                                shape: BoxShape.circle
                              ),

                            );
                          }),
                        )),

              ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                backgroundColor: Colors.grey,
                elevation: 0,
                onPressed: _controller.forwardAction,
                  child:Obx((){
                    return Text(_controller.isLastPage? 'Start' : 'Next');


                  }),
            )),

          ],
        ),
      ),

    );
  }
}
