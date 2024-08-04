import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeBannerLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
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
            ),
          );
        },
      ),
    );
  }
}
