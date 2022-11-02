import 'package:cr_task/view/user_list.dart';
import 'package:cr_task/widget/custom_button.dart';
import 'package:cr_task/widget/custom_checkbox.dart';
import 'package:cr_task/widget/custom_text_feild.dart';
import 'package:cr_task/widget/heading_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool emailCheck = false;
  bool obsecureCheck = true;
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.indigo,
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.7,
              maxChildSize: 0.8,
              minChildSize: 0.6,
              builder:(context,controller){
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      controller:controller,
                      child: Column(
                        children: [
                          SizedBox(height: _height*0.07,),
                          HeadingBar(
                            text: "Hosgeldini",
                            fontSize: 25,widgetAlign:Alignment.centerLeft,
                            textColor: Colors.indigo,leftPad: _width*0.1,fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: _height*0.005,),
                          HeadingBar(
                            text: "Lorem Ipsum is simply dummy",
                            fontSize: 12,widgetAlign:Alignment.centerLeft,
                            textColor: Colors.black45,leftPad: _width*0.1,fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: _height*0.05,),
                          CustomTextFeild(width: _width, onChange: (e){
                            if (GetUtils.isEmail(e)){
                              setState(() {
                                emailCheck = true;
                              });
                            }
                          },
                              labelText: "Email Address",
                              suffixWidget: GestureDetector(
                                onTap:(){},
                                child: Icon(Icons.check,color: emailCheck==false?Colors.white:Colors.indigo,),
                              ), obsecure: false),
                          SizedBox(height: _height*0.03,),
                          CustomTextFeild(width: _width, onChange: (e){},
                              labelText: "Password",
                              suffixWidget: GestureDetector(
                                onTap:(){
                                  if(obsecureCheck==false){
                                    setState(() {
                                      obsecureCheck=true;
                                    });
                                  } else{
                                    setState(() {
                                      obsecureCheck=false;
                                    });
                                  }
                                },
                                child: obsecureCheck==false?
                                Icon(CupertinoIcons.eye_slash,color: Colors.black45,):
                                Icon(Icons.remove_red_eye_outlined,color: Colors.black45,),
                              ), obsecure: obsecureCheck),
                          SizedBox(height: _height*0.015,),
                          Padding(
                            padding: EdgeInsets.only(left: _width*0.1,right: _width*0.08),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Custom_Checkbox(
                                      size: 19,
                                      onChange: (){
                                        if(checkBox==false){
                                          setState(() {
                                            checkBox=true;
                                          });
                                        } else{
                                          setState(() {
                                            checkBox=false;
                                          });
                                        }
                                      },
                                      isChecked: checkBox,
                                      backgroundColor: Colors.white,
                                      iconColor:Colors.indigo,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                        "Bani Hatria",style: TextStyle(
                                      color: Colors.black38
                                    ),
                                    )
                                  ],
                                ),
                                Text(
                                    "Lorem Ipsum",style: TextStyle(
                                    color: Colors.black38
                                )
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: _height*0.05,),
                          CustomButton(buttonHeight: _height*0.06, buttonWidth: _width*0.5, btnColor: Colors.indigo, shadowColor: Colors.indigo.shade300,
                              onPress: (){Get.to(()=>const UserList());}, mainWidget: Text(
                            "GiRiS YAP",style: TextStyle(
                              color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400
                          ),
                          )),
                          SizedBox(height: _height*0.04,),
                          HeadingBar(
                            text: "Or Login With",
                            fontSize: 16,widgetAlign:Alignment.center,
                            textColor: Colors.black45,fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: _height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(buttonHeight: _height*0.043, buttonWidth: _width*0.15, btnColor: Color(0xff3b5998), shadowColor: Colors.white, onPress: (){}, mainWidget: FaIcon(FontAwesomeIcons.facebookF,color:Colors.white ,)),
                              SizedBox(width: 10,),
                              CustomButton(buttonHeight: _height*0.043, buttonWidth: _width*0.15, btnColor: Colors.lightBlueAccent, shadowColor: Colors.white, onPress: (){}, mainWidget: FaIcon(FontAwesomeIcons.twitter,color:Colors.white ,)),
                              SizedBox(width: 10,),
                              CustomButton(buttonHeight: _height*0.043, buttonWidth: _width*0.15, btnColor: Colors.deepOrange, shadowColor: Colors.white, onPress: (){}, mainWidget: FaIcon(FontAwesomeIcons.googlePlusG,color:Colors.white ,))
                          ],)
                        ],
                      ),
                    ),
                  ),
                );
              } )
        ],
      ),
    );
  }

}





