import 'package:get/get.dart';

import '../services/enums.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  Rx<MenuItemEnum> menuItemEnum = MenuItemEnum.dashboard.obs;
  RxBool isMenuOpen = false.obs;

  // RxList<PackageModel> packagesList = <PackageModel>[].obs;
  // RxList<SliderModel> sliderList = <SliderModel>[].obs;
  // RxList<OverViewModel> overviewList = <OverViewModel>[].obs;
  // RxList<BlogModel> blogList = <BlogModel>[].obs;
  // RxList<RateModel> rateList = <RateModel>[].obs;
  // RxList<BrandModel> brandList = <BrandModel>[].obs;
  // RxList<CurrencyModel> currencyList = <CurrencyModel>[].obs;
  RxString featuredImage = "".obs;
  RxBool isSell = false.obs;

  // List<PackageModel> get getPackages => packagesList.value;
  // List<SliderModel> get getSliders => sliderList.value;
  // List<OverViewModel> get getOverviews => overviewList.value;
  // List<BlogModel> get getBlogs => blogList.value;
  // List<RateModel> get getRates => rateList.value;
  // List<BrandModel> get getBrands => brandList.value;
  // List<CurrencyModel> get getCurrencies => currencyList.value;
  String get getFeaturedImage => featuredImage.value;
  bool get getSell => isSell.value;
  MenuItemEnum get getMenuItemEnum => menuItemEnum.value;

  @override

  void changeMenuItemActivity(MenuItemEnum itemEnum) {
    menuItemEnum.value = itemEnum;
  }

  void changeMenuOpenActivity() {
    isMenuOpen.value = !isMenuOpen.value;
    print(isMenuOpen.value);
  }

  // PackageModel getPackageWithId(String id) {
  //   return packagesList.value
  //       .firstWhere((element) => element.id.toString() == id);
  // }
  //
  // void getUpdatedPackages() async {
  //   packagesList.value = await database.getPackages();
  // }
  //
  // void getUpdatedBlogs() async {
  //   blogList.value = await database.getBlogs();
  // }
  //
  // void getUpdatedSliders() async {
  //   sliderList.value = await database.getSliders();
  // }
  //
  // void getUpdatedBrands() async {
  //   brandList.value = await database.getBrands();
  // }
  //
  // void getUpdatedOverviews() async {
  //   overviewList.value = await database.getOverviews();
  // }
  //
  // void getUpdatedRates() async {
  //   rateList.value = await database.getRates();
  // }
}
