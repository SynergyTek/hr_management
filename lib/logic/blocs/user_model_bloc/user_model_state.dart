part of 'user_model_bloc.dart';

abstract class UserModelState extends Equatable {
  final LoginResponseModel? userModel;
  final ExtraUserInformationModel? extraUserInformation;

  const UserModelState({
    this.userModel,
    this.extraUserInformation,
  });

  @override
  List<Object> get props => [
        userModel!,
        extraUserInformation!,
      ];
}

class UserModelUserDefinedState extends UserModelState {
  final LoginResponseModel? userModel;
  final ExtraUserInformationModel? extraUserInformation;

  const UserModelUserDefinedState({
    this.userModel,
    this.extraUserInformation,
  });
}
