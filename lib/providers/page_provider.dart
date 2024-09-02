import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  
  PageController scrollControll = PageController();

  goTo(int index) {
   
    scrollControll.animateToPage(index,
    duration: const Duration(milliseconds: 300), 
    curve: Curves.easeInOut,
        
        );
  }
}
