import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  
  final String text;
  final Function onPressed;
  final int delay;

  const CustomMenuItem(
      {super.key, required this.text, this.delay = 0, required this.onPressed});

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHoover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10,
      duration: const Duration(milliseconds: 150),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHoover = true),
        onExit: (_) => setState(() => isHoover = false),
        
        child: GestureDetector(
          onTap: () => widget.onPressed,
          child: AnimatedContainer(
            
            duration: const Duration(milliseconds: 300),
            height: 50,
            width: 150,
            color: isHoover ? Colors.pinkAccent : Colors.transparent,
            
            child: Center(
              
              child: Text(
                widget.text,
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
              
            ),

          ),
           
        ),
        
      ),
      
    );
  }
}
