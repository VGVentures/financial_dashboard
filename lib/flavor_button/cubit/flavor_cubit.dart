import 'package:bloc/bloc.dart';

enum AppFlavor { one, two, three }

class FlavorCubit extends Cubit<AppFlavor> {
  FlavorCubit() : super(AppFlavor.one);

  void select(AppFlavor flavor) => emit(flavor);
}
