import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopingapp/controller/product_screen_controlller.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.id});
  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<DetailsController>().getData(count: widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productWatch = context.watch<DetailsController>();
    return Scaffold(
        appBar: AppBar(
          title: productWatch.isLoading
              ? const Center(child: Text('Loading...'))
              : Text(productWatch.product!.title.toString()),
        ),
        body: Builder(
          builder: (context) {
            if (productWatch.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (productWatch.product != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      productWatch.product!.image.toString(),
                      height: 200,
                    ),
                    Text(
                      'price \$${productWatch.product!.price.toString()}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    const Divider(),
                    Text(
                      'details : ${productWatch.product!.description.toString()}',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
