import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_cubit.freezed.dart';
part 'monthly_cubit_states.dart';

class MonthlyCubit extends Cubit<MonthlyCubitState> {
  MonthlyCubit() : super(const MonthlyCubitState());
}
