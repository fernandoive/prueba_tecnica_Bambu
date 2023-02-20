import 'package:flutter/material.dart';
import 'package:gradient_ui_widgets/progress_indicator/gradient_progress_indicator.dart';
import 'package:prueba_tecnica/src/utils/constantes.dart';

class LoadingCircularProgressWidget extends StatelessWidget {
  const LoadingCircularProgressWidget({
    Key? key,
    required this.streamMostrarCircularProgress,
    required this.child,
  }) : super(key: key);

  final Stream<bool> streamMostrarCircularProgress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: streamMostrarCircularProgress,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          bool mostrarCircularProgress = snapshot.data!;

          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: IgnorePointer(
                  ignoring: (mostrarCircularProgress) ? true : false,
                  child: Opacity(
                    opacity: (mostrarCircularProgress) ? 0.5 : 1.0,
                    child: child,
                  ),
                ),
              ),
              (mostrarCircularProgress)
              ? const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: GradientCircularProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueGradient: gradientHabilitado,
                      ),
                    ),
                  ))
              : Container()
        ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
