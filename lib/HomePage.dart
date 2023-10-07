import 'package:flutter/material.dart';
import 'package:module_9_assignment_new/ProductDetails.dart';
import 'ProductList.dart';

ProductList productList = ProductList();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> counters = List.filled(productList.productDetails.length, 0);
  double totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(Icons.search,color: Colors.black,),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Bag",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: productList.productDetails.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 165,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(6),bottomLeft: Radius.circular(6)),
                                  child: Image.network(
                                    productList.productDetails[index].productImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5,),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productList.productDetails[index].productName,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "Color : ",
                                                style:
                                                TextStyle(color: Colors.grey.shade500)),
                                            TextSpan(
                                                text: productList.productDetails[index]
                                                    .productColor,
                                                style: const TextStyle(color: Colors.black)),
                                          ])),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "Size : ",
                                                style:
                                                TextStyle(color: Colors.grey.shade500)),
                                            TextSpan(
                                                text: productList.productDetails[index]
                                                    .productSize,
                                                style: const TextStyle(color: Colors.black)),
                                          ])),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Material(
                                          elevation: 4.0,
                                          shape: const CircleBorder(),
                                          clipBehavior: Clip.antiAlias,
                                          child: IconButton(
                                            onPressed: () {
                                              if (counters[index] > 0) {
                                                counters[index]--;
                                                totalAmount -=
                                                    productList.productDetails[index]
                                                        .productPrice;
                                              }
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.remove),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text('${counters[index]}'),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Material(
                                          elevation: 4.0,
                                          shape: const CircleBorder(),
                                          clipBehavior: Clip.antiAlias,
                                          child: IconButton(
                                            onPressed: () {
                                              counters[index]++;
                                              totalAmount +=
                                                  productList.productDetails[index]
                                                      .productPrice;
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.add),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {}, icon: const Icon(Icons.more_vert)),
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  Text("${productList.productDetails[index].productPrice}\$"),
                                  const SizedBox(
                                    height: 30,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [const Text("Total Amount :"), const Spacer(), Text('$totalAmount\$')],
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Congratulation For Your Shopping"),
                          duration: Duration(seconds: 2),

                      )
                  );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.31),
                child: const Text("CHECK OUT"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
