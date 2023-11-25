import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knam/features/brightness/brightness_cubit.dart';

class BrightnessSwitch extends StatelessWidget {
  const BrightnessSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.read<BrightnessCubit>().switchBrightness,
      icon: BlocBuilder<BrightnessCubit, Brightness?>(
        builder: (_, brightness) {
          if (brightness == null) {
            return const SizedBox.shrink();
          }

          return switch (brightness) {
            Brightness.dark => const Icon(Icons.light_mode),
            Brightness.light => const Icon(Icons.dark_mode),
          };
        },
      ),
    );
  }
}
