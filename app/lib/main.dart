import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knam/app.dart';
import 'package:knam/common/clients/markdown_client.dart';
import 'package:knam/common/router/router.dart';
import 'package:knam/features/brightness/brightness_cubit.dart';
import 'package:knam/features/language/language_cubit.dart';
import 'package:provider/provider.dart';

void main() {
  KMRouter.setUrlStrategy();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => KMRouter()..init()),
        Provider(
          create: (_) => MarkdownClient(),
          lazy: false,
        ),
        BlocProvider(create: (_) => LanguageCubit()),
        BlocProvider(create: (_) => BrightnessCubit()),
      ],
      child: const KMApp(),
    ),
  );
}
