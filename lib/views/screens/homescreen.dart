import 'package:flutter/material.dart';
import 'package:lesson61/controllers/productcontroller.dart';
import 'package:lesson61/views/widgets/silver_header_widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final productcontroller = Productcontroller();
  final scrollcontorller = ScrollController();
  @override
  void initState() {
    scrollcontorller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    print('Scroll Offset: ${scrollcontorller.offset}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: productcontroller.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Mahsulotlar yo\'q'),
            );
          }
          return CustomScrollView(
            controller: scrollcontorller,
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data!.first.images[0]),
                          fit: BoxFit.cover),
                    ),
                    child: const Text(
                      "Product",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 43,
                          color: Colors.amber),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverHeaderDelegate(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey.shade300,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Popular',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    maxHeight: 80,
                    minHeight: 60),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 20,
                    (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data![index].images[0],
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        '\$${snapshot.data![index].price}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(snapshot.data![index].title)
                    ],
                  );
                }),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverHeaderDelegate(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey.shade300,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Men`s fashion',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    maxHeight: 80,
                    minHeight: 60),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image:
                                  NetworkImage(snapshot.data![index].images[0]),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ))
            ],
          );
        },
      ),
    );
  }
}
