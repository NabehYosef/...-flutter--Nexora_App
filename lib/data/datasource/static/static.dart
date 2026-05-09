import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/model/onboardingmodel.dart';

// ignore: non_constant_identifier_names
List<OnBoardingModel> OnBoardingList = [
  OnBoardingModel(
    title: 'Choose Your Product',
    imageurl: AppImageassets
        .OnBoardingImageOne,
    body:
        'We Have a 10k+ Products.Choose\n Your Product from our \n E-commerce shope',
  ),
  OnBoardingModel(
    title: 'Easy & Safe Payment',
    imageurl: AppImageassets
        .OnBoardingImageTwo,
    body:
        'Easy Checkout & Safe Payment \n method. Trusted by our Customers \n from all over the world',
  ),
  OnBoardingModel(
    title: 'Track your Order',
    imageurl: AppImageassets
        .OnBoardingImageThree,
    body:
        'Best Tracker has been Used For \n Track your order. You will know where your product is at the moment .',
  ),
  OnBoardingModel(
    title: 'Fast Delivery',
    imageurl: AppImageassets
        .OnBoardingImageFour,
    body:
        'Relible And Fast Delivery.We Deliver your product the fastest way possible.',
  ),
];
