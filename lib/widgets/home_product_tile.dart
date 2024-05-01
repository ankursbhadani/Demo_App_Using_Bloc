import 'package:flutter/material.dart';
import 'package:simple_app_usingbloc/bloc/home_bloc/home_screen_bloc.dart';

import '../model/product_model.dart';
class HomeProductCard extends StatelessWidget {
  final Product product;
  final HomeScreenBloc homeScreenBloc;

  const HomeProductCard({Key? key, required this.product,required this.homeScreenBloc}) : super(key: key);

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
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      homeScreenBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: product));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      homeScreenBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: product));
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