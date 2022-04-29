import 'dart:convert';

TaskSummaryModel tasksummaryModelFromJson(String str) => TaskSummaryModel.fromJson(json.decode(str));

String tasksummaryModelToJson(TaskSummaryModel data) => json.encode(data.toJson());

class TaskSummaryModel {
    TaskSummaryModel({
        this.inProgressCount,
        this.overDueCount,
        this.draftCount,
        this.rejectedCount,
        this.canceledCount,
        this.closedCount,
        this.completedCount,
        this.pending,
        this.completed,
        this.rejected,
    });

    int? inProgressCount;
    int? overDueCount;
    int? draftCount;
    int? rejectedCount;
    int? canceledCount;
    int? closedCount;
    int? completedCount;
    int? pending;
    int? completed;
    int? rejected;

    factory TaskSummaryModel.fromJson(Map<String, dynamic> json) => TaskSummaryModel(
        inProgressCount: json["InProgressCount"],
        overDueCount: json["OverDueCount"],
        draftCount: json["DraftCount"],
        rejectedCount: json["RejectedCount"],
        canceledCount: json["CanceledCount"],
        closedCount: json["ClosedCount"],
        completedCount: json["CompletedCount"],
        pending: json["Pending"],
        completed: json["Completed"],
        rejected: json["Rejected"],
    );

    Map<String, dynamic> toJson() => {
        "InProgressCount": inProgressCount,
        "OverDueCount": overDueCount,
        "DraftCount": draftCount,
        "RejectedCount": rejectedCount,
        "CanceledCount": canceledCount,
        "ClosedCount": closedCount,
        "CompletedCount": completedCount,
        "Pending": pending,
        "Completed": completed,
        "Rejected": rejected,
    };
}
