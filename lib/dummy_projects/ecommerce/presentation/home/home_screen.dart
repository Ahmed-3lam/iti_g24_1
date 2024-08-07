import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/home/cubit/home_cubit.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/home/model/ProductsModel.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(cubit),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.popular_products,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.view_all,
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final products = cubit.productsModel.data?.data;
                  if (state is HomeProductsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox(
                    height: 220,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          _productItem(products![index]),
                      itemCount: _count(products),
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                },
              ),
              Row(
                children: [
                  const Text(
                    "New Products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final products = cubit.productsModel.data?.data;
                  if (state is HomeProductsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox(
                    height: 220,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          _productItem(products![index]),
                      itemCount: _count(products),
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  int? _count(List<ProductsData>? products) {
    if (products == null) {
      return 0;
    } else if (products.length > 5) {
      return 5;
    } else {
      return products.length;
    }
  }

  Widget _productItem(ProductsData product) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(.2), width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image.network(
            product.image ?? "",
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  product.name ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 150,
                height: 20,
                child: Text(
                  product.description ?? "",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "\$ ${product.price}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "\$ ${product.oldPrice}",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 12,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _banner(HomeCubit cubit) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeBannerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 10,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                6,
                7,
                8,
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: 180,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          cubit.bannerModel.data?[i].image ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green.withOpacity(.2)),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
