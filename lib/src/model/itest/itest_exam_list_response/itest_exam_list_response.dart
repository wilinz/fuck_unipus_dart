import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'itest_exam_list_response.g.dart';

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamListResponse with EquatableMixin {

  ItestExamListResponse(
      {required this.code,
      required this.msg,
      required this.rs});

  @JsonKey(name: "code", defaultValue: 0)
  final int code;

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "rs", defaultValue: ItestExamResult.emptyInstance)
  final ItestExamResult rs;


  factory ItestExamListResponse.fromJson(Map<String, dynamic> json) => _$ItestExamListResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamListResponseToJson(this);
  
  factory ItestExamListResponse.emptyInstance() => ItestExamListResponse(code: 0, msg: "", rs: ItestExamResult.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class RateObjFinal with EquatableMixin {

  RateObjFinal(
      {required this.ratedSectionIds,
      required this.rateItems});

  @JsonKey(name: "ratedSectionIds", defaultValue: [])
  final List ratedSectionIds;

  @JsonKey(name: "rateItems", defaultValue: [])
  final List rateItems;


  factory RateObjFinal.fromJson(Map<String, dynamic> json) => _$RateObjFinalFromJson(json);
  
  Map<String, dynamic> toJson() => _$RateObjFinalToJson(this);
  
  factory RateObjFinal.emptyInstance() => RateObjFinal(ratedSectionIds: [], rateItems: []);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class CanKaoshiJudgeBean with EquatableMixin {

  CanKaoshiJudgeBean(
      {required this.stuCanEnterKaoshi,
      required this.stuCanEnterEnroll,
      required this.stuCanCancelEnroll,
      required this.examCanCountdown,
      this.countdownSeconds,
      this.kaoshiStatusInfo,
      this.kaoshiBtnInfo,
      required this.examType});

  @JsonKey(name: "stuCanEnterKaoshi", defaultValue: false)
  final bool stuCanEnterKaoshi;

  @JsonKey(name: "stuCanEnterEnroll", defaultValue: false)
  final bool stuCanEnterEnroll;

  @JsonKey(name: "stuCanCancelEnroll", defaultValue: false)
  final bool stuCanCancelEnroll;

  @JsonKey(name: "examCanCountdown", defaultValue: false)
  final bool examCanCountdown;

  @JsonKey(name: "countdownSeconds")
  final dynamic countdownSeconds;

  @JsonKey(name: "kaoshiStatusInfo")
  final dynamic kaoshiStatusInfo;

  @JsonKey(name: "kaoshiBtnInfo")
  final dynamic kaoshiBtnInfo;

  @JsonKey(name: "examType", defaultValue: 0)
  final int examType;


  factory CanKaoshiJudgeBean.fromJson(Map<String, dynamic> json) => _$CanKaoshiJudgeBeanFromJson(json);
  
  Map<String, dynamic> toJson() => _$CanKaoshiJudgeBeanToJson(this);
  
  factory CanKaoshiJudgeBean.emptyInstance() => CanKaoshiJudgeBean(stuCanEnterKaoshi: false, stuCanEnterEnroll: false, stuCanCancelEnroll: false, examCanCountdown: false, examType: 0);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class CanViewKaojuanJudgeBean with EquatableMixin {

  CanViewKaojuanJudgeBean(
      {required this.stuCanViewScore,
      required this.scoreText,
      required this.scoreReason,
      required this.stuCanViewKaojuan,
      required this.kaojuanReason,
      required this.canShowPaper});

  @JsonKey(name: "stuCanViewScore", defaultValue: false)
  final bool stuCanViewScore;

  @JsonKey(name: "scoreText", defaultValue: "")
  final String scoreText;

  @JsonKey(name: "scoreReason", defaultValue: "")
  final String scoreReason;

  @JsonKey(name: "stuCanViewKaojuan", defaultValue: false)
  final bool stuCanViewKaojuan;

  @JsonKey(name: "kaojuanReason", defaultValue: "")
  final String kaojuanReason;

  @JsonKey(name: "canShowPaper", defaultValue: 0)
  final int canShowPaper;


  factory CanViewKaojuanJudgeBean.fromJson(Map<String, dynamic> json) => _$CanViewKaojuanJudgeBeanFromJson(json);
  
  Map<String, dynamic> toJson() => _$CanViewKaojuanJudgeBeanToJson(this);
  
  factory CanViewKaojuanJudgeBean.emptyInstance() => CanViewKaojuanJudgeBean(stuCanViewScore: false, scoreText: "", scoreReason: "", stuCanViewKaojuan: false, kaojuanReason: "", canShowPaper: 0);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class DataItem with EquatableMixin {

  DataItem(
      {required this.uid,
      required this.ksdId,
      required this.finish,
      required this.delFlag,
      required this.ksId,
      required this.ksName,
      required this.examCodeFlag,
      this.examType,
      required this.restrictBeginTime,
      required this.restrictEndTime,
      this.beginTime,
      required this.processStep,
      this.enrollStartTime,
      this.enrollEndTime,
      this.ansBeginTime,
      required this.clsId,
      required this.ksLimit,
      required this.checkTime,
      required this.beingOrOver,
      this.countdownSeconds,
      required this.examCanCountdown,
      required this.endayFlag,
      this.realCheckTime,
      required this.rateStatus,
      this.autoRateJson,
      this.rateJson,
      this.ansSubmitTime,
      required this.kcId,
      required this.ksDelFlag,
      required this.enrollDelFlag,
      required this.isNeiWangKs,
      required this.showKaoshiTimeType,
      this.showKaoshiTimeContent,
      required this.enrollMaxStuCount,
      required this.realEnrollStuCount,
      this.kaoshiNote,
      this.kcName,
      required this.checkContentType,
      required this.viewSubMacScorFlag,
      required this.subMacScorFlag,
      this.guidangTime,
      required this.isSupportApp,
      required this.ppId,
      required this.tplId,
      required this.zhiyueFlag,
      required this.examTypeEnum,
      this.postType,
      this.taskMode,
      this.scorePercentage,
      this.finalScoreType,
      this.score,
      this.answerTimes,
      this.standardScore,
      required this.current,
      required this.totalScore,
      required this.examTag,
      required this.skill,
      required this.level,
      required this.mark,
      required this.type,
      this.allowEntryId,
      required this.rateScore,
      this.ksLimitStr,
      this.faceRecognize,
      required this.terminal,
      required this.terminalList,
      required this.cetOralFlag,
      this.hasFaceRecognize,
      this.hasFaceRecognizeCount,
      this.commitment,
      this.rtcFlag,
      required this.captureFlag,
      required this.screenMonitoringFlag,
      required this.competitionFlag,
      required this.recordFlag,
      this.classX,
      required this.rateObjFinal,
      required this.diagnosisExam,
      required this.viewScore,
      this.kaoshiShowTimeForCurrentStu,
      required this.ansBeginAndEndTimeShow,
      required this.enrollStartEndTime,
      required this.examEnrollInfo,
      required this.restrictBeginTimeStr,
      required this.restrictEndTimeStr,
      required this.beginTimeStr,
      required this.enrollStartTimeStr,
      required this.enrollEndTimeStr,
      required this.ansBeginTimeStr,
      required this.ansSubmitTimeStr,
      required this.school,
      required this.task,
      required this.canKaoshiJudgeBean,
      required this.canViewKaojuanJudgeBean,
      required this.ksText});

  @JsonKey(name: "uid", defaultValue: 0)
  final int uid;

  @JsonKey(name: "ksdId", defaultValue: 0)
  final int ksdId;

  @JsonKey(name: "finish", defaultValue: 0)
  final int finish;

  @JsonKey(name: "delFlag", defaultValue: 0)
  final int delFlag;

  @JsonKey(name: "ksId", defaultValue: 0)
  final int ksId;

  @JsonKey(name: "ksName", defaultValue: "")
  final String ksName;

  @JsonKey(name: "examCodeFlag", defaultValue: false)
  final bool examCodeFlag;

  @JsonKey(name: "examType")
  final dynamic examType;

  @JsonKey(name: "restrictBeginTime", defaultValue: 0)
  final int restrictBeginTime;

  @JsonKey(name: "restrictEndTime", defaultValue: 0)
  final int restrictEndTime;

  @JsonKey(name: "beginTime")
  final dynamic beginTime;

  @JsonKey(name: "processStep", defaultValue: 0)
  final int processStep;

  @JsonKey(name: "enrollStartTime")
  final dynamic enrollStartTime;

  @JsonKey(name: "enrollEndTime")
  final dynamic enrollEndTime;

  @JsonKey(name: "ansBeginTime")
  final dynamic ansBeginTime;

  @JsonKey(name: "clsId", defaultValue: 0)
  final int clsId;

  @JsonKey(name: "ksLimit", defaultValue: 0)
  final int ksLimit;

  @JsonKey(name: "checkTime", defaultValue: 0)
  final int checkTime;

  @JsonKey(name: "beingOrOver", defaultValue: 0)
  final int beingOrOver;

  @JsonKey(name: "countdownSeconds")
  final dynamic countdownSeconds;

  @JsonKey(name: "examCanCountdown", defaultValue: false)
  final bool examCanCountdown;

  @JsonKey(name: "endayFlag", defaultValue: 0)
  final int endayFlag;

  @JsonKey(name: "realCheckTime")
  final dynamic realCheckTime;

  @JsonKey(name: "rateStatus", defaultValue: 0)
  final int rateStatus;

  @JsonKey(name: "autoRateJson")
  final dynamic autoRateJson;

  @JsonKey(name: "rateJson")
  final dynamic rateJson;

  @JsonKey(name: "ansSubmitTime")
  final dynamic ansSubmitTime;

  @JsonKey(name: "kcId", defaultValue: 0)
  final int kcId;

  @JsonKey(name: "ksDelFlag", defaultValue: false)
  final bool ksDelFlag;

  @JsonKey(name: "enrollDelFlag", defaultValue: 0)
  final int enrollDelFlag;

  @JsonKey(name: "isNeiWangKs", defaultValue: 0)
  final int isNeiWangKs;

  @JsonKey(name: "showKaoshiTimeType", defaultValue: 0)
  final int showKaoshiTimeType;

  @JsonKey(name: "showKaoshiTimeContent")
  final dynamic showKaoshiTimeContent;

  @JsonKey(name: "enrollMaxStuCount", defaultValue: 0)
  final int enrollMaxStuCount;

  @JsonKey(name: "realEnrollStuCount", defaultValue: 0)
  final int realEnrollStuCount;

  @JsonKey(name: "kaoshiNote")
  final dynamic kaoshiNote;

  @JsonKey(name: "kcName")
  final dynamic kcName;

  @JsonKey(name: "checkContentType", defaultValue: 0)
  final int checkContentType;

  @JsonKey(name: "viewSubMacScorFlag", defaultValue: 0)
  final int viewSubMacScorFlag;

  @JsonKey(name: "subMacScorFlag", defaultValue: 0)
  final int subMacScorFlag;

  @JsonKey(name: "guidangTime")
  final dynamic guidangTime;

  @JsonKey(name: "isSupportApp", defaultValue: 0)
  final int isSupportApp;

  @JsonKey(name: "ppId", defaultValue: 0)
  final int ppId;

  @JsonKey(name: "tplId", defaultValue: 0)
  final int tplId;

  @JsonKey(name: "zhiyueFlag", defaultValue: 0)
  final int zhiyueFlag;

  @JsonKey(name: "examTypeEnum", defaultValue: "")
  final String examTypeEnum;

  @JsonKey(name: "postType")
  final dynamic postType;

  @JsonKey(name: "taskMode")
  final dynamic taskMode;

  @JsonKey(name: "scorePercentage")
  final dynamic scorePercentage;

  @JsonKey(name: "finalScoreType")
  final dynamic finalScoreType;

  @JsonKey(name: "score")
  final dynamic score;

  @JsonKey(name: "answerTimes")
  final dynamic answerTimes;

  @JsonKey(name: "standardScore")
  final dynamic standardScore;

  @JsonKey(name: "current", defaultValue: false)
  final bool current;

  @JsonKey(name: "totalScore", defaultValue: 0)
  final int totalScore;

  @JsonKey(name: "examTag", defaultValue: 0)
  final int examTag;

  @JsonKey(name: "skill", defaultValue: 0)
  final int skill;

  @JsonKey(name: "level", defaultValue: 0)
  final int level;

  @JsonKey(name: "mark", defaultValue: 0)
  final int mark;

  @JsonKey(name: "type", defaultValue: 0)
  final int type;

  @JsonKey(name: "allowEntryId")
  final dynamic allowEntryId;

  @JsonKey(name: "rateScore", defaultValue: 0)
  final int rateScore;

  @JsonKey(name: "ksLimitStr")
  final dynamic ksLimitStr;

  @JsonKey(name: "faceRecognize")
  final dynamic faceRecognize;

  @JsonKey(name: "terminal", defaultValue: 0)
  final int terminal;

  @JsonKey(name: "terminalList", defaultValue: [])
  final List<int> terminalList;

  @JsonKey(name: "cetOralFlag", defaultValue: 0)
  final int cetOralFlag;

  @JsonKey(name: "hasFaceRecognize")
  final dynamic hasFaceRecognize;

  @JsonKey(name: "hasFaceRecognizeCount")
  final dynamic hasFaceRecognizeCount;

  @JsonKey(name: "commitment")
  final dynamic commitment;

  @JsonKey(name: "rtcFlag")
  final dynamic rtcFlag;

  @JsonKey(name: "captureFlag", defaultValue: 0)
  final int captureFlag;

  @JsonKey(name: "screenMonitoringFlag", defaultValue: 0)
  final int screenMonitoringFlag;

  @JsonKey(name: "competitionFlag", defaultValue: 0)
  final int competitionFlag;

  @JsonKey(name: "recordFlag", defaultValue: 0)
  final int recordFlag;

  @JsonKey(name: "class")
  final bool? classX;

  @JsonKey(name: "rateObjFinal", defaultValue: RateObjFinal.emptyInstance)
  final RateObjFinal rateObjFinal;

  @JsonKey(name: "diagnosisExam", defaultValue: false)
  final bool diagnosisExam;

  @JsonKey(name: "viewScore", defaultValue: false)
  final bool viewScore;

  @JsonKey(name: "kaoshiShowTimeForCurrentStu")
  final dynamic kaoshiShowTimeForCurrentStu;

  @JsonKey(name: "ansBeginAndEndTimeShow", defaultValue: "")
  final String ansBeginAndEndTimeShow;

  @JsonKey(name: "enrollStartEndTime", defaultValue: "")
  final String enrollStartEndTime;

  @JsonKey(name: "examEnrollInfo", defaultValue: "")
  final String examEnrollInfo;

  @JsonKey(name: "restrictBeginTimeStr", defaultValue: "")
  final String restrictBeginTimeStr;

  @JsonKey(name: "restrictEndTimeStr", defaultValue: "")
  final String restrictEndTimeStr;

  @JsonKey(name: "beginTimeStr", defaultValue: "")
  final String beginTimeStr;

  @JsonKey(name: "enrollStartTimeStr", defaultValue: "")
  final String enrollStartTimeStr;

  @JsonKey(name: "enrollEndTimeStr", defaultValue: "")
  final String enrollEndTimeStr;

  @JsonKey(name: "ansBeginTimeStr", defaultValue: "")
  final String ansBeginTimeStr;

  @JsonKey(name: "ansSubmitTimeStr", defaultValue: "")
  final String ansSubmitTimeStr;

  @JsonKey(name: "school", defaultValue: false)
  final bool school;

  @JsonKey(name: "task", defaultValue: false)
  final bool task;

  @JsonKey(name: "canKaoshiJudgeBean", defaultValue: CanKaoshiJudgeBean.emptyInstance)
  final CanKaoshiJudgeBean canKaoshiJudgeBean;

  @JsonKey(name: "canViewKaojuanJudgeBean", defaultValue: CanViewKaojuanJudgeBean.emptyInstance)
  final CanViewKaojuanJudgeBean canViewKaojuanJudgeBean;

  @JsonKey(name: "ksText", defaultValue: "")
  final String ksText;


  factory DataItem.fromJson(Map<String, dynamic> json) => _$DataItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataItemToJson(this);
  
  factory DataItem.emptyInstance() => DataItem(uid: 0, ksdId: 0, finish: 0, delFlag: 0, ksId: 0, ksName: "", examCodeFlag: false, restrictBeginTime: 0, restrictEndTime: 0, processStep: 0, clsId: 0, ksLimit: 0, checkTime: 0, beingOrOver: 0, examCanCountdown: false, endayFlag: 0, rateStatus: 0, kcId: 0, ksDelFlag: false, enrollDelFlag: 0, isNeiWangKs: 0, showKaoshiTimeType: 0, enrollMaxStuCount: 0, realEnrollStuCount: 0, checkContentType: 0, viewSubMacScorFlag: 0, subMacScorFlag: 0, isSupportApp: 0, ppId: 0, tplId: 0, zhiyueFlag: 0, examTypeEnum: "", current: false, totalScore: 0, examTag: 0, skill: 0, level: 0, mark: 0, type: 0, rateScore: 0, terminal: 0, terminalList: [], cetOralFlag: 0, captureFlag: 0, screenMonitoringFlag: 0, competitionFlag: 0, recordFlag: 0, rateObjFinal: RateObjFinal.emptyInstance(), diagnosisExam: false, viewScore: false, ansBeginAndEndTimeShow: "", enrollStartEndTime: "", examEnrollInfo: "", restrictBeginTimeStr: "", restrictEndTimeStr: "", beginTimeStr: "", enrollStartTimeStr: "", enrollEndTimeStr: "", ansBeginTimeStr: "", ansSubmitTimeStr: "", school: false, task: false, canKaoshiJudgeBean: CanKaoshiJudgeBean.emptyInstance(), canViewKaojuanJudgeBean: CanViewKaojuanJudgeBean.emptyInstance(), ksText: "");
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class Summary with EquatableMixin {

  Summary(
      {this.diagnosisTrainUnfinishCount,
      this.classTrainUnfinishCount,
      this.mockUnfinishCount,
      this.basisFinishPercentage,
      required this.diagnosisFlag,
      required this.examDoneCount,
      required this.examTodoCount,
      required this.diagnosisReportCount,
      required this.examTotalCount,
      required this.clsNames,
      required this.notDoneExamFlag,
      required this.notDoneTrainFlag,
      this.trainAfterDiagnosisUnFinishCount});

  @JsonKey(name: "diagnosisTrainUnfinishCount")
  final dynamic diagnosisTrainUnfinishCount;

  @JsonKey(name: "classTrainUnfinishCount")
  final dynamic classTrainUnfinishCount;

  @JsonKey(name: "mockUnfinishCount")
  final dynamic mockUnfinishCount;

  @JsonKey(name: "basisFinishPercentage")
  final dynamic basisFinishPercentage;

  @JsonKey(name: "diagnosisFlag", defaultValue: false)
  final bool diagnosisFlag;

  @JsonKey(name: "examDoneCount", defaultValue: 0)
  final int examDoneCount;

  @JsonKey(name: "examTodoCount", defaultValue: 0)
  final int examTodoCount;

  @JsonKey(name: "diagnosisReportCount", defaultValue: 0)
  final int diagnosisReportCount;

  @JsonKey(name: "examTotalCount", defaultValue: 0)
  final int examTotalCount;

  @JsonKey(name: "clsNames", defaultValue: [])
  final List<String> clsNames;

  @JsonKey(name: "notDoneExamFlag", defaultValue: false)
  final bool notDoneExamFlag;

  @JsonKey(name: "notDoneTrainFlag", defaultValue: false)
  final bool notDoneTrainFlag;

  @JsonKey(name: "trainAfterDiagnosisUnFinishCount")
  final dynamic trainAfterDiagnosisUnFinishCount;


  factory Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);
  
  Map<String, dynamic> toJson() => _$SummaryToJson(this);
  
  factory Summary.emptyInstance() => Summary(diagnosisFlag: false, examDoneCount: 0, examTodoCount: 0, diagnosisReportCount: 0, examTotalCount: 0, clsNames: [], notDoneExamFlag: false, notDoneTrainFlag: false);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamResult with EquatableMixin {

  ItestExamResult(
      {required this.pageSize,
      required this.totalNum,
      required this.currentPage,
      required this.totalPage,
      required this.data,
      this.pageInfo,
      required this.summary});

  @JsonKey(name: "pageSize", defaultValue: 0)
  final int pageSize;

  @JsonKey(name: "totalNum", defaultValue: 0)
  final int totalNum;

  @JsonKey(name: "currentPage", defaultValue: 0)
  final int currentPage;

  @JsonKey(name: "totalPage", defaultValue: 0)
  final int totalPage;

  @JsonKey(name: "data", defaultValue: [])
  final List<DataItem> data;

  @JsonKey(name: "pageInfo")
  final dynamic pageInfo;

  @JsonKey(name: "summary", defaultValue: Summary.emptyInstance)
  final Summary summary;


  factory ItestExamResult.fromJson(Map<String, dynamic> json) => _$ItestExamResultFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamResultToJson(this);
  
  factory ItestExamResult.emptyInstance() => ItestExamResult(pageSize: 0, totalNum: 0, currentPage: 0, totalPage: 0, data: [], summary: Summary.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}


