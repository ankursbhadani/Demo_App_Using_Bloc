


import 'package:flutter/material.dart';



import '../bloc/wishlist_bloc/wishlist_screen_bloc.dart';
import '../model/product_model.dart';

class WishlistTileWidget extends StatelessWidget {
  final Product product;
  final WishlistScreenBloc wishlistScreenBloc;
  const WishlistTileWidget({super.key,required this.product,required this.wishlistScreenBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
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
              title: Text(product.name,style: const TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.description),
                  Text('Price - \$${product.price}',style: const TextStyle(color: Colors.blue),),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                     // cartScreenBloc.add(CartRemoveFromCartEvent(product: product));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                       wishlistScreenBloc.add(ItemRemoveFromWishlistEvent(product: product));
                    },
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}