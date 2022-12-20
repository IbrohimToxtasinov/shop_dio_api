import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_dio_api/view_model/categories_view_model.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    Future.microtask(
        () => context.read<CategoriesViewModel>().fetchAllCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        child: Consumer<CategoriesViewModel>(
            builder: (context, categoriesViewModel, child) {
          return categoriesViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : (categoriesViewModel.categories == null
                  ? const Text("Hozircha malumot yo'q")
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: categoriesViewModel.categories!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                  image: NetworkImage(categoriesViewModel
                                      .categories![index].imageUrl),
                                  width: 150,
                                ),
                                Text(categoriesViewModel.categories![index].name),
                              ],
                            )),
                          ),
                        );
                      },
                    ));
        }),
      ),
    );
  }
}
