import 'package:api_usage/models/products_fakestore.dart';
import 'package:api_usage/services/fake_store.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ApiUsage> products = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            Text('Id: ${products[index].id.toString()}'),
                            Text('Title: ${products[index].title}'),
                            Text('price: ${products[index].price}'),
                            Image.network(products[index].images.first)
                            //Image.network(products[index].image!),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () async {
                products = (await getFakeStoreProductsWithDio())!;
                setState(() {});
              },
              child: const Text('Get Data From Server'),
            ),
          ],
        ),
      ),
    );
  }
}
