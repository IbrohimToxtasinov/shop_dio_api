// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_dio_api/view_model/product_view_model.dart';

// class ProductsPage extends StatefulWidget {
//   const ProductsPage({super.key});

//   @override
//   State<ProductsPage> createState() => _ProductsPageState();
// }

// class _ProductsPageState extends State<ProductsPage> {
//   @override
//   void initState() {
//     Future.microtask(
//         () => context.read<ProductsViewModel>().fetchAllProducts());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Products"),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height * 0.9,
//         width: double.infinity,
//         margin: const EdgeInsets.all(15),
//         child: Consumer<ProductsViewModel>(
//             builder: (context, productsViewModel, child) {
//           return productsViewModel.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : (productsViewModel.productModel == null
//                   ? const Text("Hozircha malumot yo'q")
//                   : GridView.builder(
//                       shrinkWrap: true,
//                       itemCount: productsViewModel.productModel!.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2),
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 20),
//                           child: InkWell(
//                             child: Container(
//                               margin:
//                                   const EdgeInsets.only(left: 15, right: 15),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 border:
//                                     Border.all(width: 1, color: Colors.grey),
//                               ),
//                               child: Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Image(
//                                   image: NetworkImage(
//                                       productsViewModel.productModel![index].imageUrl),
//                                   width: 120,
//                                 ),
//                                 Column(
//                                   children: [
//                                     Text(productsViewModel.productModel![index].name),
//                                     Text("\$ ${productsViewModel.productModel![index].price}", style: const TextStyle(color: Colors.indigoAccent, fontWeight: FontWeight.w500),),
//                                   ],
//                                 ),
//                               ],
//                             )),
//                             ),
//                           ),
//                         );
//                       },
//                     ));
//         }),
//       ),
//     );
//   }
// }
