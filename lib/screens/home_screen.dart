import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../core/app_color.dart';
import '../core/bottom_sheet.dart';
import '../core/user_card.dart';
import '../core/user_model.dart';

class HomeScreen extends StatefulWidget {
  final String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> user = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      appBar: AppBar(
        title: SizedBox(
          width: 120,
          height: 40,
          child: Image.asset("assets/images/logo.png"),
        ),
        backgroundColor: AppColor.darkBlue,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: user.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 370,
                        height: 370,
                        child: Lottie.asset('assets/images/empty_list.json'),
                      ),
                      Text(
                        'There is No Contacts Added Here',
                        style: TextStyle(
                          color: AppColor.gold,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                : GridView.builder(
                    itemCount: user.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 170 / 285,
                    ),
                    itemBuilder: (context, index) {
                      return UserCard(
                        user: user[index],
                        onTap: () => setState(() => user.removeAt(index)),
                      );
                    },
                  ),
          ),

          if (user.isNotEmpty)
            Positioned(
              bottom: 100,
              right: 25,
              child: FloatingActionButton(
                onPressed: () {
                  user.removeLast();
                  setState(() {});
                },
                backgroundColor: AppColor.red,
                child: Icon(Icons.delete, color: AppColor.white),
              ),
            ),
          if (user.length < 6)
            Positioned(
              bottom: 30,
              right: 25,
              child: FloatingActionButton(
                onPressed: () async {
                  final user = await showModalBottomSheet<UserModel>(
                    context: context,
                    backgroundColor: AppColor.darkBlue,
                    isScrollControlled: true,
                    builder: (context) {
                      return AddBottomSheet();
                    },
                  );
                  if (user != null) {
                    setState(() {
                      this.user.add(user);
                    });
                  }
                },
                backgroundColor: AppColor.gold,
                child: Icon(Icons.add, color: AppColor.darkBlue),
              ),
            ),
        ],
      ),
    );
  }
}
