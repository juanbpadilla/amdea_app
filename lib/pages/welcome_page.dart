import 'package:amdea_app/widgets/widgets.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPage = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {

    // final uiProvider = Provider.of<UiProvider>(context);

    // int currentIndex = uiProvider.selectedMenuOpt;

    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const BouncingScrollPhysics(),

          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },

          children: const [
            Card1(),
            Card2(),
            Card3(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentPage: _currentPage,
        navigateToPage: _navigateToPage,
      )
   );
  }
}
