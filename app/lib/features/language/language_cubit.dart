import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart';
import 'package:knam/features/language/language.dart';

class LanguageCubit extends Cubit<Language> with StateSender {
  LanguageCubit() : super(Language.pl);

  void switchLanguage() => switch (state) {
        Language.en => emit(Language.pl),
        Language.pl => emit(Language.en),
      };
}
