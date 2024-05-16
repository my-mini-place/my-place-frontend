import 'package:basics/Domain/value_objects/options.dart';
import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCategoryTile extends StatefulWidget {
  const MyCategoryTile({
    super.key,
    required this.title,
    required this.description,
    required this.imagepath,
  });

  final String title;
  final String description;
  final String imagepath;

  @override
  State<MyCategoryTile> createState() => _MyCategoryTileState();
}

class _MyCategoryTileState extends State<MyCategoryTile> {
  double _scale = 1.0;

  void _onHover(PointerEvent details) {
    setState(() {
      _scale = 1.05; // Skala powiększenia
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _scale = 1.0; // Skala normalna
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  color: Colors.amber,
      width: 600,
      height: 200,
      child: Row(children: [
        MouseRegion(
          onHover: _onHover,
          onExit: _onExit,
          child: AnimatedContainer(
            transformAlignment: Alignment.center,
            transform: Matrix4.identity()..scale(_scale, _scale),
            duration: const Duration(seconds: 1),

            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imagepath),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            //   padding: const EdgeInsets.all(10.0),
            width: 250,
            height: 200,
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                gapH10,
                Text(
                  widget.description,

                  //  softWrap: true,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
