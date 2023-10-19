import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/model/models.dart';
import 'package:provider_task/provider/provider.dart';
import 'package:provider_task/utils/color_constant/color_constant.dart';
import 'package:provider_task/view/cart_screen/cart_screen.dart';

class DetailScreen extends StatefulWidget {
  final int itemIndex;
  const DetailScreen({super.key, required this.itemIndex});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<ShoppingAppProvider>(context).isCart(widget.itemIndex);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoppingAppProvider>(context, listen: false);
    int itemPrice = items[widget.itemIndex]['price'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              provider.resetItemCount();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorConstant.primaryTextColor,
            )),
        title: Text(
          'Details',
          style: TextStyle(
              color: ColorConstant.primaryTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 25),
        ),
        centerTitle: true,
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConstant.textFieldBg,
              image: DecorationImage(
                  image: AssetImage(items[widget.itemIndex]['image']),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: ColorConstant.backgroundColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Icon(
                        Icons.favorite_outline,
                        size: 30,
                      )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              )
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              items[widget.itemIndex]['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Price',
                      style: TextStyle(
                          color: Color.fromARGB(255, 129, 129, 129),
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '₹${Provider.of<ShoppingAppProvider>(context).totalPrice(itemPrice, provider.itemCount)}',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Provider.of<ShoppingAppProvider>(context, listen: false)
                            .addCount();
                      },
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryTextColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5))),
                        child: Center(
                            child: Text(
                          '+',
                          style: TextStyle(
                              color: ColorConstant.backgroundColor,
                              fontSize: 20),
                        )),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      decoration:
                          BoxDecoration(color: ColorConstant.primaryTextColor),
                      child: Center(
                          child: Text(
                        Provider.of<ShoppingAppProvider>(context)
                            .itemCount
                            .toString(),
                        style: TextStyle(
                            color: ColorConstant.backgroundColor, fontSize: 20),
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<ShoppingAppProvider>(context, listen: false)
                            .removeCount();
                      },
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryTextColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: Center(
                            child: Text(
                          '-',
                          style: TextStyle(
                              color: ColorConstant.backgroundColor,
                              fontSize: 22),
                        )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '4.1',
                        style: TextStyle(
                            color: ColorConstant.backgroundColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: ColorConstant.backgroundColor,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  '2,07,907 ratings and 21,225 reviews',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 94, 94, 94),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Provider.of<ShoppingAppProvider>(context).isCartContains == true
                  ? Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    ColorConstant.primaryTextColor)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Cart(itemIndex: widget.itemIndex),
                                  ));
                            },
                            child: Text(
                              'Go to cart',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    ColorConstant.primaryTextColor)),
                            onPressed: () {
                              provider.addToCart(widget.itemIndex);
                              const snackBar = SnackBar(
                                content:
                                    Text('Product added to cart successfully.'),
                                backgroundColor: Colors.black,
                              );
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              provider.resetItemCount();
                            },
                            child: Text(
                              'Add to cart',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
            ],
          ),
          SizedBox(height: 40,),
        ]),
      ),
    );
  }
}
