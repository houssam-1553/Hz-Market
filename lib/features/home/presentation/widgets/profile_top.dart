import 'package:flutter/material.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/core/enums/response_state.dart';
import 'package:hzmarket/features/auth/presentation/providers.dart';
import 'package:hzmarket/features/auth/presentation/screens/login_screen.dart';

import 'package:hzmarket/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ProfileTop extends StatefulWidget {
  const ProfileTop({Key? key}) : super(key: key);

  @override
  _ProfileTopState createState() => _ProfileTopState();
}

class _ProfileTopState extends State<ProfileTop> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _pickedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Stack(
    
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          height: height*0.2,
          decoration: BoxDecoration(
            color: ColorManager.lightPrimary, // Change to your desired color
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: 5, top: 10),
            child: Column(
              
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   
                    Text(S.of(context).logout,
                        style: const TextStyle(
                            color: ColorManager.blacker,
                            fontFamily: 'Freeman',
                            fontSize: 14)),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                        // Add logout functionality here
                        Provider.of<AuthProvider>(context, listen: false)
                            .informationVerification
                            .status = Status.init;
                      },
                      icon: Icon(Icons.logout),
                      color: Colors.red,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(S.of(context).editPhoto,
                        style: const TextStyle(
                            color: ColorManager.blacker,
                            fontFamily: 'Freeman',
                            fontSize: 14)),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(S.of(context).uploadImage),
                              content: Text(S.of(context).selectImage),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _pickImage();
                                  },
                                  child: Text(S.of(context).selectImage),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(S.of(context).cancel),
                                ),
                                  
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit),
                      color: ColorManager.blacker,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: width*0.3,
            height: height*0.2,
            child: Stack(
              fit: StackFit.expand,
              children: [
              
              ],
            ),
          ),
        ),
      ],
    );
  }
}
