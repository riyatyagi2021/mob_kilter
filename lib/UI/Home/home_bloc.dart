import 'package:vendor_flutter/BaseBloc/base_bloc.dart';
import 'package:vendor_flutter/UI/Auth/login_model.dart';
import 'package:vendor_flutter/UI/my_profile_model.dart';
import 'package:vendor_flutter/Utils/preference_utils.dart';

import 'home_event.dart';
import 'home_model.dart';
import 'home_repository.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.onInit());

  PreferenceUtils preferenceUtils = PreferenceUtils();
  LoginModel loginModel = LoginModel();
  GetMyProfileModel getMyProfile = GetMyProfileModel();
  FoodListModel foodListModel = FoodListModel();
  FoodListRepository foodListRepository = FoodListRepository();
  List<FoodItemList> foodItems = [];

  @override
  void init() {
    super.init();
    //onHomeApi();
    onPagination(1);
    onMyProfileApi();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OnHomeApiHit) {
      if (event.foodListModel.statusCode == 1) {
        yield HomeState.onHomeSuccess(true, false, foodListRepository,
            event.foodListModel, preferenceUtils, loginModel, getMyProfile);
      } else {
        yield HomeState.onHomeFailure(false, true, foodListRepository,
            state.model, preferenceUtils, loginModel, getMyProfile);
      }
    }

    else if (event is OnDrawerClick) {
      if (event.getMyProfileModel.statusCode == 1) {
        print(
            "${event.getMyProfileModel.statusCode.toString()} profile status code");
        yield HomeState.onHomeSuccess(
            true,
            false,
            foodListRepository,
            foodListModel,
            preferenceUtils,
            loginModel,
            event.getMyProfileModel);
      } else {
        yield HomeState.onHomeFailure(
            false,
            true,
            foodListRepository,
            foodListModel,
            preferenceUtils,
            loginModel,
            event.getMyProfileModel);
      }
    }

    else if (event is OnHomePaginationApiHit) {
      if (event.foodListModel.statusCode == 1) {
        var oldFoodModel = state.model;
        oldFoodModel.responseData?.foodItemList
            ?.addAll(event.foodListModel.responseData?.foodItemList ?? []);
        yield HomeState.onHomeSuccess(true, false, foodListRepository,
            oldFoodModel, preferenceUtils, loginModel, getMyProfile);
      } else {
        yield HomeState.onHomeFailure(false, true, foodListRepository,
            state.model, preferenceUtils, loginModel, getMyProfile);
      }
    }

  }

  ///without pagination- food list data
  void onHomeApi() async {
    try {
      // Future.delayed(Duration(seconds: 2));
      foodListModel = await foodListRepository.productsApi("");
      print("ProductList Resp value" + foodListModel.toString());
      add(OnHomeApiHit(foodListModel));
    } catch (e) {
      print(e.toString() + "There is something wrong......");
    }
  }

  void onPagination(num pageNo, [num count = 6]) async {
    try {
      foodListModel = await foodListRepository.loadingPages("", count, pageNo);
      print("ProductList Resp value" + foodListModel.toString());

      if (pageNo == 1) {
        add(OnHomeApiHit(foodListModel));
      } else {
        add(OnHomePaginationApiHit(foodListModel));
      }

    } catch (e) {
      print(e.toString() + "There is something wrong......");
    }
  }

  void onMyProfileApi() async {
    try {
      getMyProfile = await foodListRepository.walletBalance("");
      print("ProductList Resp value" + getMyProfile.toString());
      add(OnDrawerClick(getMyProfile));
    } catch (e) {
      print(e.toString() + "There is something wrong......");
    }
  }
}
