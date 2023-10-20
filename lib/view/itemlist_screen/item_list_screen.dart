import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/model/models.dart';
import 'package:provider_task/provider/provider.dart';
import 'package:provider_task/utils/color_constant/color_constant.dart';
import 'package:provider_task/view/detail_screen/detail_screen.dart';
import 'package:provider_task/view/itemlist_screen/widgets/scrolling_widget/scrolling_widget.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.backgroundColor,
        title: Text(
          'Discover',
          style: TextStyle(
              color: ColorConstant.primaryTextColor,
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          Stack(
            children: [
              Center(
                  child: Icon(
                Icons.notifications_outlined,
                color: ColorConstant.primaryTextColor,
                size: 30,
              )),
              Positioned(
                top: 10,
                right: 4,
                child: CircleAvatar(
                  backgroundColor: ColorConstant.primaryTextColor,
                  radius: 7,
                  child: Center(child: Text('1')),
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: width * 0.75,
                  decoration: BoxDecoration(
                      color: ColorConstant.textFieldBg,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.search_outlined,
                      color: ColorConstant.primaryTextColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search anything',
                      style: TextStyle(
                          color: Color.fromARGB(255, 103, 103, 103),
                          fontSize: 15),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  height: 50,
                  width: width * 0.15,
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryTextColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Icon(
                    Icons.sort,
                    color: ColorConstant.backgroundColor,
                  )),
                ),
              )
            ],
          ),
          Container(
            height: 50,
            child: ScrollingWidget(),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 250),
              itemBuilder: (context, index) {
                // Provider.of<ShoppingAppProvider>(context, listen: false)
                //     .isSavedContains;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(itemIndex: index),
                          ));
                    },
                    child: Container(
                      height: 400,
                      width: 100,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 170,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorConstant.textFieldBg,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(items[index]['image']),
                                    fit: BoxFit.fill),
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color:
                                                ColorConstant.backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              Provider.of<ShoppingAppProvider>(
                                                      context,
                                                      listen: false)
                                                  .onTapSave(index);
                                              const snackBar = SnackBar(
                                                content: Text(
                                                    'Item saved successfully.'),
                                                backgroundColor: Colors.black,
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                            icon: Icon(
                                              Provider.of<ShoppingAppProvider>(
                                                              context)
                                                          .isSaved ==
                                                      true
                                                  ? Icons.favorite
                                                  : Icons.favorite_outline,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: Text(
                                items[index]['name'],
                                maxLines: 1,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: Text('Price : ${items[index]['price']}'),
                            )
                          ]),
                    ),
                  ),
                );
              })
        ]),
      ),
    );
  }
}
