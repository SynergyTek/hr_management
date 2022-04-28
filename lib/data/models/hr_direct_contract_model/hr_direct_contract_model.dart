import 'dart:convert';

HrDirectContractModel hrDirectContractModelFromJson(String str) => HrDirectContractModel.fromJson(json.decode(str));

String hrDirectContractModelToJson(HrDirectContractModel data) => json.encode(data.toJson());

class HrDirectContractModel {
    HrDirectContractModel({
        this.assignmentId,
        this.activeTab,
        this.dataAction,
        this.userRoleCodes,
        this.personId,
        this.employeeId,
        this.noteId,
        this.noteContractId,
        this.noteAssignmentId,
        this.notePositionHierarchyId,
        this.noteSalaryInfoId,
        this.noteLocationId,
        this.noteGradeId,
        this.notePositionId,
        this.noteDepartmentId,
        this.noteJobId,
        this.contractId,
        this.positionHierarchyId,
        this.hierarchyId,
        this.salaryInfoId,
        this.employeeContractNoteId,
        this.closingBalance,
        this.personFullName,
        this.iqamahNo,
        this.personStatus,
        this.assignmentTypeCode,
        this.assignmentTypeName,
        this.assignmentStatusId,
        this.assignmentStatusName,
        this.isPrimaryAssignment,
        this.dateOfJoin,
        this.dtDateOfJoin,
        this.assignmentMasterDateOfJoin,
        this.probationPeriod,
        this.probationPeriodName,
        this.probationEndDate,
        this.noticeStartDate,
        this.noticePeriod,
        this.actualTerminationDate,
        this.locationId,
        this.locationName,
        this.gradeId,
        this.gradeName,
        this.jobGrade,
        this.photoId,
        this.userId,
        this.photoVersion,
        this.photoName,
        this.page,
        this.departmentId,
        this.departmentName,
        this.jobId,
        this.jobName,
        this.positionId,
        this.positionName,
        this.positionTitle,
        this.supervisorId,
        this.supervisorName,
        this.remarks,
        this.payAnnualTicketForSelf,
        this.payAnnualTicketForDependent,
        this.ticketDestinationId,
        this.ticketDestination,
        this.classOfTravelId,
        this.disableControl,
        this.sectionId,
        this.sectionName,
        this.legalEntityCode,
        this.email,
        this.workPhone,
        this.workPhoneExtension,
        this.jdNoteId,
        this.personNo,
        this.sponsorshipNo,
        this.sponsorName,
        this.enableRemoteSignIn,
        this.userStatus,
        this.changedData,
        this.effectiveDate,
        this.oldValue,
        this.newValue,
        this.changeStatus,
        this.basicSalary,
        this.annualLeaveEntitlement,
        this.performanceDocumentId,
        this.performanceDocumentName,
        this.pdStartDate,
        this.pdEndDate,
        this.pdStatus,
        this.pdYear,
        this.pdFinalRatingRounded,
        this.pdBonus,
        this.pdIncrement,
        this.pdStage,
        this.goals,
        this.competency,
        this.managerJobName,
        this.managerPersonFullName,
        this.managerUserId,
        this.effectiveStartDate,
        this.effectiveEndDate,
        this.badgeAwardDate,
        this.assessmentName,
        this.assessmentScore,
        this.assessmentStartTime,
        this.criterias,
        this.criteriasList,
        this.badgeName,
        this.badgeDescription,
        this.badgeImage,
        this.certificationName,
        this.certificateReferenceNo,
        this.expiryLicenseDate,
        this.resultScore,
        this.competencyName,
        this.currentDateText,
        this.sponsorLogoId,
        this.sponsorLogo,
        this.finalScore,
        this.finalComments,
        this.assignmentGradeId,
        this.assignmentTypeId,
        this.orgLevel1Id,
        this.orgLevel2Id,
        this.orgLevel3Id,
        this.orgLevel4Id,
        this.brandId,
        this.marketId,
        this.provinceId,
        this.careerLevelId,
        this.contractType,
        this.contractRenewable,
        this.ntsNoteId,
        this.mobile,
        this.managerPhoto,
        this.lineManager,
        this.id,
        this.createdDate,
        this.createdBy,
        this.lastUpdatedDate,
        this.lastUpdatedBy,
        this.isDeleted,
        this.sequenceOrder,
        this.companyId,
        this.status,
        this.versionNo,
    });

