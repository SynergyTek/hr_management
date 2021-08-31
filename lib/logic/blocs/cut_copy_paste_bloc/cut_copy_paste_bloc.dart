import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_management/data/models/cut_copy_paste_model/cut_copy_paste_model.dart';

part 'cut_copy_paste_event.dart';
part 'cut_copy_paste_state.dart';

class CutCopyPasteBloc extends Bloc<CutCopyPasteEvent, CutCopyPasteState> {
  CutCopyPasteBloc()
      : super(
          CutCopyPasteUserDefinedState(
            cutCopyPasteModel: CutCopyPasteModel(
              sourceId: null,
              isCopy: false,
              isCut: false,
            ),
          ),
        );

  @override
  Stream<CutCopyPasteState> mapEventToState(
    CutCopyPasteEvent event,
  ) async* {
    if (event is CutCopyPasteChangeEvent) {
      yield CutCopyPasteUserDefinedState(
        cutCopyPasteModel: CutCopyPasteModel(
          sourceId: event?.cutCopyPasteModel?.sourceId ?? null,
          isCopy: event?.cutCopyPasteModel?.isCopy ?? false,
          isCut: event?.cutCopyPasteModel?.isCut ?? false,
        ),
      );
    } else if (event is CutCopyPasteSuccessEvent) {
      yield CutCopyPasteUserDefinedState(
        cutCopyPasteModel: CutCopyPasteModel(
          sourceId: null,
          isCopy: false,
          isCut: false,
        ),
      );
    }
  }
}
