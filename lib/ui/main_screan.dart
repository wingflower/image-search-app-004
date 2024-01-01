import 'package:flutter/material.dart';
import 'package:image_search_app_004/data/repository/image_item_repository.dart';
import 'package:image_search_app_004/ui/widget/image_item_widget.dart';

import '../data/model/image_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
            TextField(
            controller: searchTextEditingController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xFF4FB6B2),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xFF4FB6B2),
                ),
              ),
              hintText: 'Search',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: const Color(0xFF4FB6B2),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          FutureBuilder(
            future: PixabayImageItemRepository()
                .getImageItems(searchTextEditingController.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              List<ImageItem> imageItems = snapshot.data!;
              return Expanded(
                child: GridView.builder(
                  itemCount: imageItems.length,
                  itemBuilder: (context, index) {
                    final imageItem = imageItems[index];
                    return ImageItemWidget(imageItem: imageItem);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                ),
              );
            },
            ],
          ),
        ),
      ),
    );
  }
}