    dynamic assignmentId;
    dynamic activeTab;
    int? dataAction;
    List<String>? userRoleCodes;
    dynamic personId;
    dynamic employeeId;
    String? noteId;
    dynamic noteContractId;
    dynamic noteAssignmentId;
    dynamic notePositionHierarchyId;
    dynamic noteSalaryInfoId;
    dynamic noteLocationId;
    dynamic noteGradeId;
    dynamic notePositionId;
    dynamic noteDepartmentId;
    dynamic noteJobId;
    dynamic contractId;
    dynamic positionHierarchyId;
    dynamic hierarchyId;
    dynamic salaryInfoId;
    dynamic employeeContractNoteId;
    dynamic closingBalance;
    dynamic personFullName;
    dynamic iqamahNo;
    dynamic personStatus;
    dynamic assignmentTypeCode;
    dynamic assignmentTypeName;
    dynamic assignmentStatusId;
    dynamic assignmentStatusName;
    bool? isPrimaryAssignment;
    dynamic dateOfJoin;
    DateTime? dtDateOfJoin;
    dynamic assignmentMasterDateOfJoin;
    dynamic probationPeriod;
    dynamic probationPeriodName;
    dynamic probationEndDate;
    dynamic noticeStartDate;
    dynamic noticePeriod;
    dynamic actualTerminationDate;
    dynamic locationId;
    dynamic locationName;
    dynamic gradeId;
    dynamic gradeName;
    dynamic jobGrade;
    dynamic photoId;
    dynamic userId;
    dynamic photoVersion;
    dynamic photoName;
    dynamic page;
    dynamic departmentId;
    dynamic departmentName;
    dynamic jobId;
    dynamic jobName;
    dynamic positionId;
    dynamic positionName;
    dynamic positionTitle;
    dynamic supervisorId;
    dynamic supervisorName;
    dynamic remarks;
    bool? payAnnualTicketForSelf;
    bool? payAnnualTicketForDependent;
    dynamic ticketDestinationId;
    dynamic ticketDestination;
    dynamic classOfTravelId;
    bool? disableControl;
    dynamic sectionId;
    dynamic sectionName;
    dynamic legalEntityCode;
    dynamic email;
    dynamic workPhone;
    dynamic workPhoneExtension;
    dynamic jdNoteId;
    dynamic personNo;
    dynamic sponsorshipNo;
    String? sponsorName;
    dynamic enableRemoteSignIn;
    dynamic userStatus;
    dynamic changedData;
    dynamic effectiveDate;
    dynamic oldValue;
    dynamic newValue;
    dynamic changeStatus;
    dynamic basicSalary;
    String? annualLeaveEntitlement;
    dynamic performanceDocumentId;
    dynamic performanceDocumentName;
    dynamic pdStartDate;
    dynamic pdEndDate;
    dynamic pdStatus;
    dynamic pdYear;
    dynamic pdFinalRatingRounded;
    dynamic pdBonus;
    dynamic pdIncrement;
    dynamic pdStage;
    dynamic goals;
    dynamic competency;
    dynamic managerJobName;
    dynamic managerPersonFullName;
    dynamic managerUserId;
    dynamic effectiveStartDate;
    dynamic effectiveEndDate;
    dynamic badgeAwardDate;
    dynamic assessmentName;
    dynamic assessmentScore;
    dynamic assessmentStartTime;
    dynamic criterias;
    dynamic criteriasList;
    dynamic badgeName;
    dynamic badgeDescription;
    dynamic badgeImage;
    dynamic certificationName;
    dynamic certificateReferenceNo;
    dynamic expiryLicenseDate;
    dynamic resultScore;
    dynamic competencyName;
    dynamic currentDateText;
    dynamic sponsorLogoId;
    dynamic sponsorLogo;
    dynamic finalScore;
    dynamic finalComments;
    dynamic assignmentGradeId;
    dynamic assignmentTypeId;
    dynamic orgLevel1Id;
    dynamic orgLevel2Id;
    dynamic orgLevel3Id;
    dynamic orgLevel4Id;
    dynamic brandId;
    dynamic marketId;
    dynamic provinceId;
    dynamic careerLevelId;
    String? contractType;
    String? contractRenewable;
    dynamic ntsNoteId;
    dynamic mobile;
    dynamic managerPhoto;
    dynamic lineManager;
    dynamic id;
    DateTime? createdDate;
    dynamic createdBy;
    DateTime? lastUpdatedDate;
    dynamic lastUpdatedBy;
    bool? isDeleted;
    dynamic sequenceOrder;
    dynamic companyId;
    int? status;
    int? versionNo;

