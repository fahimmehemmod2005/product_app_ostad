import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color appColor = Colors.pinkAccent;
  String imageNetwork =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8whHvDEUu8dsHOt3_MBGYApEkYuqCeA6fDqQdUb9h8CHayX9RxAD79X2h&s=10';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: false,
        backgroundColor: appColor,
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 150, child: Image.network(imageNetwork)),
              Text(
                'Iphone 14 pro',
                style: TextStyle(fontSize: 15, fontWeight: .bold),
              ),
              Text('Price: 500\$'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit_note, color: appColor),
                  ),
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
        child: Icon(Icons.add, color: Colors.black,),
      ),
    );
  }
}
