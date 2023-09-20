import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kordianapp/Classes/ElementsData.dart';

class teethElement extends StatefulWidget {
  teethElement({
    required this.size,
    this.backgroundColor = Colors.white,
    this.outline = Colors.black,
    required this.fillColor,
    required this.ed,
    required this.selectedTool,
  });

  ElemenetData ed;
  Color backgroundColor;
  Color fillColor;
  Color outline;
  double size;
  int selectedTool;
  @override
  State<teethElement> createState() => _teethElementState();
}

class _teethElementState extends State<teethElement> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if(details.primaryVelocity !=null){
          setState(() {
            if (details.primaryVelocity! > 0) {
              if(widget.ed.c5 == widget.fillColor){
                widget.ed.c5 = widget.backgroundColor;
              }
              else{
                widget.ed.c5=widget.fillColor;
              }
            } else if (details.primaryVelocity! < 0) {
              if(widget.ed.c2 == widget.fillColor){
                widget.ed.c2 = widget.backgroundColor;
              }
              else{
                widget.ed.c2=widget.fillColor;
              }
            }
          });
        }
      },
      onVerticalDragEnd: (DragEndDetails details) {
        if(details.primaryVelocity !=null){
          setState(() {
            if (details.primaryVelocity! > 0) {
              if(widget.ed.c4 == widget.fillColor){
                widget.ed.c4 = widget.backgroundColor;
              }
              else{
                widget.ed.c4=widget.fillColor;
              }
            } else if (details.primaryVelocity! < 0) {
              if(widget.ed.c3 == widget.fillColor){
                widget.ed.c3 = widget.backgroundColor;
              }
              else{
                widget.ed.c3 =widget.fillColor;
              }
            }
          });
        }
      },
      onDoubleTap: (){
        setState(() {
          if(widget.selectedTool == 2){
            widget.ed.boolX = !widget.ed.boolX;
            widget.ed.boolXColor = widget.fillColor;
          }
          else if(widget.selectedTool == 1){
            widget.ed.boolSymbol = !widget.ed.boolSymbol;
            widget.ed.boolSymbolColor = widget.fillColor;
          }
        });
      },
      onTap: (){
        setState(() {
          if(widget.ed.c1 == widget.fillColor){
            widget.ed.c1 = widget.backgroundColor;
          }
          else{
            widget.ed.c1 = widget.fillColor;
          }
        });
      },
      onLongPress: (){
        setState(() {
          if(
            widget.ed.c1 != widget.backgroundColor &&
            widget.ed.c2 != widget.backgroundColor &&
            widget.ed.c3 != widget.backgroundColor &&
            widget.ed.c4 != widget.backgroundColor &&
            widget.ed.c5 != widget.backgroundColor
          ){
            widget.ed.c1 = widget.backgroundColor;
            widget.ed.c2 = widget.backgroundColor;
            widget.ed.c3 = widget.backgroundColor;
            widget.ed.c4 = widget.backgroundColor;
            widget.ed.c5 = widget.backgroundColor;
            widget.ed.boolSymbolColor = Colors.transparent;
            widget.ed.boolXColor = Colors.transparent;
            widget.ed.boolSymbol = false;
            widget.ed.boolX = false;
          }
          else{
            widget.ed.c1 = widget.fillColor;
            widget.ed.c2 = widget.fillColor;
            widget.ed.c3 = widget.fillColor;
            widget.ed.c4 = widget.fillColor;
            widget.ed.c5 = widget.fillColor;
          }
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: widget.size,
            width: widget.size,
            color: widget.ed.c1,
            child: Stack(
              children: [
                ElementTooth(
                  size: widget.size,
                  color: widget.ed.c2,
                  outlineColor: widget.outline,
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: ElementTooth(
                    size: widget.size,
                    color: widget.ed.c3,
                    outlineColor: widget.outline,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: ElementTooth(
                      size: widget.size,
                      color: widget.ed.c4,
                      outlineColor: widget.outline,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: ElementTooth(
                      size: widget.size,
                      color: widget.ed.c5,
                      outlineColor: widget.outline,
                    ),
                  ),
                ),
                widget.ed.boolX?
                OverflowBox(
                  minWidth: 0.0,
                  minHeight: 0.0,
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                  child: Image.asset(
                    'assets/close.png',
                    height: MediaQuery. of(context). size. height*0.1171875,
                    width: MediaQuery. of(context). size. width *0.04494863014,
                    fit: BoxFit.fitHeight,
                    color: widget.ed.boolXColor,
                  ),
                ):Container(),
                widget.ed.boolSymbol?
                OverflowBox(
                  minWidth: 0.0,
                  minHeight: 0.0,
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                  child: Image.asset(
                    'assets/symbol1.png',
                    height: MediaQuery. of(context). size. height*0.15625,
                    width: MediaQuery. of(context). size. width *0.07705479452,
                    fit: BoxFit.fitHeight,
                    color: widget.ed.boolSymbolColor,
                  ),
                ):Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class ElementTooth extends StatefulWidget {
  ElementTooth({required this.color, required this.size, required this.outlineColor});
  Color color;
  double size;
  Color outlineColor;
  @override
  State<ElementTooth> createState() => _ElementToothState();
}

class _ElementToothState extends State<ElementTooth> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/coloredElement.svg',
          height: widget.size,
          width: widget.size,
          color: widget.color,
        ),
        SvgPicture.asset(
          'assets/outlineElement.svg',
          height: widget.size,
          width: widget.size,
          color: widget.outlineColor,
        ),
      ],
    );
  }
}
