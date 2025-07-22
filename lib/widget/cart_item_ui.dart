import 'package:flutter/material.dart';
import 'package:hoormedicalstore/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItemUi extends StatelessWidget {
  final String id;
  final String title;
  final String description;

  final double price;
  final int quantity;
  final String imageurl;

  const CartItemUi(
      {super.key,
      required this.id,
      required this.title,
      required this.imageurl,
      required this.description,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dismissible(
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text('Are you Sure?'),
                    content: Text('You want to remove item form cart!'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ));
        },
        key: ValueKey(id),
        background: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.red,
            child: Icon(
              Icons.delete,
              size: 30,
            )),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) =>
            Provider.of<CartProvider>(context, listen: false).removeitem(id),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            color: const Color.fromARGB(255, 0, 32, 58),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '${title}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          height: 100,
                          child: FittedBox(
                            child: Image.asset(
                              imageurl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 30,
                                  width: 60,
                                  child: Card(
                                      color: const Color.fromARGB(
                                          181, 221, 131, 131),
                                      child: Center(
                                          child: Text(
                                        'Rs. ${(price * quantity).toStringAsFixed(2)}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8),
                                      )))),
                              Container(
                                height: 30,
                                width: 63,
                                child: Card(
                                  color:
                                      const Color.fromARGB(181, 142, 221, 131),
                                  child: Center(
                                    child: Text(
                                      'Quantity: ${quantity}X',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Container(
                                        width: 100,
                                        height: 33,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: Colors.white)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: IconButton(
                                                  onPressed: () => Provider.of<
                                                              CartProvider>(
                                                          context,
                                                          listen: false)
                                                      .singleCartItemRemoves(
                                                          id),
                                                  icon: Icon(
                                                    Icons.horizontal_rule,
                                                    color: Colors.white,
                                                    size: 10,
                                                  )),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                  onPressed: () =>
                                                      Provider.of<CartProvider>(
                                                              context,
                                                              listen: false)
                                                          .addproducttocart(
                                                              id,
                                                              imageurl,
                                                              description,
                                                              price,
                                                              quantity
                                                                  .toString()),
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 10,
                                                  )),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
