import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onboarding_app/models/OnBoardingModel.dart';
import 'package:get/utils.dart';
class OnBoardingController extends GetxController{
  var pageController=PageController();
  var selectedPageIndex =0.obs;
  bool get isLastPage=>selectedPageIndex.value==onBoardingPages.length-1;
  forwardAction(){
    if(isLastPage){
      //home
    }else{
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }

  }

  List<OnBoardingModel> onBoardingPages = [
    OnBoardingModel('assets/cook.png', 'diponkar ', 'description test description test  description test description test' ),
    OnBoardingModel('assets/order.png', 'diponkar ', 'description description test description test test description test' ),
    OnBoardingModel('assets/deliver.png', 'diponkar titlr', 'description test description  description test description test  description' )
  ];
}