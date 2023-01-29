import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:human_benchmark_flutter_v2/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class HomePageLoadingWidget extends StatefulWidget {
  const HomePageLoadingWidget({super.key});

  @override
  State<HomePageLoadingWidget> createState() => _HomePageLoadingWidgetState();
}

class _HomePageLoadingWidgetState extends State<HomePageLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return loadingWidget();
  }

  Widget loadingWidget() {
    return Shimmer.fromColors(
      // ignore: sort_child_properties_last
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20.sp),
                          artistWidgetShimmer,
                          SizedBox(height: 20.sp),
                          artistWidgetShimmer,
                          SizedBox(height: 20.sp),
                          artistWidgetShimmer,
                          SizedBox(height: 20.sp),
                          artistWidgetShimmer,
                          SizedBox(height: 20.sp),
                          artistWidgetShimmer,
                          SizedBox(height: 20.sp),
                          artistWidgetShimmer,
                          SizedBox(height: 20.sp),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      baseColor: Color.fromARGB(255, 221, 221, 223),
      highlightColor: Color.fromARGB(255, 208, 208, 211),
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 1),
    );
  }

  Widget get artistWidgetShimmer => ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: Container(
          width: 358.w,
          height: 100.w,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: context.isIpad ? 10.h : 30.h,
            ),
          ),
        ),
      );
}
