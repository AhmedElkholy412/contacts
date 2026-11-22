import 'package:contact/core/user_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'app_color.dart';

class UserCard extends StatelessWidget {
  UserModel user;
  VoidCallback onTap;

  UserCard({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      width: 170,
      decoration: BoxDecoration(
        color: AppColor.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 1,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 160,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: user.image == null
                      ? Image.asset(
                          'assets/images/profile3.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : Image.file(
                          user.image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColor.gold,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      user.name,
                      style: TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                spacing: 5,
                children: [
                  Icon(Icons.email, color: AppColor.darkBlue),
                  Expanded(
                    child: Text(
                      user.email,
                      style: TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                spacing: 5,
                children: [
                  Icon(Icons.phone_in_talk, color: AppColor.darkBlue),
                  Expanded(
                    child: Text(
                      user.phone,
                      style: TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8, left: 8),
              child: ElevatedButton(
                onPressed: () {
                  onTap();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 31),
                  backgroundColor: AppColor.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: AppColor.white),
                    Text(
                      'Remove',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
