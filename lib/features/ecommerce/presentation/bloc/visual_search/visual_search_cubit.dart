import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'visual_search_state.dart';

class VisualSearchCubit extends Cubit<VisualSearchState> {
  VisualSearchCubit() : super(VisualSearchInitial());
}
