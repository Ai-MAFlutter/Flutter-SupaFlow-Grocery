import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/products_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import '../widgets/bottom_nav.dart';
import '../providers/products_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    ProductsScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNav(currentIndex: currentIndex, onTap: (i) => setState(() => currentIndex = i)),
    );
  }
}
