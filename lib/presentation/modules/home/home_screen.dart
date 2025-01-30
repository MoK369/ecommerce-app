import 'package:ecommerce/di.dart';
import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/categories_page.dart';
import 'package:ecommerce/presentation/modules/home/pages/favorite_page/favorite_page.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/home_page.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/manager/brands_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/profile_page/profile_page.dart';
import 'package:ecommerce/presentation/modules/home/widgets/bottom_bar_icon.dart';
import 'package:ecommerce/presentation/modules/home/widgets/home_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final AuthenticationDataModel signInData;
  const HomeScreen({super.key,required this.signInData});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBarItem = 0;
  PageController pageController = PageController(initialPage: 0);
  CategoriesViewModel categoriesViewModel = getIt.get<CategoriesViewModel>();
  BrandsViewModel brandsViewModel = getIt.get<BrandsViewModel>();
  DateTime? lastPressed;

  @override
  void initState() {
    super.initState();
    loadHomeScreenData();
  }
  void loadHomeScreenData(){
    categoriesViewModel.loadCategories();
    brandsViewModel.loadBrands();
  }
  final List<Widget> pages = [
    HomePage(),
    CategoriesPage(),
    FavoritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        DateTime now = DateTime.now();
        bool isWarning = (lastPressed == null) ||
            (now.difference(lastPressed!) > const Duration(seconds: 2));
        if (isWarning) {
          lastPressed = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Press back again to exit"),
            margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            duration: Duration(seconds: 2),
          ));
          return;
        }
        SystemNavigator.pop();
        lastPressed = null;
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => categoriesViewModel,
          ),
          BlocProvider(
            create: (context) => brandsViewModel,
          ),
        ],
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: selectedBarItem == 3 ? null : const HomeScreenAppBar(),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: BottomNavigationBar(
                  currentIndex: selectedBarItem,
                  onTap: (value) {
                    setState(() {
                      selectedBarItem = value;
                      pageController.jumpToPage(selectedBarItem);
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: BottomBarIcon(
                            isIconSelected: selectedBarItem == 0,
                            iconPath: "assets/icons/home_icon.png"),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: BottomBarIcon(
                            isIconSelected: selectedBarItem == 1,
                            iconPath: "assets/icons/categories_icon.png"),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: BottomBarIcon(
                            isIconSelected: selectedBarItem == 2,
                            iconPath: "assets/icons/heart_icon.png"),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: BottomBarIcon(
                            isIconSelected: selectedBarItem == 3,
                            iconPath: "assets/icons/profile_icon.png"),
                        label: ""),
                  ]),
            ),
            body: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  selectedBarItem = value;
                });
              },
              children: pages,
            ),
          ),
        ),
      ),
    );
  }
}
