import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:get/get.dart';
import 'package:hzmarket/config/styles_manager.dart';

import 'package:hzmarket/custom_text_input.dart';
import 'package:hzmarket/features/home/presentation/widgets/profile_top.dart';
import 'package:hzmarket/generated/l10n.dart';  // Import the generated localization file
import 'package:hzmarket/config/color_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:profile_photo/profile_photo.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:() => Get.back(), icon: Icon(Iconsax.arrow_left)),
        title: Text("Edit profile info", style: TextStyle(fontFamily: "inter bold"),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       
        children: [
          Center(
            child: Column(
              children: [
                ProfilePhoto(
                            onTap: () {},
                            totalWidth: width*0.2,
                            cornerRadius: 80,
                            color: Colors.blue,
                            image: const AssetImage('assets/images/pro.png'),
                          ),

                          TextButton(onPressed: null, child: Text("chnage you profile picture"))
              ],
            ),
          ),
          const Divider(
            color: ColorManager.lightGrey,
            
            thickness: 3,
            indent: BorderSide.strokeAlignCenter,
          ),
          SizedBox(height: height*0.02,),
          Text("Profile information" , style: TextStyle(fontSize: 17,fontFamily: "inter bold"),), 
            SizedBox(height: height*0.02,),
         
  
        Profile_change(
                label: "Name",
                value: "houssam zitoune",
                onPressed: () {
                  // Handle name change action
                },
              ),
              Profile_change(
                label: "Email",
                value: "example@example.com",
                onPressed: () {
                  // Handle email change action
                },
              ),
                Profile_change(
                label: "Password",
                value: "********",
                onPressed: () {
                  // Handle phone number change action
                },
              ),
            
              const Divider(
                color: ColorManager.lightGrey,
                thickness: 3,
                indent: BorderSide.strokeAlignCenter,
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Personal information",
                style: TextStyle(fontSize: 17, fontFamily: "inter bold"),
              ),
              SizedBox(height: height * 0.02),
                Profile_change(
                label: "Phone number",
                value: "+123 456 7890",
                onPressed: () {
                  // Handle phone number change action
                },
              ),
              Profile_change(
                label: "Address",
                value: "123 Main Street, City",
                onPressed: () {
                  // Handle address change action
                },
              ),
              Profile_change(
                label: "Date of Birth",
                value: "01/01/1990",
                onPressed: () {
                  // Handle date of birth change action
                },
              ),
              Profile_change(
                label: "Gender",
                value: "Male",
                onPressed: () {
                  // Handle gender change action
                },
              ),

          
        ],

      ),
      ),

      ),
    );
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }
}

class Profile_change extends StatelessWidget {
   Profile_change({

    required this.label,
    required this.value,
    required  this.onPressed,
    


    super.key,
  });
 VoidCallback onPressed;
  String label, value ; 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(label,style: Theme.of(context).textTheme.bodySmall),),
        Expanded(flex: 5, child: Text(value,style: Theme.of(context).textTheme.bodyMedium),),
        Expanded( child: IconButton(icon :Icon( Iconsax.arrow_right_34), onPressed: onPressed,),),
    
      ],
    );
  }
}
