import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/home/presentation/bloc/home_bloc.dart';
import 'package:studia/features/home/presentation/widgets/standard_box.dart';
import 'package:studia/features/home/presentation/widgets/standard_node.dart';

import '../../../../core/data/datasources/local/drift/database.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.isPlayTapped || state.isFirstPlay) {
          NavigatorService.push(
            context,
            AppRoutes.play,
            data: {
              'questions': state.questions,
              'isFirstPlay': state.isFirstPlay,
            },
          );
        }
      },
      builder: (context, state) {
        if (state.isLoading || state.standards_performance.isEmpty) {
          return const LoadingWidget();
        }
        int num = 3;
        double padding = 32.0;
        double width = MediaQuery.of(context).size.width - padding * 2;
        List<Offset> offsets = [];
        for (var i = 0; i < state.standards_performance.length; i++) {
          final x =
              (i ~/ num) % 2 == 0
                  ? padding + i % num / num * (width - 80) + 40
                  : padding + (num - i % num) / num * (width - 80) + 40;
          final y = i * 50 + 25;
          offsets.add(Offset(x.toDouble(), y.toDouble()));
        }
        return Scaffold(
          appBar: CustomAppBarTitle.build(context, 'Home'),
          body: Container(
            alignment: Alignment.center,
            width: double.infinity,
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
                        children: [
                          ...List<Widget>.generate(
                            state.standards_performance.length,
                            (index) {
                              return Container(
                                height: 50,
                                width: double.infinity,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left:
                                          (index ~/ num) % 2 == 0
                                              ? padding +
                                                  index %
                                                      num /
                                                      num *
                                                      (width - 80)
                                              : padding +
                                                  (num - index % num) /
                                                      num *
                                                      (width - 80),
                                      top: 0,
                                      bottom: 0,
                                      child: StandardNode(
                                        type: getStandardType(index, state),
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
                              );
                            },
                          ),
                          if (state.selectedStandard != null)
                            SizedBox(height: 200),
                        ],
                      ),
                    ],
                  ),
                ),
                if (state.selectedStandard != null)
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: StandardBox(
                      state.selectedStandard!,
                      type: getStandardBoxType(state),
                      isMinimized: false,
                      onTapViewInfo: () {
                        NavigatorService.push(
                          context,
                          AppRoutes.info,
                          data: state.selectedStandard,
                        );
                      },
                      onTapPlay: () {
                        context.read<HomeBloc>().add(
                          HomeEvent.onPlayButtonTapped(),
                        );
                      },
                      performance:
                          state.standards_performance[state.selectedStandard]!,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  StandardType getStandardType(int index, HomeState state) {
    final standard = state.standards_performance.keys.toList()[index];

    StandardType type = StandardType.disabled;
    if (state.standards_performance.values.toList()[index] >
        AppMainConstants.learnedThreshold) {
      type = StandardType.completed;
    } else if (state.recommendActions == standard.standard_id) {
      type = StandardType.recommended;
    } else if (state.validActions.contains(standard.standard_id)) {
      type = StandardType.progress;
    } else {
      type = StandardType.disabled;
    }
    return type;
  }

  StandardBoxType getStandardBoxType(HomeState state) {
    if (state.standards_performance[state.selectedStandard]! >
        AppMainConstants.learnedThreshold) {
      return StandardBoxType.done;
    }
    if (state.validActions.contains(state.selectedStandard!.standard_id)) {
      return StandardBoxType.progress;
    }
    return StandardBoxType.disabled;
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
