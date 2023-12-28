import 'package:flutter/material.dart';
import 'package:image_search_app_004/ui/widget/image_item_widget.dart';

import '../data/model/image_item.dart';

class MainScreen extends StatelessWidget {
  final double borderValue = 32;
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Color(0xFF4FB6B2),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: GridView.builder(
                  itemBuilder: (context, index) {
                    final imageItem = ImageItem(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg',
                      tags: 'apple',
                    );
                    return ImageItemWidget(borderValue: borderValue, imageItem: imageItem);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
