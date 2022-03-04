import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_flutter/UI/my_profile_model.dart';
import 'home_model.dart';



class FoodListRepository {

  Future productsApi(String accesstoken) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');
    print(accesstoken.toString() + "   bn");
    final productListRes = await http.get(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/food/list'),
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
          'accessToken': accesstoken.toString()
        });
    if (productListRes.statusCode == 200) {
      print(" product list api hit? " + productListRes.body);
      FoodListModel foodListModel =
      FoodListModel.fromJson(jsonDecode(productListRes.body));
      print("sxcfvgbnjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      print("ProductList Body Response " + foodListModel.toString());
      return foodListModel;
    } else
      throw Exception("There is some error");
  }

  Future walletBalance(String accesstoken) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');
    final walletRes = await http.get(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/employee/getMyProfile'),
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
          'accessToken': accesstoken.toString()
        });
    if (walletRes.statusCode == 200) {
      print(" product list api hit? " + walletRes.body);
      GetMyProfileModel myProfileModel =
      GetMyProfileModel.fromJson(jsonDecode(walletRes.body));
      return myProfileModel;
    } else
      throw Exception("There is some error");
  }

  Future loadingPages(String accesstoken,num count, [num pageNo=1]) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');

    Map<String, dynamic> query = Map<String, dynamic>();
    query.putIfAbsent('count', () => count);
    query.putIfAbsent('pageNo', () => pageNo);

    // final uri = Uri.https('devhrmapi.mobcoder.com', '/hrm/api/v1/food/list', query);
    // print("${uri.toString()}   fghjkjhgfghjkhgfghjk");
    // final  productListRes  = await http.get(uri, headers: {
    //   'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
    //   'accessToken': accesstoken.toString()
    // });



    final productListRes = await http.get(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/food/list', ).replace(queryParameters: {
          'count': count.toString(),
          'pageNo': pageNo.toString(),
        }),
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
          'accessToken': accesstoken.toString()
        });


    if (productListRes.statusCode == 200) {
      print(" product list api hit? " + productListRes.body);
      print(" product list api hit? " + productListRes.statusCode.toString());
      FoodListModel foodListModel =
      FoodListModel.fromJson(jsonDecode(productListRes.body));
      print("ProductList Body Response " + foodListModel.toString());
      return foodListModel;
    } else
      throw Exception("There is some error");
  }





}
