import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app_usingbloc/bloc/cart_bloc/cart_screen_bloc.dart';
import 'package:simple_app_usingbloc/widgets/cart_product_tile.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartScreenBloc cartScreenBloc = CartScreenBloc();

  @override
  void initState() {
    cartScreenBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items In Your Cart"),
        backgroundColor: ColorScheme.light().copyWith().secondary,
      ),
      body: BlocConsumer<CartScreenBloc, CartState>(
        bloc: cartScreenBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is ItemRemoveFromCartState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item Removed from Cart'),
              duration: Duration(milliseconds: 1000),
            ));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                      product: successState.cartItems[index],
                      cartScreenBloc: cartScreenBloc);
                },
              );
            default:
          }
          return Container();
        },
      ),
    );
  }
}
