import 'package:flutter/material.dart';
import 'package:food_app_wtn/constants/app_text_styles.dart';
import 'package:food_app_wtn/constants/dimensions.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String img =
        "https://ctf-bucket-s3.s3.me-central-1.amazonaws.com/03be452a-5f66-4eee-a40e-85e9221c5b7e.jpg?X-Amz-Expires=3600&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA6ODU7564ZGWHWNWO%2F20250131%2Fme-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250131T222736Z&X-Amz-SignedHeaders=host&X-Amz-Signature=bf117a57d4614564c90d7b3be59e928f7f342cfb0012f931330093ff86edd6d4";
    return Scaffold(backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              //pinned: true,
              leading: IconButton.filled(onPressed: () {}, icon: const Icon(Icons.arrow_back,color: Colors.white)),
              actions: [
                IconButton.filled(onPressed: () {}, icon: const Icon(Icons.favorite_border_rounded, color: Colors.white)),
                IconButton.filled(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.white)),
                IconButton.filled(onPressed: () {}, icon:const  Icon(Icons.more_horiz_rounded, color: Colors.white)),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(Dimensions.paddingDefault),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [Expanded(child:
                      Text("Off beat Restaurant", style: boldTextStyle.copyWith(fontSize: 20),),
                       ),

                        Column(children: [
                          Row(children: [
                            const Icon(Icons.star_rounded, color:  Colors.amber),
                            Text('4.3', style: regularTextStyle.copyWith(fontSize: 15)),
                          ],),

                          Text("2k+ rating"),
                        ],)
                      ],
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.delivery_dining, size: 16, color: Colors.red),
                        SizedBox(width: 8),
                        Text("Delivery 15-25 mins"),
                        Spacer(),
                        Text(
                          "2 km away",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "⭐ 4.8 (2k+ ratings)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.local_offer, size: 16, color: Colors.red),
                        SizedBox(width: 8),
                        Text("Free delivery • Min order 30 AED"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Pinned category chips
            SliverPersistentHeader(
              pinned: true,
              delegate: CategoryHeaderDelegate(),
            ),
            // Content below categories
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    title: Text("Item $index"),
                    subtitle: Text("Description of item $index"),
                    leading: Icon(Icons.fastfood),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Chip(label: Text("Pizza 🍕")),
          SizedBox(width: 8),
          Chip(label: Text("Chicken 🍗")),
          SizedBox(width: 8),
          Chip(label: Text("Burger 🍔")),
          SizedBox(width: 8),
          Chip(label: Text("Platter 🍽️")),
          SizedBox(width: 8),
          Chip(label: Text("Desserts 🍰")),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
