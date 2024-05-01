import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app_usingbloc/bloc/cart_bloc/cart_screen_bloc.dart';
import 'package:simple_app_usingbloc/model/product_model.dart';

class CartTileWidget extends StatelessWidget {
  final Product product;
  final CartScreenBloc cartScreenBloc;

  const CartTileWidget(
      {super.key, required this.product, required this.cartScreenBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Dismissible(
        key: Key(product.id),
        onDismissed: (direction) =>
            cartScreenBloc.add(CartRemoveFromCartEvent(product: product)),
        child: Card(
          elevation: 8,
          child: Column(
            children: [
              Image.network(
                product.imageUrl,
                width: double.maxFinite,
                height: 200,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.description),
                    Text(
                      'Price - \$${product.price}',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        cartScreenBloc
                            .add(CartRemoveFromCartEvent(product: product));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        // homeScreenBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: product));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
