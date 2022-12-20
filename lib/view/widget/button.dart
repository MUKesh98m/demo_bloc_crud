import 'package:demo_bloc_crud/widget/constant.dart';
import 'package:flutter/material.dart';

class buttons extends StatefulWidget {
  const buttons({
    Key? key,
    required this.buttonname,
    required this.buttonheight,
    required this.buttonwidth,
    required this.fontsize,
    required this.onTap,
  }) : super(key: key);
  final buttonname;
  final buttonheight;
  final buttonwidth;
  final fontsize;
  final VoidCallback onTap;

  @override
  State<buttons> createState() => _buttonsState();
}

class _buttonsState extends State<buttons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.buttonwidth,
      height: widget.buttonheight,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(AppColors.PayTextColor)),
          onPressed: widget.onTap,
          child: Text(
            widget.buttonname,
            style: TextStyle(
                color: Colors.black87,
                fontSize: widget.fontsize,
                fontFamily: 'Libre',
                fontWeight: FontWeight.w900),
          )),
    );
  }
}