    factory HrDirectContractModel.fromJson(Map<String, dynamic> json) => HrDirectContractModel(
        assignmentId: json["AssignmentId"],
        activeTab: json["ActiveTab"],
        dataAction: json["DataAction"],
        userRoleCodes: List<String>.from(json["UserRoleCodes"].map((x) => x)),
        personId: json["PersonId"],
        employeeId: json["EmployeeId"],
        noteId: json["NoteId"],
        noteContractId: json["NoteContractId"],
        noteAssignmentId: json["NoteAssignmentId"],
        notePositionHierarchyId: json["NotePositionHierarchyId"],
        noteSalaryInfoId: json["NoteSalaryInfoId"],
        noteLocationId: json["NoteLocationId"],
        noteGradeId: json["NoteGradeId"],
        notePositionId: json["NotePositionId"],
        noteDepartmentId: json["NoteDepartmentId"],
        noteJobId: json["NoteJobId"],
        contractId: json["ContractId"],
        positionHierarchyId: json["PositionHierarchyId"],
        hierarchyId: json["HierarchyId"],
        salaryInfoId: json["SalaryInfoId"],
        employeeContractNoteId: json["EmployeeContractNoteId"],
        closingBalance: json["ClosingBalance"],
        personFullName: json["PersonFullName"],
        iqamahNo: json["IqamahNo"],
        personStatus: json["PersonStatus"],
        assignmentTypeCode: json["AssignmentTypeCode"],
        assignmentTypeName: json["AssignmentTypeName"],
        assignmentStatusId: json["AssignmentStatusId"],
        assignmentStatusName: json["AssignmentStatusName"],
        isPrimaryAssignment: json["IsPrimaryAssignment"],
        dateOfJoin: json["DateOfJoin"],
        dtDateOfJoin: DateTime.parse(json["DTDateOfJoin"]),
        assignmentMasterDateOfJoin: json["AssignmentMasterDateOfJoin"],
        probationPeriod: json["ProbationPeriod"],
        probationPeriodName: json["ProbationPeriodName"],
        probationEndDate: json["ProbationEndDate"],
        noticeStartDate: json["NoticeStartDate"],
        noticePeriod: json["NoticePeriod"],
        actualTerminationDate: json["ActualTerminationDate"],
        locationId: json["LocationId"],
        locationName: json["LocationName"],
        gradeId: json["GradeId"],
        gradeName: json["GradeName"],
        jobGrade: json["JobGrade"],
        photoId: json["PhotoId"],
        userId: json["UserId"],
        photoVersion: json["PhotoVersion"],
        photoName: json["PhotoName"],
        page: json["Page"],
        departmentId: json["DepartmentId"],
        departmentName: json["DepartmentName"],
        jobId: json["JobId"],
        jobName: json["JobName"],
        positionId: json["PositionId"],
        positionName: json["PositionName"],
        positionTitle: json["PositionTitle"],
        supervisorId: json["SupervisorId"],
        supervisorName: json["SupervisorName"],
        remarks: json["Remarks"],
        payAnnualTicketForSelf: json["PayAnnualTicketForSelf"],
        payAnnualTicketForDependent: json["PayAnnualTicketForDependent"],
        ticketDestinationId: json["TicketDestinationId"],
        ticketDestination: json["TicketDestination"],
        classOfTravelId: json["ClassOfTravelId"],
        disableControl: json["DisableControl"],
        sectionId: json["SectionId"],
        sectionName: json["SectionName"],
        legalEntityCode: json["LegalEntityCode"],
        email: json["Email"],
        workPhone: json["WorkPhone"],
        workPhoneExtension: json["WorkPhoneExtension"],
        jdNoteId: json["JDNoteId"],
        personNo: json["PersonNo"],
        sponsorshipNo: json["SponsorshipNo"],
        sponsorName: json["SponsorName"],
        enableRemoteSignIn: json["EnableRemoteSignIn"],
        userStatus: json["UserStatus"],
        changedData: json["ChangedData"],
        effectiveDate: json["EffectiveDate"],
        oldValue: json["OldValue"],
        newValue: json["NewValue"],
        changeStatus: json["ChangeStatus"],
        basicSalary: json["BasicSalary"],
        annualLeaveEntitlement: json["AnnualLeaveEntitlement"],
        performanceDocumentId: json["PerformanceDocumentId"],
        performanceDocumentName: json["PerformanceDocumentName"],
        pdStartDate: json["PDStartDate"],
        pdEndDate: json["PDEndDate"],
        pdStatus: json["PDStatus"],
        pdYear: json["PDYear"],
        pdFinalRatingRounded: json["PDFinalRatingRounded"],
        pdBonus: json["PDBonus"],
        pdIncrement: json["PDIncrement"],
        pdStage: json["PDStage"],
        goals: json["Goals"],
        competency: json["Competency"],
        managerJobName: json["ManagerJobName"],
        managerPersonFullName: json["ManagerPersonFullName"],
        managerUserId: json["ManagerUserId"],
        effectiveStartDate: json["EffectiveStartDate"],
        effectiveEndDate: json["EffectiveEndDate"],
        badgeAwardDate: json["BadgeAwardDate"],
        assessmentName: json["AssessmentName"],
        assessmentScore: json["AssessmentScore"],
        assessmentStartTime: json["AssessmentStartTime"],
        criterias: json["Criterias"],
        criteriasList: json["CriteriasList"],
        badgeName: json["BadgeName"],
        badgeDescription: json["BadgeDescription"],
        badgeImage: json["BadgeImage"],
        certificationName: json["CertificationName"],
        certificateReferenceNo: json["CertificateReferenceNo"],
        expiryLicenseDate: json["ExpiryLicenseDate"],
        resultScore: json["ResultScore"],
        competencyName: json["CompetencyName"],
        currentDateText: json["CurrentDateText"],
        sponsorLogoId: json["SponsorLogoId"],
        sponsorLogo: json["SponsorLogo"],
        finalScore: json["FinalScore"],
        finalComments: json["FinalComments"],
        assignmentGradeId: json["AssignmentGradeId"],
        assignmentTypeId: json["AssignmentTypeId"],
        orgLevel1Id: json["OrgLevel1Id"],
        orgLevel2Id: json["OrgLevel2Id"],
        orgLevel3Id: json["OrgLevel3Id"],
        orgLevel4Id: json["OrgLevel4Id"],
        brandId: json["BrandId"],
        marketId: json["MarketId"],
        provinceId: json["ProvinceId"],
        careerLevelId: json["CareerLevelId"],
        contractType: json["ContractType"],
        contractRenewable: json["ContractRenewable"],
        ntsNoteId: json["NtsNoteId"],
        mobile: json["Mobile"],
        managerPhoto: json["ManagerPhoto"],
        lineManager: json["LineManager"],
        id: json["Id"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        lastUpdatedDate: DateTime.parse(json["LastUpdatedDate"]),
        lastUpdatedBy: json["LastUpdatedBy"],
        isDeleted: json["IsDeleted"],
        sequenceOrder: json["SequenceOrder"],
        companyId: json["CompanyId"],
        status: json["Status"],
        versionNo: json["VersionNo"],
    );

    Map<String, dynamic> toJson() => {
        "AssignmentId": assignmentId,
        "ActiveTab": activeTab,
        "DataAction": dataAction,
        "UserRoleCodes": List<dynamic>.from(userRoleCodes!.map((x) => x)),
        "PersonId": personId,
        "EmployeeId": employeeId,
        "NoteId": noteId,
        "NoteContractId": noteContractId,
        "NoteAssignmentId": noteAssignmentId,
        "NotePositionHierarchyId": notePositionHierarchyId,
        "NoteSalaryInfoId": noteSalaryInfoId,
        "NoteLocationId": noteLocationId,
        "NoteGradeId": noteGradeId,
        "NotePositionId": notePositionId,
        "NoteDepartmentId": noteDepartmentId,
        "NoteJobId": noteJobId,
        "ContractId": contractId,
        "PositionHierarchyId": positionHierarchyId,
        "HierarchyId": hierarchyId,
        "SalaryInfoId": salaryInfoId,
        "EmployeeContractNoteId": employeeContractNoteId,
        "ClosingBalance": closingBalance,
        "PersonFullName": personFullName,
        "IqamahNo": iqamahNo,
        "PersonStatus": personStatus,
        "AssignmentTypeCode": assignmentTypeCode,
        "AssignmentTypeName": assignmentTypeName,
        "AssignmentStatusId": assignmentStatusId,
        "AssignmentStatusName": assignmentStatusName,
        "IsPrimaryAssignment": isPrimaryAssignment,
        "DateOfJoin": dateOfJoin,
        "DTDateOfJoin": dtDateOfJoin?.toIso8601String(),
        "AssignmentMasterDateOfJoin": assignmentMasterDateOfJoin,
        "ProbationPeriod": probationPeriod,
        "ProbationPeriodName": probationPeriodName,
        "ProbationEndDate": probationEndDate,
        "NoticeStartDate": noticeStartDate,
        "NoticePeriod": noticePeriod,
        "ActualTerminationDate": actualTerminationDate,
        "LocationId": locationId,
        "LocationName": locationName,
        "GradeId": gradeId,
        "GradeName": gradeName,
        "JobGrade": jobGrade,
        "PhotoId": photoId,
        "UserId": userId,
        "PhotoVersion": photoVersion,
        "PhotoName": photoName,
        "Page": page,
        "DepartmentId": departmentId,
        "DepartmentName": departmentName,
        "JobId": jobId,
        "JobName": jobName,
        "PositionId": positionId,
        "PositionName": positionName,
        "PositionTitle": positionTitle,
        "SupervisorId": supervisorId,
        "SupervisorName": supervisorName,
        "Remarks": remarks,
        "PayAnnualTicketForSelf": payAnnualTicketForSelf,
        "PayAnnualTicketForDependent": payAnnualTicketForDependent,
        "TicketDestinationId": ticketDestinationId,
        "TicketDestination": ticketDestination,
        "ClassOfTravelId": classOfTravelId,
        "DisableControl": disableControl,
        "SectionId": sectionId,
        "SectionName": sectionName,
        "LegalEntityCode": legalEntityCode,
        "Email": email,
        "WorkPhone": workPhone,
        "WorkPhoneExtension": workPhoneExtension,
        "JDNoteId": jdNoteId,
        "PersonNo": personNo,
        "SponsorshipNo": sponsorshipNo,
        "SponsorName": sponsorName,
        "EnableRemoteSignIn": enableRemoteSignIn,
        "UserStatus": userStatus,
        "ChangedData": changedData,
        "EffectiveDate": effectiveDate,
        "OldValue": oldValue,
        "NewValue": newValue,
        "ChangeStatus": changeStatus,
        "BasicSalary": basicSalary,
        "AnnualLeaveEntitlement": annualLeaveEntitlement,
        "PerformanceDocumentId": performanceDocumentId,
        "PerformanceDocumentName": performanceDocumentName,
        "PDStartDate": pdStartDate,
        "PDEndDate": pdEndDate,
        "PDStatus": pdStatus,
        "PDYear": pdYear,
        "PDFinalRatingRounded": pdFinalRatingRounded,
        "PDBonus": pdBonus,
        "PDIncrement": pdIncrement,
        "PDStage": pdStage,
        "Goals": goals,
        "Competency": competency,
        "ManagerJobName": managerJobName,
        "ManagerPersonFullName": managerPersonFullName,
        "ManagerUserId": managerUserId,
        "EffectiveStartDate": effectiveStartDate,
        "EffectiveEndDate": effectiveEndDate,
        "BadgeAwardDate": badgeAwardDate,
        "AssessmentName": assessmentName,
        "AssessmentScore": assessmentScore,
        "AssessmentStartTime": assessmentStartTime,
        "Criterias": criterias,
        "CriteriasList": criteriasList,
        "BadgeName": badgeName,
        "BadgeDescription": badgeDescription,
        "BadgeImage": badgeImage,
        "CertificationName": certificationName,
        "CertificateReferenceNo": certificateReferenceNo,
        "ExpiryLicenseDate": expiryLicenseDate,
        "ResultScore": resultScore,
        "CompetencyName": competencyName,
        "CurrentDateText": currentDateText,
        "SponsorLogoId": sponsorLogoId,
        "SponsorLogo": sponsorLogo,
        "FinalScore": finalScore,
        "FinalComments": finalComments,
        "AssignmentGradeId": assignmentGradeId,
        "AssignmentTypeId": assignmentTypeId,
        "OrgLevel1Id": orgLevel1Id,
        "OrgLevel2Id": orgLevel2Id,
        "OrgLevel3Id": orgLevel3Id,
        "OrgLevel4Id": orgLevel4Id,
        "BrandId": brandId,
        "MarketId": marketId,
        "ProvinceId": provinceId,
        "CareerLevelId": careerLevelId,
        "ContractType": contractType,
        "ContractRenewable": contractRenewable,
        "NtsNoteId": ntsNoteId,
        "Mobile": mobile,
        "ManagerPhoto": managerPhoto,
        "LineManager": lineManager,
        "Id": id,
        "CreatedDate": createdDate?.toIso8601String(),
        "CreatedBy": createdBy,
        "LastUpdatedDate": lastUpdatedDate?.toIso8601String(),
        "LastUpdatedBy": lastUpdatedBy,
        "IsDeleted": isDeleted,
        "SequenceOrder": sequenceOrder,
        "CompanyId": companyId,
        "Status": status,
        "VersionNo": versionNo,
    };
}
