part of 'cut_copy_paste_bloc.dart';

abstract class CutCopyPasteState extends Equatable {
  final CutCopyPasteModel? cutCopyPasteModel;
  const CutCopyPasteState({
    this.cutCopyPasteModel,
  });

  @override
  List<Object?> get props => [cutCopyPasteModel];
}

// class CutCopyPasteInitial extends CutCopyPasteState {}

class CutCopyPasteUserDefinedState extends CutCopyPasteState {
  final CutCopyPasteModel? cutCopyPasteModel;

  const CutCopyPasteUserDefinedState({
    this.cutCopyPasteModel,
  });
}
