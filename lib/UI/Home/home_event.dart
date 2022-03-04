
import 'package:vendor_flutter/UI/my_profile_model.dart';

import 'home_model.dart';

abstract class HomeEvent {}

class OnHomeApiHit extends HomeEvent {
  FoodListModel foodListModel;
  OnHomeApiHit(this.foodListModel);
}


class OnHomePaginationApiHit extends HomeEvent {
  FoodListModel foodListModel;
  OnHomePaginationApiHit(this.foodListModel);
}

class OnDrawerClick extends HomeEvent{
 GetMyProfileModel getMyProfileModel;
  OnDrawerClick(this.getMyProfileModel);
}

