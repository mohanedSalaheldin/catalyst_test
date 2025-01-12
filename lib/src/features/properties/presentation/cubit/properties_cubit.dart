import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'properties_state.dart';

class PropertiesCubit extends Cubit<PropertiesState> {
  PropertiesCubit() : super(PropertiesInitial());
}
