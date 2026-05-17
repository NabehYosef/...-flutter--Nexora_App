import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/model/onboardingmodel.dart';

// ignore: non_constant_identifier_names
List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "Product Delivery",
    body:
        "Your Product is delivered to your home \n safely and securely",
    image: AppImageAsset
        .onBoardingImageOne,
  ),

  OnBoardingModel(
    title: "Easy And Safe Payment",
    body:
        "Pay for the product you buy safely and \n easily",
    image: AppImageAsset
        .onBoardingImageTwo,
  ),

  OnBoardingModel(
    title: "Find Favorite Items",
    body:
        "Find your favirite products that you want to buy easily",
    image: AppImageAsset
        .onBoardingImageThree,
  ),
];
