part of 'cut_copy_paste_bloc.dart';

abstract class CutCopyPasteEvent extends Equatable {
  const CutCopyPasteEvent();

  @override
  List<Object> get props => [];
}

class CutCopyPasteChangeEvent extends CutCopyPasteEvent {
  final CutCopyPasteModel? cutCopyPasteModel;

  CutCopyPasteChangeEvent({
    this.cutCopyPasteModel,
  });
}

class CutCopyPasteSuccessEvent extends CutCopyPasteEvent {
  CutCopyPasteSuccessEvent();
}
