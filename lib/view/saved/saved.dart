import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/model/models.dart';
import 'package:provider_task/provider/provider.dart';
import 'package:provider_task/utils/color_constant/color_constant.dart';
import 'package:provider_task/utils/textstyle_constants/textstyle_constants.dart';
import 'package:provider_task/view/detail_screen/detail_screen.dart';

class Saved extends StatelessWidget {
  final int? itemIndex;
  const Saved({super.key,  this.itemIndex});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoppingAppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.backgroundColor,
        title: Text('Saved', style: TextStyleConstants.appbarHeaderStyle),
        centerTitle: true,
      ),
      body: provider.savedItems.isEmpty
          ? Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                      'You haven\'t saved any items.\n Why not add some items')),
            )
          : GridView.builder(
              itemCount: provider.savedItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 250),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(itemIndex: itemIndex ?? 0),
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
                              image: DecorationImage(
                                  image: AssetImage(items[provider
                                      .savedItems[index].itemIndex]['image']),
                                  fit: BoxFit.fill),
                            ),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        provider.removeSaved(index);
                                         const snackBar = SnackBar(
                                                  content: Text(
                                                      'Item removed from saved successfully.'),
                                                  backgroundColor: Colors.black,
                                                );
                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                            child: Icon(
                                          Icons.close,
                                          size: 20,
                                          color: ColorConstant.backgroundColor,
                                        )),
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
                              items[provider.savedItems[index].itemIndex]
                                  ['name'],
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
                            child: Text(
                                'Price : ${items[provider.savedItems[index].itemIndex]['price']}'),
                          )
                        ]),
                  ),
                ),
              ),
            ),
    );
  }
}
