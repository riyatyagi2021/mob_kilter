import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/UI/Food/Delete/delete_model.dart';
import 'package:vendor_flutter/UI/Food/Delete/delete_repo.dart';


class DeletePopup {
  final BuildContext context;
  final String? idFood;

  DeletePopup({
    required this.context,  this.idFood,
  });

  @override
  Future show() => showDialog(
        barrierDismissible:false ,
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              height: 350,
              width: 300,
              child: Stack(

                children: [
                  Container(
                    height: 150,
                    width: 300,
                    decoration:BoxDecoration(
                        color: COLOR.LightPink,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:Radius.circular(15) )
                    ),
                    padding: EdgeInsets.only(right: 10,top: 10),
                    child:Align(
                      alignment: Alignment.topRight,
                      child:GestureDetector(
                        onTap: ()=>Navigator.pop(context),
                        child: Image.asset('assets/images/ic_cross_c.png',height: 20,width: 20,color: COLOR.Maroon,),
                      ) ,
                    ),
                  ),
                  Positioned(
                      top: 80,
                      right: 0,
                      left: 0,
                      child: Image.asset('assets/images/ic_remove_food.png',height: 100,width: 100,)),
                  Positioned(
                    top: 200,
                    right: 50,
                    left: 50,
                    child: Text("   Are you sure you want \nto discard this food item!",style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: COLOR.Black
                    ),),
                  ),
                  Positioned(
                      bottom: 30,
                      right: 60,
                      left: 60,
                      child: SizedBox(
                        // margin: EdgeInsets.symmetric(horizontal: 60),
                        height: 45,
                        width: 200,
                        child: ElevatedButton(
                          child: Text("Yes",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: COLOR.White
                          ),),
                          onPressed: () async{
                            //loader on
                            DeleteFoodModel success=await deleteFood(idFood!);
                            if(success.statusCode==1){
                              Navigator.pop(context);

                              //loader off
                            }else{
                              //loadroff
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            primary: COLOR.Maroon,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      ))

                ],
              ),
            ),
          );
        },
      );

  DeleteRepository deleteRepository=DeleteRepository();
  DeleteFoodModel deleteFoodModel=DeleteFoodModel();
  Future <DeleteFoodModel> deleteFood(String idFood) async {
    deleteFoodModel = await deleteRepository.deleteApi("",idFood);

    if(deleteFoodModel.statusCode==1){

      return deleteFoodModel;

    }else{
      Fluttertoast.showToast(msg: "There is some problem in deletinng it");
      return deleteFoodModel;

    }

    print('${deleteFoodModel.requestParams?.foodId} Deeeleeted itemmmmmmmmmmm  idddd');
    print('${deleteFoodModel.statusCode} Deeeleeted itemmmmmmmmmmm  idddd');
  }
}





/*
class DeletePopUp extends StatefulWidget {
  final String? foodId;

  const DeletePopUp({Key? key, this.foodId}) : super(key: key);


  @override
  DeletePopUpState createState() => DeletePopUpState(foodId);
}

class DeletePopUpState extends State<DeletePopUp> {

  DeletePopUpState(String? foodId);


  void showDialogBox(BuildContext context) {
    var idFood=widget.foodId;

    showDialog(
      barrierDismissible:false ,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            height: 350,
            width: 300,
            child: Stack(

              children: [
                Container(
                  height: 150,
                  width: 300,
                  decoration:BoxDecoration(
                      color: COLOR.LightPink,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:Radius.circular(15) )
                  ),
                  padding: EdgeInsets.only(right: 10,top: 10),
                  child:Align(
                    alignment: Alignment.topRight,
                    child:GestureDetector(
                      onTap: ()=>Navigator.pop(context),
                      child: Image.asset('assets/images/ic_cross_c.png',height: 20,width: 20,color: COLOR.Maroon,),
                    ) ,
                  ),
                ),
                Positioned(
                  top: 80,
                    right: 0,
                    left: 0,
                    child: Image.asset('assets/images/ic_remove_food.png',height: 100,width: 100,)),
                Positioned(
                  top: 200,
                  right: 50,
                  left: 50,
                  child: Text("   Are you sure you want \nto discard this food item!",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: COLOR.Black
                  ),),
                ),
                Positioned(
                  bottom: 30,
                    right: 60,
                    left: 60,
                    child: SizedBox(
                     // margin: EdgeInsets.symmetric(horizontal: 60),
                      height: 45,
                      width: 200,
                      child: ElevatedButton(
                        child: Text("Yes",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: COLOR.White
                        ),),
                        onPressed: () {
                          deleteFood(idFood!);

                        },
                        style: ElevatedButton.styleFrom(
                          primary: COLOR.Maroon,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ))

              ],
            ),
          ),
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

