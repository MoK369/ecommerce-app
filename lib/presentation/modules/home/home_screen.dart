import 'package:ecommerce/di.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/categories_page.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/categories_page_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/catgories_page_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/favorite_page/favorite_page.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/home_page.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/manager/brands_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/profile_page/profile_page.dart';
import 'package:ecommerce/presentation/modules/home/widgets/bottom_bar_icon.dart';
import 'package:ecommerce/presentation/modules/home/widgets/home_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBarItem = 0;
  PageController pageController = PageController(initialPage: 0);
  CategoriesViewModel categoriesViewModel = getIt.get<CategoriesViewModel>();
  BrandsViewModel brandsViewModel = getIt.get<BrandsViewModel>();
  CategoriesPageViewModel categoriesPageViewModel =
      getIt.get<CategoriesPageViewModel>();

  @override
  void initState() {
    super.initState();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => categoriesViewModel,
        ),
        BlocProvider(
          create: (context) => brandsViewModel,
        ),
        BlocProvider(
          create: (context) => categoriesPageViewModel,
        )
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
                    if (categoriesPageViewModel.state
                        is OnCategoriesProductsState) {
                      categoriesPageViewModel
                          .changeState(OnCategoriesListState());
                    }
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
                if (categoriesPageViewModel.state
                    is OnCategoriesProductsState) {
                  categoriesPageViewModel.changeState(OnCategoriesListState());
                }
                selectedBarItem = value;
              });
            },
            children: pages,
          ),
        ),
      ),
    );
  }
}
