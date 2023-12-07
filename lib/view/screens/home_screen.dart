import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/controller/news_controller.dart';
import 'package:news_app_getx/view/widgets/category_widget.dart';
import 'package:news_app_getx/view/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  //HomeScreen({super.key});

  final controller = Get.put(NewsController());
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(AlertDialog(
          title: Text("Closing the App"),
          content: Text("Are you sure ?"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.back(result: true);
                },
                child: Text("Yes")),
            ElevatedButton(onPressed: () {}, child: Text("No"))
          ],
        ));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Getx News App",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.changeTheme();
                },
                icon: Icon(controller.iconTheme()))
          ],
        ),
        body: PageView(

          onPageChanged: (index) {
            controller.changeNavBar(currentIndex: index);
            print(index);
            
          },

          controller: pageController,

          children: [HomeWidget(), CategoryWidget()],

        ),
        bottomNavigationBar: GetBuilder<NewsController>(builder: (controller) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.index,
              onTap: (index) {
                controller.changeNavBar(currentIndex: index);
                print(index);

                pageController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_max_outlined),
                    activeIcon: Icon(Icons.home_max, color: Colors.red),
                    tooltip: "Home",
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    activeIcon: Icon(
                      Icons.category,
                      color: Colors.blue,
                    ),
                    tooltip: "Category",
                    label: "Category"),
              ]);
        }),
      ),
    );
  }
}
