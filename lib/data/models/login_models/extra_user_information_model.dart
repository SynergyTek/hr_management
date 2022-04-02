class ExtraUserInformationModel {
  final bool isSignedIn;
  final String? portalType;

  ExtraUserInformationModel({
    this.isSignedIn = false,
    this.portalType,
  });

  factory ExtraUserInformationModel.fromMap(Map<String, dynamic> map) {
    return ExtraUserInformationModel(
      isSignedIn: map['isSignedIn'],
      portalType: map['portalType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isSignedIn': isSignedIn,
      'portalType': portalType,
    };
  }
}
