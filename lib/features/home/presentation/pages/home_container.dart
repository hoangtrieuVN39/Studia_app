import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/home/presentation/bloc/home_bloc.dart';
import 'package:studia/features/home/presentation/widgets/standard_box.dart';
import 'package:studia/features/home/presentation/widgets/standard_node.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading || state.standards_performance.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        int num = 3;
        double padding = 16.0;
        double width = MediaQuery.of(context).size.width - padding * 2;
        List<Offset> offsets = [];
        for (var i = 0; i < state.standards_performance.length; i++) {
          final x =
              (i ~/ num) % 2 == 0
                  ? i % num / num * (width - 80) + 40
                  : (num - i % num) / num * (width - 80) + 40;
          final y = i * 50 + 25;
          offsets.add(Offset(x.toDouble(), y.toDouble()));
        }
        return Scaffold(
          appBar: CustomAppBar.build(context, 'Home'),
          body: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(width, MediaQuery.of(context).size.height),
                          painter: StandardLinesPainter(offsets: offsets),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List<Widget>.generate(
                            state.standards_performance.length,
                            (index) => Container(
                              height: 50,
                              width: double.infinity,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left:
                                        (index ~/ num) % 2 == 0
                                            ? index % num / num * (width - 80)
                                            : (num - index % num) /
                                                num *
                                                (width - 80),
                                    top: 0,
                                    bottom: 0,
                                    child: StandardNode(
                                      type: StandardType.progress,
                                      isSelected:
                                          state.standards_performance.keys
                                              .toList()[index] ==
                                          state.selectedStandard,
                                      onTap: () {
                                        context.read<HomeBloc>().add(
                                          HomeEvent.standardNodeTapped(
                                            state.standards_performance.keys
                                                .toList()[index],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.selectedStandard != null)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: StandardBox(
                        state.selectedStandard!,
                        type: StandardBoxType.progress,
                        isMinimized: false,
                        onTapViewInfo: () {},
                        onTapPlay: () {},
                        performance:
                            state.standards_performance[state
                                .selectedStandard]!,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class StandardLinesPainter extends CustomPainter {
  final List<Offset> offsets;

  StandardLinesPainter({required this.offsets});

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < offsets.length - 1; i++) {
      final offset = offsets[i];
      final offset2 = offsets[i + 1];
      final x = offset.dx;
      final y = offset.dy;
      final x2 = offset2.dx;
      final y2 = offset2.dy;
      canvas.drawLine(Offset(x, y), Offset(x2, y2), _linePaint);
    }
  }

  Paint get _linePaint =>
      Paint()
        ..color = AppColors.orange
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
