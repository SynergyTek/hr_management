part of 'user_model_bloc.dart';

abstract class UserModelEvent extends Equatable {
  const UserModelEvent();

  @override
  List<Object> get props => [];
}

class UserModelChangeEvent extends UserModelEvent {
  final LoginResponseModel? userModel;

  UserModelChangeEvent({
    this.userModel,
  });
}
