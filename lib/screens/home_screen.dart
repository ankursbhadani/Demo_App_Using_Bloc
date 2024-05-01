import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app_usingbloc/bloc/home_bloc/home_screen_bloc.dart';
import 'package:simple_app_usingbloc/data/product_list.dart';
import 'package:simple_app_usingbloc/model/product_model.dart';
import 'package:simple_app_usingbloc/screens/wishlist_screen.dart';
import 'package:simple_app_usingbloc/widgets/home_product_tile.dart';

import 'cart_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeScreenBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeScreenBloc homeScreenBloc = HomeScreenBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
        bloc: homeScreenBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          } else if (state is HomeNavigateToWishlistPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Wishlist()));
          } else if (state is HomeProductItemCartedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Item Carted'),
              duration: Duration(milliseconds: 1000),
            ));
          } else if (state is HomeProductItemWishlistedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Item Wishlisted'),
              duration: Duration(milliseconds: 1000),
            ));
          } else if (state is ItemAlreadyInCartActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item Already Carted'),
              duration: Duration(milliseconds: 1000),
            ));
          } else if (state is ItemAlreadyInWishlistActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item Already Wishlisted'),
              duration: Duration(milliseconds: 1000),
            ));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              ));
            case HomeLoadedSuccessState:
              final successState = state as HomeLoadedSuccessState;
              return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Grocery App",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: ColorScheme.light().copyWith().secondary,
                  actions: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              homeScreenBloc
                                  .add(HomeWishlistButtonNavigateEvent());
                            },
                            icon: Icon(Icons.favorite_border_outlined)),
                        IconButton(
                            onPressed: () {
                              homeScreenBloc.add(HomeCartButtonNavigateEvent());
                            },
                            icon: Icon(Icons.shopping_cart_outlined)),
                      ],
                    )
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return HomeProductCard(
                        product: successState.products[index],
                        homeScreenBloc: homeScreenBloc,
                      );
                    }),
              );
            case HomeErrorState:
              return Scaffold(body: Center(child: Text('Error')));
            default:
              return SizedBox();
          }
        });
  }
}
