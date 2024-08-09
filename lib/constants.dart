import 'package:intern_task/core/utils/app_images.dart';
 
import 'features/onboarding/data/model/page_view_model.dart';

class AppConstants {
   static String isLoggedIn = 'isLoggedIn';
  static List<PageViewModel> pageViewModels = [
    PageViewModel(
      title: 'Explore the \nworld easily',
      description: 'To your desire',
      image: AppImages.onboarding1Image,
    ),
    PageViewModel(
      title: 'Reach the \nunknown spot',
      description: 'To your destination',
      image: AppImages.onboarding2Image,
    ),
    PageViewModel(
      title: 'Make connects \nwith explora',
      description: 'To your dream trip',
      image: AppImages.onboarding3Image,
    ),
  ];
}
