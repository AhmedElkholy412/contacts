import 'dart:io';
import 'package:contact/core/text_display.dart';
import 'package:contact/core/text_form_field.dart';
import 'package:contact/core/user_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';
import 'app_color.dart';

class AddBottomSheet extends StatefulWidget {
  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  File? image;

  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
      setState(() {});
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.darkBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    spacing: 12,
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.gold, width: 1),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          height: 150,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(27),
                            child: image == null
                                ? Lottie.asset(
                                    'assets/images/image_picker.json',
                                  )
                                : Image.file(image!, fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDisplay(
                              text: nameController.text == ''
                                  ? 'User Name'
                                  : nameController.text,
                            ),
                            Container(color: AppColor.gold, height: 1),
                            TextDisplay(
                              text: emailController.text == ''
                                  ? 'example@gmail.com'
                                  : emailController.text,
                            ),
                            Container(color: AppColor.gold, height: 1),
                            TextDisplay(
                              text: phoneController.text == ''
                                  ? '+200000000000'
                                  : phoneController.text,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AddTextFormField(
                    text: 'Enter User Name',
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() {}),
                  ),
                  AddTextFormField(
                    text: 'Enter Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      final isEmail = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                      ).hasMatch(value);
                      if (!isEmail) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() {}),
                  ),
                  AddTextFormField(
                    text: 'Enter Phone Number',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      final isPhone = RegExp(
                        r'^01[0125][0-9]{8}$',
                      ).hasMatch(value);
                      if (!isPhone) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() {}),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pop(
                          context,
                          UserModel(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            image: image,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: AppColor.gold,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Enter User',
                      style: TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
