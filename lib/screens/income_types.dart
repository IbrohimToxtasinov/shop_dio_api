import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_dio_api/view_model/income_types_view_model.dart';

class SampleUsageIncomes extends StatefulWidget {
  const SampleUsageIncomes({Key? key}) : super(key: key);

  @override
  State<SampleUsageIncomes> createState() => _SampleUsageIncomesState();
}

class _SampleUsageIncomesState extends State<SampleUsageIncomes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incomes Types"),
      ),
      body: Consumer<IncomeTypesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorForUI.isNotEmpty) {
            return Center(
              child: Text(viewModel.errorForUI),
            );
          }
          return viewModel.incomeTypes!=null?ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: viewModel.incomeTypes!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 150,
                              height: 180,
                              child: Image.network(
                                viewModel.incomeTypes![index].icon,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    "Incomes type: ${viewModel.incomeTypes![index].incomeType}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }):   Center(
                child: ElevatedButton(
                onPressed: () {
                  context.read<IncomeTypesViewModel>().fetchAllIncomeTypes();
                },
                child: const Text("Get Data")),
              );
        },
      ),
    );
  }
}