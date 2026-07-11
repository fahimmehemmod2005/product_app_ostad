import 'package:flutter/material.dart';
import 'package:ostad_api_1/controller/product_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color appColor = Colors.pinkAccent;
  String imageNetwork =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8whHvDEUu8dsHOt3_MBGYApEkYuqCeA6fDqQdUb9h8CHayX9RxAD79X2h&s=10';

  ProductController productController = ProductController();

  Future fetchData() async {
    await productController.getReadProduct();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final getProduct = productController.products;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: false,
        backgroundColor: appColor,
      ),
      body: GridView.builder(
        itemCount: getProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final item = getProduct[index];
          return Column(
            children: [
              SizedBox(height: 150, child: Image.network('${item.img}')),
              Text(
                'Name: ${item.productName}',
                style: TextStyle(fontSize: 15, fontWeight: .bold),
              ),
              Text('Price: ${item.unitPrice}\$'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit_note, color: appColor),
                  ),
                  Text('Qty: ${item.qty}'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
