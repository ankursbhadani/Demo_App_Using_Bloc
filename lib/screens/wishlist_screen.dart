import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist_bloc/wishlist_screen_bloc.dart';
import '../widgets/wishlist_product_tile.dart';
class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    wishlistScreenBloc.add(WishlistInitialEvent());
    super.initState();
  }
  final WishlistScreenBloc wishlistScreenBloc = WishlistScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Items"),
        backgroundColor: ColorScheme.light().copyWith().secondary,
      ),
      body: BlocConsumer<WishlistScreenBloc, WishlistState>(
        bloc: wishlistScreenBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(itemCount: successState.wishlistItems.length,
                itemBuilder: (context, index) {
                  return WishlistTileWidget(product: successState.wishlistItems[index],
                      wishlistScreenBloc: wishlistScreenBloc);
                },);
            default:
          }
          return Container();
        },
      ),
    );
  }
}
