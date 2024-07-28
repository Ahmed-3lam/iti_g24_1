import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_g24_1/dummy_projects/image_viewer/cubit/image_viewer_cubit.dart';

class ImageViewerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ImageViewerCubit>();

    return BlocBuilder<ImageViewerCubit, ImageViewerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
          ),
          body: cubit.screenItems[cubit.index],
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < cubit.iconItems.length; i++)
                  _buildNavItem(i, cubit),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(int i, ImageViewerCubit cubit) {
    return InkWell(
      onTap: () {
        cubit.changeNav(i);
      },
      child: Icon(
        cubit.iconItems[i],
        color: cubit.index == i ? Colors.blue : Colors.white,
        size: 40,
      ),
    );
  }
}
