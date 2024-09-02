//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/share/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isopen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isopen) {
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isopen = !isopen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isopen ? 310 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isopen: isopen, controller: controller),
              if (isopen) ...[
                CustomMenuItem(
                    delay: 0,
                    text: 'Home',
                    onPressed: () => pageProvider.goTo(0)),
                CustomMenuItem(
                    delay: 60,
                    text: 'About',
                    onPressed: () => pageProvider.goTo(1)),
                CustomMenuItem(
                    delay: 120,
                    text: 'Pricing',
                    onPressed: () => pageProvider.goTo(2)),
                CustomMenuItem(
                    delay: 180,
                    text: 'Contact',
                    onPressed: () => pageProvider.goTo(3)),
                CustomMenuItem(
                    delay: 240,
                    text: 'Location',
                    onPressed: () => pageProvider.goTo(4))
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    required this.isopen,
    required this.controller,
  });

  final bool isopen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isopen ? 40 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
