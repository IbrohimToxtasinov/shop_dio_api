import 'package:flutter/material.dart';
import 'package:shop_dio_api/screens/categories_page.dart';
import 'package:shop_dio_api/screens/income_types.dart';
import 'package:shop_dio_api/screens/products_page.dart';
import 'package:shop_dio_api/screens/transactions_expenses.dart';
import 'package:shop_dio_api/view_model/transactions_expenses_view_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
    // const CategoriesPage(),
    // const ProductsPage(),
    const SampleUsageIncomes(),
    const TransactionsExpensesPage(),
  ];
    return Scaffold(
      body: pages[_selectedIndex],

      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
          backgroundColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              label: 'Categories' 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Product' 
            ),
          ],
        ),
      ),
    );
  }

  
}