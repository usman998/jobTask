import 'package:cr_task/controller/userlist_controller.dart';
import 'package:cr_task/widget/list_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  final UserListController orderController = Get.put(UserListController());

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrange,
        centerTitle: false,
        title:const  Text("News Agregator",style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body: (Obx(()=>orderController.isLoading==false?Container(
        width: _width,height: _height,child: Center(child: CircularProgressIndicator(),),
      ):orderController.orders.length==0?Container(
          width: _width,height: _height,child:Center(child: Text(orderController.nullText.value.toString()))
      ):SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index)=>ListBox(height: _height, index: index, name: orderController.orders[index].firstName.toString()+ " " +
                        orderController.orders[index].lastName.toString(), email: orderController.orders[index].email.toString(), avatarName: orderController.orders[index].avatar.toString()),
                separatorBuilder: (context,index)=>Container(),
                itemCount: orderController.orders.length)
          ],
        ),
      ))),
    );
  }
}



