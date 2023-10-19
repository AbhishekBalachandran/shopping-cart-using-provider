import 'package:flutter/material.dart';
import 'package:provider_task/model/models.dart';
import 'package:provider_task/utils/color_constant/color_constant.dart';

class ScrollingWidget extends StatelessWidget {
  const ScrollingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: scrollingItems.length,
      itemBuilder: (context, index) => index == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstant.primaryTextColor,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Text(
                      scrollingItems[index],
                      style: TextStyle(
                          color: ColorConstant.backgroundColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Text(
                      scrollingItems[index],
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
