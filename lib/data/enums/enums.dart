/// ConnectionType enum contains two values:
/// Wifi and mobile (i.e. mobile data from SIM card).
enum ConnectionType {
  wifi,
  mobile,
}

enum NTSType {
  service,
  task,
  note,
}

enum FilterType {
  module,
  status,
  role,
  owner,
  assignee,
  serviceOwnedRequested,
}

// Endpoint:
// https://webapidev.aitalkx.com/CHR/query/LoadNoteIndexPageGrid?ownerType=owner&userId=45bba746-3309-49b7-9c03-b5793369d73c&indexPageTemplateId=
enum NoteIndexTableType {
  employeeVisa, // 0fceb7e9-04c2-4ee8-b89f-ecedc588d7e3
  otherDocument, // 86f564be-72db-41ae-a987-095a7d5a19d9
  employeeId, // 1052f8a1-9ca6-4bab-96ac-6221c8f70ea3
  employeeTrainingCourses, // b492b087-4ba1-4a79-ae66-da13d93cc289
  employeeWorkExperience, // 5c1819d4-ae06-40b5-9666-16c8f61b01bd
  employeePassport, // fd8ee3c5-192e-499f-a8a6-5f7a47d9ced0
  employeeEducationalQualification, // 92cabd18-b23e-4217-ae5c-f9027bf99c32
}

Map<NoteIndexTableType, String> noteIndexTableMap = {
  NoteIndexTableType.employeeVisa: "Employee Visa",
  NoteIndexTableType.otherDocument: "Other Document",
  NoteIndexTableType.employeeId: "Employee ID",
  NoteIndexTableType.employeeTrainingCourses: "Employee Training Courses",
  NoteIndexTableType.employeeWorkExperience: "Employee Work Experience",
  NoteIndexTableType.employeePassport: "Employee Passport",
  NoteIndexTableType.employeeEducationalQualification:
      "Employee Education Qualification",
};

enum PortalType {
  CMS,
  DMS,
  HRMS,
  InventoryManagement,
  ProjectManagement,
}
