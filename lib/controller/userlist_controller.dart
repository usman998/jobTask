
import 'package:cr_task/model/model.dart';
import 'package:cr_task/services/api.dart';
import 'package:get/get.dart';


class UserListController extends GetxController{


  RxString nullText = ''.obs;



  RxList<UserModel> orders = <UserModel>[].obs;


  getDetail()async{
    var apiData = await Api.getUsers();
    print(apiData.toString());
    // var apiData = await Api.ListOrders("24.88305", "67.05390");
    if (apiData!=null) {
      print(apiData.toString());
      orders.clear();
      if(apiData["data"].length>0){
        for(var i=0;i<apiData["data"].length;i++){
          orders.add(UserModel(
              id : int.parse(apiData["data"][i]["id"].toString()),
              email: apiData["data"][i]["email"].toString(),
              firstName: apiData["data"][i]["first_name"].toString(),
              lastName: apiData["data"][i]["last_name"].toString(),
              avatar: apiData["data"][i]["avatar"].toString()
          ));
        }
        print(orders.length.toString()+"this is the lenght of the list");
      } else{
        nullText.value = "no User Found";
      }
    } else{
      nullText.value = "Please Check Your Internet Connection";
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetail();
  }

}