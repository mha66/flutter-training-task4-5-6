import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task4/cubit/app_cubit.dart';
import '../../data/models/product_data.dart';

class FavouritesDrawer extends StatelessWidget {
  const FavouritesDrawer({super.key, required this.favouriteList});

  final List<Product> favouriteList;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<AppCubitA, AppStateA>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Favourites',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              const SizedBox(height: 20),
              state is ProductsLoadingState
                  ? const Text('Loading....')
                  : favouriteList.isEmpty
                      ? const Text('No favourites')
                      : Expanded(
                          child: ListView.builder(
                              itemCount: favouriteList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return FavouriteItem(
                                    item: favouriteList[index]);
                              }),
                        )
            ],
          );
        },
      ),
    ));
  }
}

class FavouriteItem extends StatelessWidget {
  final Product item;

  const FavouriteItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\u2022 ${item.title}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$${item.price.toString()}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
