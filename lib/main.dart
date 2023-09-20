import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kordianapp/Classes/ElementsData.dart';
import 'Widgets/teethElement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: "Kordian's App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Kordian's App"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color outlineColor = Colors.black;
  var elements = <ElemenetData>[];
  var indexList = [
    "1.8", "1.7", "1.6", "1.5", "1.4", "1.3", "1.2", "1.1",
    "2.1", "2.2", "2.3", "2.4", "2.5", "2.6", "2.7", "2.8",
    "4.8", "4.7", "4.6", "4.5", "4.4", "4.3", "4.2", "4.1",
    "3.1", "3.2", "3.3", "3.4", "3.5", "3.6", "3.7", "3.8",
    "5.5", "5.4", "5.3", "5.2", "5.1",
    "6.1", "6.2", "6.3", "6.4", "6.5",
    "8.5", "8.4", "8.3", "8.2", "8.1",
    "7.1", "7.2", "7.3", "7.4", "7.5"
  ];
  var listColor = [Colors.black, Colors.red,Colors.blueAccent];
  int selectedColor = 1;
  int selectedTool = 0;
  @override
  void initState() {
    for(int i = 0; i < 52;i++){
      elements.add(new ElemenetData());
      elements[i].index = i;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery. of(context). size. width);
    print(MediaQuery. of(context). size. height);
    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            panEnabled: false, // Set it to false to prevent panning.
            minScale: 1,
            maxScale: 4,
            child: Container(
            color: Colors.black,
            child: Container(
                margin: EdgeInsets.fromLTRB(
                    0,
                    MediaQuery. of(context). size. height * 0.078125,
                    0,
                    MediaQuery. of(context). size. height * 0.02577319587),
                child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              color: Color(0xfff6e8d0),
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                MediaQuery. of(context). size. width *0.0256849315,
                                0
                              ),
                              height:  MediaQuery. of(context). size. height *0.22135416666,
                              width:  MediaQuery.of(context).size.width/2,
                              alignment: Alignment.topRight,
                              child: ListView.builder(
                                  itemCount: 8,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Container(width: MediaQuery. of(context). size. width *0.007705479452,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              indexList[index],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: outlineColor,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:MediaQuery. of(context). size. width *0.02311643836
                                              ),
                                            ),
                                            Container(height: MediaQuery. of(context). size. height*0.0078125,),
                                            Container(
                                              child: teethElement(
                                                selectedTool: selectedTool,
                                                ed: elements[index],
                                                size: MediaQuery. of(context). size. height*0.1041666667,
                                                fillColor: listColor[selectedColor],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            Container(
                              height:  MediaQuery. of(context). size. height *0.22135416666,
                              color: Color(0xffcfe3d9),
                              width:  MediaQuery.of(context).size.width/2,
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery. of(context). size. width *0.0256849315,
                                  0, 0, 0),
                              child: ListView.builder(
                                  itemCount: 8,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              indexList[index+8],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: outlineColor,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:MediaQuery. of(context). size. width *0.02311643836
                                              ),
                                            ),
                                            Container(height: MediaQuery. of(context). size. height*0.0078125,),
                                            Container(
                                              child: teethElement(
                                                selectedTool: selectedTool,
                                                ed: elements[index+8],
                                                size: MediaQuery. of(context). size. height*0.1041666667,
                                                fillColor: listColor[selectedColor],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(width: MediaQuery. of(context). size. width *0.007705479452,),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height:  MediaQuery. of(context). size. height *0.22135416666,
                              color: Color(0xfff6e8d0),
                              padding: EdgeInsets.fromLTRB(0,
                                  0,
                                  MediaQuery. of(context). size. width *0.02568493151,
                                  0
                              ),
                              width:  MediaQuery.of(context).size.width/2,
                              alignment: Alignment.topRight,
                              child: ListView.builder(
                                  itemCount: 8,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Container(width: MediaQuery. of(context). size. width *0.007705479452,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: teethElement(
                                                selectedTool: selectedTool,
                                                ed: elements[index+16],
                                                size: MediaQuery. of(context). size. height*0.1041666667,
                                                fillColor: listColor[selectedColor],
                                              ),
                                            ),
                                            Container(height: MediaQuery. of(context). size. height*0.0078125,),
                                            Text(
                                              indexList[index+16],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: outlineColor,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:MediaQuery. of(context). size. width *0.02311643836
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    );
                                  }),
                            ),
                            Container(
                              height:  MediaQuery. of(context). size. height *0.22135416666,
                              color: Color(0xffcfe3d9),
                              width:  MediaQuery.of(context).size.width/2,
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery. of(context). size. width *0.02568493151,
                                  0,
                                  0,
                                  0),
                              child: ListView.builder(
                                  itemCount: 8,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: teethElement(
                                                selectedTool: selectedTool,
                                                ed: elements[index+24],
                                                size: MediaQuery. of(context). size. height*0.1041666667,
                                                fillColor: listColor[selectedColor],
                                              ),
                                            ),
                                            Container(height: MediaQuery. of(context). size. height*0.0078125,),
                                            Text(
                                              indexList[index+24],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: outlineColor,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:MediaQuery. of(context). size. width *0.02311643836
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(width: MediaQuery. of(context). size. width *0.007705479452,),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Container(
                              height:  MediaQuery. of(context). size. height *0.22135416666,
                              color: Color(0xffe0d6da),
                              width:  MediaQuery.of(context).size.width/2,
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.fromLTRB(0,
                                  0,
                                  MediaQuery. of(context). size. width *0.02568493151,
                                  0
                              ),
                              child: ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Container(width: MediaQuery. of(context). size. width *0.01284246575,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              indexList[index+32],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: outlineColor,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:MediaQuery. of(context). size. width *0.02311643836
                                              ),
                                            ),
                                            Container(height: MediaQuery. of(context). size. height*0.0078125,),
                                            Container(
                                              child: teethElement(
                                                selectedTool: selectedTool,
                                                ed: elements[index+32],
                                                size: MediaQuery. of(context). size. height*0.1041666667,
                                                fillColor: listColor[selectedColor],
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    );
                                  }),
                            ),
                            Container(
                              height:  MediaQuery. of(context). size. height *0.22135416666,
                              color: Color(0xffe1f8ff),
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery. of(context). size. width *0.02568493151,
                                  0,
                                  0,
                                  0),
                              width:  MediaQuery.of(context).size.width/2,
                              child: ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                indexList[index+37],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: outlineColor,
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:MediaQuery. of(context). size. width *0.02311643836
                                                ),
                                              ),
                                              Container(height: MediaQuery. of(context). size. height*0.0078125,),
                                              Container(
                                                child: teethElement(
                                                  selectedTool: selectedTool,
                                                  ed: elements[index+37],
                                                  size: MediaQuery. of(context). size. height*0.1041666667,
                                                  fillColor: listColor[selectedColor],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(width: MediaQuery. of(context). size. width *0.01284246575,)
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height:  MediaQuery. of(context). size. height *0.22135416666,
                              color: Color(0xffe0d6da),
                              width:  MediaQuery.of(context).size.width/2,
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.fromLTRB(0,
                                  0,
                                  MediaQuery. of(context). size. width *0.02568493151,
                                  0
                              ),
                              child: ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Container(width: MediaQuery. of(context). size. width *0.01284246575,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: teethElement(
                                                selectedTool: selectedTool,
                                                ed: elements[index+42],
                                                size: MediaQuery. of(context). size. height*0.1041666667,
                                                fillColor: listColor[selectedColor],
                                              ),
                                            ),
                                            Container(height: MediaQuery. of(context). size. height*0.0078125,),
                                            Text(
                                              indexList[index+42],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: outlineColor,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:MediaQuery. of(context). size. width *0.02311643836
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    );
                                  }),
                            ),
                            Container(
                              height:  MediaQuery. of(context). size. height *0.22135416666,
                              width:  MediaQuery.of(context).size.width/2,
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery. of(context). size. width *0.02568493151,
                                  0,
                                  0,
                                  0),
                              color: Color(0xffe1f8ff),
                              child: ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: teethElement(
                                                selectedTool: selectedTool,
                                                ed: elements[index+47],
                                                size: MediaQuery. of(context). size. height*0.1041666667,
                                                fillColor: listColor[selectedColor],
                                              ),
                                            ),
                                            Container(height: MediaQuery. of(context). size. height*0.0078125,),
                                            Text(
                                              indexList[index+47],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: outlineColor,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w700,

                                                  fontSize:MediaQuery. of(context). size. width *0.02311643836
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(width: MediaQuery. of(context). size. width *0.01284246575,)
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ],
                    )
                )
            ),
          ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: MediaQuery. of(context). size. height*0.390625,
              width: MediaQuery. of(context). size. width *0.1284246575,
              margin: EdgeInsets.fromLTRB(
                  MediaQuery. of(context). size. width *0.01284246575,
                  0,
                  MediaQuery. of(context). size. width *0.01284246575,
                  MediaQuery. of(context). size. height*0.05208333333
              ),
              decoration: BoxDecoration(
                color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height*0.02604166667))
              ),
              child: Column(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedColor = 0;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625, MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: listColor[selectedColor]==listColor[0]?
                                  Colors.black:
                                  Colors.transparent,
                                  width: MediaQuery. of(context). size. width *0.006421232877,
                              ),
                              color: Colors.black45,
                              borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height*0.02604166667))
                          ),
                        ),
                      )
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          selectedColor = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: listColor[selectedColor]==listColor[1]?
                                Colors.black:
                                Colors.transparent,
                                width: MediaQuery. of(context). size. width *0.006421232877,
                            ),
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height*0.02604166667))
                        ),
                        margin: EdgeInsets.fromLTRB(MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625, MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625),
                      ),
                    )
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          selectedColor = 2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625, MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: listColor[selectedColor]==listColor[2]?
                                Colors.black:
                                Colors.transparent,
                                width: MediaQuery. of(context). size. width *0.006421232877,
                            ),
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height*0.02604166667))
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: MediaQuery. of(context). size. height*0.390625,
              width: MediaQuery. of(context). size. width *0.1284246575,
              margin: EdgeInsets.fromLTRB(
                  MediaQuery. of(context). size. width *0.01284246575,
                  0,
                  MediaQuery. of(context). size. width *0.01284246575,
                  MediaQuery. of(context). size. height*0.05208333333),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height*0.02604166667))
              ),
              child: Column(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(selectedTool == 1){
                              selectedTool = 0;
                            }
                            else{
                              selectedTool = 1;
                            }
                          });
                        },
                        child: Container(
                          width: MediaQuery. of(context). size. width *0.06421232877,
                          decoration: BoxDecoration(
                              color: selectedTool==1?
                              Colors.blueGrey:
                              Colors.black45,
                              borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height*0.02604166667))
                          ),
                          margin: EdgeInsets.fromLTRB(MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625, MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625),
                          child: Image.asset(
                            'assets/symbol.png',
                            height: MediaQuery. of(context). size. width *0.03852739726,
                            width: MediaQuery. of(context). size. height*0.078125,
                            color: Colors.white70,
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(selectedTool == 2){
                              selectedTool = 0;
                            }
                            else{
                              selectedTool = 2;
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625, MediaQuery. of(context). size. width *0.007705479452, MediaQuery. of(context). size. height*0.015625),
                          width: MediaQuery. of(context). size. width *0.06421232877,
                          decoration: BoxDecoration(
                              color: selectedTool==2?
                              Colors.blueGrey:
                              Colors.black45,
                              borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height*0.02604166667))
                          ),
                          child:
                          Image.asset(
                            'assets/close.png',
                            height: MediaQuery. of(context). size. height*0.02604166667,
                            width: MediaQuery. of(context). size. width *0.01284246575,
                            fit: BoxFit.contain,
                            color: Colors.white70,
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
