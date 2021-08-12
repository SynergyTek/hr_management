part of 'user_model_bloc.dart';

abstract class UserModelState extends Equatable {
  final LoginResponseModel userModel;

  const UserModelState({
    this.userModel,
  });

  @override
  List<Object> get props => [userModel];
}

class UserModelUserDefinedState extends UserModelState {
  final LoginResponseModel userModel;

  const UserModelUserDefinedState({
    @required this.userModel,
  });
}
