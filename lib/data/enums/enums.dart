/// ConnectionType enum contains two values:
/// Wifi and mobile (i.e. mobile data from SIM card).
enum ConnectionType {
  wifi,
  mobile,
}

enum TaskFilterOptions {
  TASK_STATUS_DRAFT,
  TASK_STATUS_CANCEL,
  TASK_STATUS_COMPLETE,
  TASK_STATUS_OVERDUE,
  TASK_STATUS_REJECT,
  TASK_STATUS_INPROGRESS,
  ASSIGN_TO,
  ASSIGN_BY,
  SHARE_TO,
}