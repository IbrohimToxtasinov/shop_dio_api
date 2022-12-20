// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_dio_api/view_model/album_view_model.dart';


// class SimpleUsage extends StatefulWidget {
//   const SimpleUsage({Key? key}) : super(key: key);

//   @override
//   State<SimpleUsage> createState() => _SimpleUsageState();
// }

// class _SimpleUsageState extends State<SimpleUsage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Simple usage"),),
//       body: Consumer<AlbumViewModel>(
//         builder: (context, viewModel, child){
//           if(viewModel.album == null){
//             return Column(children: [
//             const  Center(child: Text("No Data Yet"),),
//               ElevatedButton(onPressed: (){
//                 context.read<AlbumViewModel>().fetchAlbum(id: 5);
//               }, child: const Text("Get  Data")),
//             ],);
//           }
//           return Column(
//             children: [
//               Text(viewModel.album!.title),
//               Text(viewModel.album!.id.toString()),
//               Text(viewModel.album!.userId.toString()),



//             ],
//           );
//         },
//       ),
//     );
//   }
// }