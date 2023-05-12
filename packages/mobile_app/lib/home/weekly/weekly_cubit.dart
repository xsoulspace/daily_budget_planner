import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_cubit.freezed.dart';
part 'weekly_cubit_states.dart';

class WeeklyCubit extends Cubit<WeeklyCubitState> {
  WeeklyCubit() : super(const WeeklyCubitState());
}
