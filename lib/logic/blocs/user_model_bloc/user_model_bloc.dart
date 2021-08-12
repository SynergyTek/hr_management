import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/data/models/login_models/login_response_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_model_event.dart';
part 'user_model_state.dart';

class UserModelBloc extends Bloc<UserModelEvent, UserModelState>
    with HydratedMixin {
  UserModelBloc()
      : super(
          UserModelUserDefinedState(
            userModel: LoginResponseModel(),
          ),
        ) {
    hydrate();
  }

  @override
  Stream<UserModelState> mapEventToState(
    UserModelEvent event,
  ) async* {
    if (event is UserModelChangeEvent) {
      yield UserModelUserDefinedState(
        userModel: LoginResponseModel(
          companyId: event?.userModel?.companyId ?? null,
          userUniqueId: event?.userModel?.userUniqueId ?? null,
          companyCode: event?.userModel?.companyCode ?? null,
          jobTitle: event?.userModel?.jobTitle ?? null,
          photoId: event?.userModel?.photoId ?? null,
          userRoleIds: event?.userModel?.userRoleIds ?? null,
          userPortals: event?.userModel?.userPortals ?? null,
          userRoleCodes: event?.userModel?.userRoleCodes ?? null,
          companyName: event?.userModel?.companyName ?? null,
          isSystemAdmin: event?.userModel?.isSystemAdmin ?? null,
          isGuestUser: event?.userModel?.isGuestUser ?? null,
          portalId: event?.userModel?.portalId ?? null,
          portalTheme: event?.userModel?.portalTheme ?? null,
          // TODO
          // claims: event?.userModel?.claims ?? null,
          loggedInAsType: event?.userModel?.loggedInAsType ?? null,
          loggedInAsByUserId: event?.userModel?.loggedInAsByUserId ?? null,
          loggedInAsByUserName: event?.userModel?.loggedInAsByUserName ?? null,
          cultureName: event?.userModel?.cultureName ?? null,
          legalEntityId: event?.userModel?.legalEntityId ?? null,
          legalEntityCode: event?.userModel?.legalEntityCode ?? null,
          personId: event?.userModel?.personId ?? null,
          positionId: event?.userModel?.positionId ?? null,
          departmentId: event?.userModel?.departmentId ?? null,
          id: event?.userModel?.id ?? null,
          userName: event?.userModel?.userName ?? null,
          normalizedUserName: event?.userModel?.normalizedUserName ?? null,
          email: event?.userModel?.email ?? null,
          normalizedEmail: event?.userModel?.normalizedEmail ?? null,
          emailConfirmed: event?.userModel?.emailConfirmed ?? null,
          passwordHash: event?.userModel?.passwordHash ?? null,
          securityStamp: event?.userModel?.securityStamp ?? null,
          concurrencyStamp: event?.userModel?.concurrencyStamp ?? null,
          phoneNumber: event?.userModel?.phoneNumber ?? null,
          phoneNumberConfirmed: event?.userModel?.phoneNumberConfirmed ?? null,
          twoFactorEnabled: event?.userModel?.twoFactorEnabled ?? null,
          lockoutEnd: event?.userModel?.lockoutEnd ?? null,
          lockoutEnabled: event?.userModel?.lockoutEnabled ?? null,
          accessFailedCount: event?.userModel?.accessFailedCount ?? null,
        ),
      );
    }
  }

  @override
  UserModelState fromJson(Map<String, dynamic> json) {
    return UserModelUserDefinedState(
      userModel: LoginResponseModel.fromMap(json),
    );
  }

  @override
  Map<String, dynamic> toJson(UserModelState state) {
    return state.userModel.toMap();
  }
}