
import 'package:cr_task/model/model.dart';
import 'package:cr_task/services/api.dart';
import 'package:get/get.dart';


class UserListController extends GetxController{


  RxBool isLoading = false.obs;
  RxString nullText = ''.obs;



  RxList<UserModel> orders = <UserModel>[].obs;
  // var orders = <UserModel>[].obs;


  getDetail()async{
    var apiData = await Api.getUsers();
    if (apiData!=null) {
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
      } else{
        nullText.value = "no User Found";
      }
      isLoading.value = true;
    } else{
      isLoading.value = true;
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