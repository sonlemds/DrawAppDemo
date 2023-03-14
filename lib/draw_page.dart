import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_svg_detect/strokes_painter.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/painter_bloc.dart';
import 'dialogs/color_dialog.dart';
import 'dialogs/width_dialog.dart';
import 'models/clear.dart';
import 'models/color.dart';
import 'models/end_touch.dart';
import 'models/stroke.dart';
import 'models/stroke_width.dart';
import 'models/touch_location.dart';

class DrawPage extends StatefulWidget {
  const DrawPage({super.key});

  @override
  DrawPageState createState() => DrawPageState();
}

class DrawPageState extends State<DrawPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  final StrokeCap _strokeCap = StrokeCap.round;
  late StrokesPainter painter;
  late ui.Size size = Size.infinite;
  ui.Image? imageTest = null;

  @override
  void initState() {
    super.initState();
    loadUiImage("images/image.png");
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // The widgets returned by build(...) change when animationStatus changes
    _controller.addStatusListener((newAnimationStatus) {
      if (newAnimationStatus != _animationStatus) {
        setState(() {
          _animationStatus = newAnimationStatus;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PainterBloc>(context);

    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            final RenderBox object = context.findRenderObject() as RenderBox;
            final localPosition = object.globalToLocal(details.globalPosition);
            bloc.drawEvent.add(TouchLocationEvent((builder) {
              builder
                ..x = localPosition.dx
                ..y = localPosition.dy;
            }));
          });
        },
        onPanEnd: (DragEndDetails details) =>
            bloc.drawEvent.add(EndTouchEvent()),
        child: StreamBuilder<BuiltList<Stroke>>(
          stream: bloc.strokes,
          builder: (context, snapshot) {
            painter = StrokesPainter(
                strokeCap: _strokeCap,
                strokes: snapshot.requireData,
                image: imageTest);
            return CustomPaint(
              painter: painter,
              size: size,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          !_controller.isDismissed
              ? Container(
                  height: 70.0,
                  alignment: FractionalOffset.topRight,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.0, 1.0 - 0 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: const Icon(Icons.save),
                      onPressed: () async {
                        ui.Image renderedImage = await rendered;
                        // bloc.drawEvent.add(TakeCapture(renderedImage));
                        var pngBytes = await renderedImage.toByteData(
                            format: ui.ImageByteFormat.png);

                        await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                    'Demo',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).primaryColor,
                                        letterSpacing: 1.1),
                                  ),
                                  content: Image.memory(
                                      Uint8List.view(pngBytes!.buffer)),
                                ));
                      },
                    ),
                  ),
                )
              : Container(),
          !_controller.isDismissed
              ? Container(
                  height: 70.0,
                  alignment: FractionalOffset.topRight,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.0, 1.0 - 0 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: const Icon(Icons.clear),
                      onPressed: () {
                        bloc.drawEvent.add(ClearEvent());
                      },
                    ),
                  ),
                )
              : Container(),
          !_controller.isDismissed
              ? Container(
                  height: 70.0,
                  alignment: FractionalOffset.topRight,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.0, 1.0 - 1 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: const Icon(Icons.lens),
                      onPressed: () async {
                        var strokeWidth = 0.0;
                        bloc.width.listen((event) {
                          strokeWidth = event;
                        });
                        final newWidth = await showDialog(
                            context: context,
                            builder: (context) =>
                                WidthDialog(strokeWidth: strokeWidth));
                        if (newWidth != null) {
                          bloc.drawEvent.add(StrokeWidthChangeEvent((builder) {
                            builder.width = newWidth;
                          }));
                        }
                      },
                    ),
                  ),
                )
              : Container(),
          !_controller.isDismissed
              ? Container(
                  height: 70.0,
                  alignment: FractionalOffset.topRight,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.0, 1.0 - 2 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: const Icon(Icons.color_lens),
                      onPressed: () async {
                        final newColor = await showDialog(
                          context: context,
                          builder: (context) => ColorDialog(),
                        ) as Color;
                        bloc.drawEvent.add(ColorChangeEvent((builder) {
                          builder
                            ..red = newColor.red
                            ..green = newColor.green
                            ..blue = newColor.blue;
                        }));
                      },
                    ),
                  ),
                )
              : Container(),
          Container(
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    transform:
                        Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                    alignment: FractionalOffset.center,
                    child: const Icon(Icons.brush),
                  );
                },
              ),
              onPressed: () {
                if (_controller.isDismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
            ),
          )
        ].where((widget) => widget != null).toList(),
      ),
    );
  }

  Future<ui.Image> get rendered {
    // [CustomPainter] has its own @canvas to pass our
    // [ui.PictureRecorder] object must be passed to [Canvas]#contructor
    // to capture the Image. This way we can pass @recorder to [Canvas]#contructor
    // using @painter[SignaturePainter] we can call [SignaturePainter]#paint
    // with the our newly created @canvas
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    var sizee = context.size;
    painter.paint(canvas, sizee!);
    return recorder
        .endRecording()
        .toImage(sizee.width.floor(), sizee.height.floor());
  }

  loadUiImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final list = Uint8List.view(data.buffer);
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(list, completer.complete);
    imageTest = await completer.future;

    setState(() {});
  }
}
