import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:intern_task/features/cart/data/repo/cart_repo_impl.dart';
import 'package:intern_task/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:intern_task/features/home/data/repo/home_repo_impl.dart';
import 'package:intern_task/features/home/presentation/view_model/get_all_product/get_all_products_cubit.dart';
import 'package:intern_task/features/login/data/repo/login_repo_impl.dart';
import 'package:intern_task/features/products/data/repo/product_repo_impl.dart';
import 'package:intern_task/features/sign_up/data/repo/sign_up_repo_impl.dart';
import '../api/dio_consumer.dart';
import '../cache/cache_helper.dart';

GetIt getIt = GetIt.instance;

setupGetIt() async {
  await CacheHelper().init();

  // cache and dio consumer
  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  // auth
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(api: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<SignUpRepoImpl>(
    SignUpRepoImpl(api: getIt<DioConsumer>()),
  );
  // home
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(api: getIt<DioConsumer>()),
  );
  // products
  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(api: getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton(
    () => GetAllProductsCubit(getIt<HomeRepoImpl>()),
  );
  // cart
  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(api: getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton(
    () => CartCubit(getIt<CartRepoImpl>()),
  );
}
