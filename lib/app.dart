import 'package:flutter/material.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/painter_bloc.dart';
import 'draw_page.dart';

class DrawApp extends StatelessWidget {
  const DrawApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrawApp',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DrawApp'),
        ),
        body: BlocProvider<PainterBloc>(
          key: UniqueKey(),
          bloc: PainterBloc(),
          child: const DrawPage(),
        ),
      ),
    );
  }
}
