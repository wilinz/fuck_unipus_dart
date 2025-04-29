// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itest_exam_list_response.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ItestExamListResponseAutoequal on ItestExamListResponse {
  List<Object?> get _$props => [code, msg, rs];
}

extension _$RateObjFinalAutoequal on RateObjFinal {
  List<Object?> get _$props => [ratedSectionIds, rateItems];
}

extension _$CanKaoshiJudgeBeanAutoequal on CanKaoshiJudgeBean {
  List<Object?> get _$props => [
    stuCanEnterKaoshi,
    stuCanEnterEnroll,
    stuCanCancelEnroll,
    examCanCountdown,
    countdownSeconds,
    kaoshiStatusInfo,
    kaoshiBtnInfo,
    examType,
  ];
}

extension _$CanViewKaojuanJudgeBeanAutoequal on CanViewKaojuanJudgeBean {
  List<Object?> get _$props => [
    stuCanViewScore,
    scoreText,
    scoreReason,
    stuCanViewKaojuan,
    kaojuanReason,
    canShowPaper,
  ];
}

extension _$DataItemAutoequal on DataItem {
  List<Object?> get _$props => [
    uid,
    ksdId,
    finish,
    delFlag,
    ksId,
    ksName,
    examCodeFlag,
    examType,
    restrictBeginTime,
    restrictEndTime,
    beginTime,
    processStep,
    enrollStartTime,
    enrollEndTime,
    ansBeginTime,
    clsId,
    ksLimit,
    checkTime,
    beingOrOver,
    countdownSeconds,
    examCanCountdown,
    endayFlag,
    realCheckTime,
    rateStatus,
    autoRateJson,
    rateJson,
    ansSubmitTime,
    kcId,
    ksDelFlag,
    enrollDelFlag,
    isNeiWangKs,
    showKaoshiTimeType,
    showKaoshiTimeContent,
    enrollMaxStuCount,
    realEnrollStuCount,
    kaoshiNote,
    kcName,
    checkContentType,
    viewSubMacScorFlag,
    subMacScorFlag,
    guidangTime,
    isSupportApp,
    ppId,
    tplId,
    zhiyueFlag,
    examTypeEnum,
    postType,
    taskMode,
    scorePercentage,
    finalScoreType,
    score,
    answerTimes,
    standardScore,
    current,
    totalScore,
    examTag,
    skill,
    level,
    mark,
    type,
    allowEntryId,
    rateScore,
    ksLimitStr,
    faceRecognize,
    terminal,
    terminalList,
    cetOralFlag,
    hasFaceRecognize,
    hasFaceRecognizeCount,
    commitment,
    rtcFlag,
    captureFlag,
    screenMonitoringFlag,
    competitionFlag,
    recordFlag,
    classX,
    rateObjFinal,
    diagnosisExam,
    viewScore,
    kaoshiShowTimeForCurrentStu,
    ansBeginAndEndTimeShow,
    enrollStartEndTime,
    examEnrollInfo,
    restrictBeginTimeStr,
    restrictEndTimeStr,
    beginTimeStr,
    enrollStartTimeStr,
    enrollEndTimeStr,
    ansBeginTimeStr,
    ansSubmitTimeStr,
    school,
    task,
    canKaoshiJudgeBean,
    canViewKaojuanJudgeBean,
    ksText,
  ];
}

extension _$SummaryAutoequal on Summary {
  List<Object?> get _$props => [
    diagnosisTrainUnfinishCount,
    classTrainUnfinishCount,
    mockUnfinishCount,
    basisFinishPercentage,
    diagnosisFlag,
    examDoneCount,
    examTodoCount,
    diagnosisReportCount,
    examTotalCount,
    clsNames,
    notDoneExamFlag,
    notDoneTrainFlag,
    trainAfterDiagnosisUnFinishCount,
  ];
}

extension _$ItestExamResultAutoequal on ItestExamResult {
  List<Object?> get _$props => [
    pageSize,
    totalNum,
    currentPage,
    totalPage,
    data,
    pageInfo,
    summary,
  ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItestExamListResponseCWProxy {
  ItestExamListResponse code(int code);

  ItestExamListResponse msg(String msg);

  ItestExamListResponse rs(ItestExamResult rs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamListResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamListResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamListResponse call({int code, String msg, ItestExamResult rs});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItestExamListResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItestExamListResponse.copyWith.fieldName(...)`
class _$ItestExamListResponseCWProxyImpl
    implements _$ItestExamListResponseCWProxy {
  const _$ItestExamListResponseCWProxyImpl(this._value);

  final ItestExamListResponse _value;

  @override
  ItestExamListResponse code(int code) => this(code: code);

  @override
  ItestExamListResponse msg(String msg) => this(msg: msg);

  @override
  ItestExamListResponse rs(ItestExamResult rs) => this(rs: rs);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamListResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamListResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamListResponse call({
    Object? code = const $CopyWithPlaceholder(),
    Object? msg = const $CopyWithPlaceholder(),
    Object? rs = const $CopyWithPlaceholder(),
  }) {
    return ItestExamListResponse(
      code:
          code == const $CopyWithPlaceholder()
              ? _value.code
              // ignore: cast_nullable_to_non_nullable
              : code as int,
      msg:
          msg == const $CopyWithPlaceholder()
              ? _value.msg
              // ignore: cast_nullable_to_non_nullable
              : msg as String,
      rs:
          rs == const $CopyWithPlaceholder()
              ? _value.rs
              // ignore: cast_nullable_to_non_nullable
              : rs as ItestExamResult,
    );
  }
}

extension $ItestExamListResponseCopyWith on ItestExamListResponse {
  /// Returns a callable class that can be used as follows: `instanceOfItestExamListResponse.copyWith(...)` or like so:`instanceOfItestExamListResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItestExamListResponseCWProxy get copyWith =>
      _$ItestExamListResponseCWProxyImpl(this);
}

abstract class _$RateObjFinalCWProxy {
  RateObjFinal ratedSectionIds(List<dynamic> ratedSectionIds);

  RateObjFinal rateItems(List<dynamic> rateItems);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RateObjFinal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RateObjFinal(...).copyWith(id: 12, name: "My name")
  /// ````
  RateObjFinal call({List<dynamic> ratedSectionIds, List<dynamic> rateItems});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRateObjFinal.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRateObjFinal.copyWith.fieldName(...)`
class _$RateObjFinalCWProxyImpl implements _$RateObjFinalCWProxy {
  const _$RateObjFinalCWProxyImpl(this._value);

  final RateObjFinal _value;

  @override
  RateObjFinal ratedSectionIds(List<dynamic> ratedSectionIds) =>
      this(ratedSectionIds: ratedSectionIds);

  @override
  RateObjFinal rateItems(List<dynamic> rateItems) => this(rateItems: rateItems);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RateObjFinal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RateObjFinal(...).copyWith(id: 12, name: "My name")
  /// ````
  RateObjFinal call({
    Object? ratedSectionIds = const $CopyWithPlaceholder(),
    Object? rateItems = const $CopyWithPlaceholder(),
  }) {
    return RateObjFinal(
      ratedSectionIds:
          ratedSectionIds == const $CopyWithPlaceholder()
              ? _value.ratedSectionIds
              // ignore: cast_nullable_to_non_nullable
              : ratedSectionIds as List<dynamic>,
      rateItems:
          rateItems == const $CopyWithPlaceholder()
              ? _value.rateItems
              // ignore: cast_nullable_to_non_nullable
              : rateItems as List<dynamic>,
    );
  }
}

extension $RateObjFinalCopyWith on RateObjFinal {
  /// Returns a callable class that can be used as follows: `instanceOfRateObjFinal.copyWith(...)` or like so:`instanceOfRateObjFinal.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RateObjFinalCWProxy get copyWith => _$RateObjFinalCWProxyImpl(this);
}

abstract class _$CanKaoshiJudgeBeanCWProxy {
  CanKaoshiJudgeBean stuCanEnterKaoshi(bool stuCanEnterKaoshi);

  CanKaoshiJudgeBean stuCanEnterEnroll(bool stuCanEnterEnroll);

  CanKaoshiJudgeBean stuCanCancelEnroll(bool stuCanCancelEnroll);

  CanKaoshiJudgeBean examCanCountdown(bool examCanCountdown);

  CanKaoshiJudgeBean countdownSeconds(dynamic countdownSeconds);

  CanKaoshiJudgeBean kaoshiStatusInfo(dynamic kaoshiStatusInfo);

  CanKaoshiJudgeBean kaoshiBtnInfo(dynamic kaoshiBtnInfo);

  CanKaoshiJudgeBean examType(int examType);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CanKaoshiJudgeBean(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CanKaoshiJudgeBean(...).copyWith(id: 12, name: "My name")
  /// ````
  CanKaoshiJudgeBean call({
    bool stuCanEnterKaoshi,
    bool stuCanEnterEnroll,
    bool stuCanCancelEnroll,
    bool examCanCountdown,
    dynamic countdownSeconds,
    dynamic kaoshiStatusInfo,
    dynamic kaoshiBtnInfo,
    int examType,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCanKaoshiJudgeBean.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCanKaoshiJudgeBean.copyWith.fieldName(...)`
class _$CanKaoshiJudgeBeanCWProxyImpl implements _$CanKaoshiJudgeBeanCWProxy {
  const _$CanKaoshiJudgeBeanCWProxyImpl(this._value);

  final CanKaoshiJudgeBean _value;

  @override
  CanKaoshiJudgeBean stuCanEnterKaoshi(bool stuCanEnterKaoshi) =>
      this(stuCanEnterKaoshi: stuCanEnterKaoshi);

  @override
  CanKaoshiJudgeBean stuCanEnterEnroll(bool stuCanEnterEnroll) =>
      this(stuCanEnterEnroll: stuCanEnterEnroll);

  @override
  CanKaoshiJudgeBean stuCanCancelEnroll(bool stuCanCancelEnroll) =>
      this(stuCanCancelEnroll: stuCanCancelEnroll);

  @override
  CanKaoshiJudgeBean examCanCountdown(bool examCanCountdown) =>
      this(examCanCountdown: examCanCountdown);

  @override
  CanKaoshiJudgeBean countdownSeconds(dynamic countdownSeconds) =>
      this(countdownSeconds: countdownSeconds);

  @override
  CanKaoshiJudgeBean kaoshiStatusInfo(dynamic kaoshiStatusInfo) =>
      this(kaoshiStatusInfo: kaoshiStatusInfo);

  @override
  CanKaoshiJudgeBean kaoshiBtnInfo(dynamic kaoshiBtnInfo) =>
      this(kaoshiBtnInfo: kaoshiBtnInfo);

  @override
  CanKaoshiJudgeBean examType(int examType) => this(examType: examType);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CanKaoshiJudgeBean(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CanKaoshiJudgeBean(...).copyWith(id: 12, name: "My name")
  /// ````
  CanKaoshiJudgeBean call({
    Object? stuCanEnterKaoshi = const $CopyWithPlaceholder(),
    Object? stuCanEnterEnroll = const $CopyWithPlaceholder(),
    Object? stuCanCancelEnroll = const $CopyWithPlaceholder(),
    Object? examCanCountdown = const $CopyWithPlaceholder(),
    Object? countdownSeconds = const $CopyWithPlaceholder(),
    Object? kaoshiStatusInfo = const $CopyWithPlaceholder(),
    Object? kaoshiBtnInfo = const $CopyWithPlaceholder(),
    Object? examType = const $CopyWithPlaceholder(),
  }) {
    return CanKaoshiJudgeBean(
      stuCanEnterKaoshi:
          stuCanEnterKaoshi == const $CopyWithPlaceholder()
              ? _value.stuCanEnterKaoshi
              // ignore: cast_nullable_to_non_nullable
              : stuCanEnterKaoshi as bool,
      stuCanEnterEnroll:
          stuCanEnterEnroll == const $CopyWithPlaceholder()
              ? _value.stuCanEnterEnroll
              // ignore: cast_nullable_to_non_nullable
              : stuCanEnterEnroll as bool,
      stuCanCancelEnroll:
          stuCanCancelEnroll == const $CopyWithPlaceholder()
              ? _value.stuCanCancelEnroll
              // ignore: cast_nullable_to_non_nullable
              : stuCanCancelEnroll as bool,
      examCanCountdown:
          examCanCountdown == const $CopyWithPlaceholder()
              ? _value.examCanCountdown
              // ignore: cast_nullable_to_non_nullable
              : examCanCountdown as bool,
      countdownSeconds:
          countdownSeconds == const $CopyWithPlaceholder()
              ? _value.countdownSeconds
              // ignore: cast_nullable_to_non_nullable
              : countdownSeconds as dynamic,
      kaoshiStatusInfo:
          kaoshiStatusInfo == const $CopyWithPlaceholder()
              ? _value.kaoshiStatusInfo
              // ignore: cast_nullable_to_non_nullable
              : kaoshiStatusInfo as dynamic,
      kaoshiBtnInfo:
          kaoshiBtnInfo == const $CopyWithPlaceholder()
              ? _value.kaoshiBtnInfo
              // ignore: cast_nullable_to_non_nullable
              : kaoshiBtnInfo as dynamic,
      examType:
          examType == const $CopyWithPlaceholder()
              ? _value.examType
              // ignore: cast_nullable_to_non_nullable
              : examType as int,
    );
  }
}

extension $CanKaoshiJudgeBeanCopyWith on CanKaoshiJudgeBean {
  /// Returns a callable class that can be used as follows: `instanceOfCanKaoshiJudgeBean.copyWith(...)` or like so:`instanceOfCanKaoshiJudgeBean.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CanKaoshiJudgeBeanCWProxy get copyWith =>
      _$CanKaoshiJudgeBeanCWProxyImpl(this);
}

abstract class _$CanViewKaojuanJudgeBeanCWProxy {
  CanViewKaojuanJudgeBean stuCanViewScore(bool stuCanViewScore);

  CanViewKaojuanJudgeBean scoreText(String scoreText);

  CanViewKaojuanJudgeBean scoreReason(String scoreReason);

  CanViewKaojuanJudgeBean stuCanViewKaojuan(bool stuCanViewKaojuan);

  CanViewKaojuanJudgeBean kaojuanReason(String kaojuanReason);

  CanViewKaojuanJudgeBean canShowPaper(int canShowPaper);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CanViewKaojuanJudgeBean(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CanViewKaojuanJudgeBean(...).copyWith(id: 12, name: "My name")
  /// ````
  CanViewKaojuanJudgeBean call({
    bool stuCanViewScore,
    String scoreText,
    String scoreReason,
    bool stuCanViewKaojuan,
    String kaojuanReason,
    int canShowPaper,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCanViewKaojuanJudgeBean.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCanViewKaojuanJudgeBean.copyWith.fieldName(...)`
class _$CanViewKaojuanJudgeBeanCWProxyImpl
    implements _$CanViewKaojuanJudgeBeanCWProxy {
  const _$CanViewKaojuanJudgeBeanCWProxyImpl(this._value);

  final CanViewKaojuanJudgeBean _value;

  @override
  CanViewKaojuanJudgeBean stuCanViewScore(bool stuCanViewScore) =>
      this(stuCanViewScore: stuCanViewScore);

  @override
  CanViewKaojuanJudgeBean scoreText(String scoreText) =>
      this(scoreText: scoreText);

  @override
  CanViewKaojuanJudgeBean scoreReason(String scoreReason) =>
      this(scoreReason: scoreReason);

  @override
  CanViewKaojuanJudgeBean stuCanViewKaojuan(bool stuCanViewKaojuan) =>
      this(stuCanViewKaojuan: stuCanViewKaojuan);

  @override
  CanViewKaojuanJudgeBean kaojuanReason(String kaojuanReason) =>
      this(kaojuanReason: kaojuanReason);

  @override
  CanViewKaojuanJudgeBean canShowPaper(int canShowPaper) =>
      this(canShowPaper: canShowPaper);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CanViewKaojuanJudgeBean(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CanViewKaojuanJudgeBean(...).copyWith(id: 12, name: "My name")
  /// ````
  CanViewKaojuanJudgeBean call({
    Object? stuCanViewScore = const $CopyWithPlaceholder(),
    Object? scoreText = const $CopyWithPlaceholder(),
    Object? scoreReason = const $CopyWithPlaceholder(),
    Object? stuCanViewKaojuan = const $CopyWithPlaceholder(),
    Object? kaojuanReason = const $CopyWithPlaceholder(),
    Object? canShowPaper = const $CopyWithPlaceholder(),
  }) {
    return CanViewKaojuanJudgeBean(
      stuCanViewScore:
          stuCanViewScore == const $CopyWithPlaceholder()
              ? _value.stuCanViewScore
              // ignore: cast_nullable_to_non_nullable
              : stuCanViewScore as bool,
      scoreText:
          scoreText == const $CopyWithPlaceholder()
              ? _value.scoreText
              // ignore: cast_nullable_to_non_nullable
              : scoreText as String,
      scoreReason:
          scoreReason == const $CopyWithPlaceholder()
              ? _value.scoreReason
              // ignore: cast_nullable_to_non_nullable
              : scoreReason as String,
      stuCanViewKaojuan:
          stuCanViewKaojuan == const $CopyWithPlaceholder()
              ? _value.stuCanViewKaojuan
              // ignore: cast_nullable_to_non_nullable
              : stuCanViewKaojuan as bool,
      kaojuanReason:
          kaojuanReason == const $CopyWithPlaceholder()
              ? _value.kaojuanReason
              // ignore: cast_nullable_to_non_nullable
              : kaojuanReason as String,
      canShowPaper:
          canShowPaper == const $CopyWithPlaceholder()
              ? _value.canShowPaper
              // ignore: cast_nullable_to_non_nullable
              : canShowPaper as int,
    );
  }
}

extension $CanViewKaojuanJudgeBeanCopyWith on CanViewKaojuanJudgeBean {
  /// Returns a callable class that can be used as follows: `instanceOfCanViewKaojuanJudgeBean.copyWith(...)` or like so:`instanceOfCanViewKaojuanJudgeBean.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CanViewKaojuanJudgeBeanCWProxy get copyWith =>
      _$CanViewKaojuanJudgeBeanCWProxyImpl(this);
}

abstract class _$DataItemCWProxy {
  DataItem uid(int uid);

  DataItem ksdId(int ksdId);

  DataItem finish(int finish);

  DataItem delFlag(int delFlag);

  DataItem ksId(int ksId);

  DataItem ksName(String ksName);

  DataItem examCodeFlag(bool examCodeFlag);

  DataItem examType(dynamic examType);

  DataItem restrictBeginTime(int restrictBeginTime);

  DataItem restrictEndTime(int restrictEndTime);

  DataItem beginTime(dynamic beginTime);

  DataItem processStep(int processStep);

  DataItem enrollStartTime(dynamic enrollStartTime);

  DataItem enrollEndTime(dynamic enrollEndTime);

  DataItem ansBeginTime(dynamic ansBeginTime);

  DataItem clsId(int clsId);

  DataItem ksLimit(int ksLimit);

  DataItem checkTime(int checkTime);

  DataItem beingOrOver(int beingOrOver);

  DataItem countdownSeconds(dynamic countdownSeconds);

  DataItem examCanCountdown(bool examCanCountdown);

  DataItem endayFlag(int endayFlag);

  DataItem realCheckTime(dynamic realCheckTime);

  DataItem rateStatus(int rateStatus);

  DataItem autoRateJson(dynamic autoRateJson);

  DataItem rateJson(dynamic rateJson);

  DataItem ansSubmitTime(dynamic ansSubmitTime);

  DataItem kcId(int kcId);

  DataItem ksDelFlag(bool ksDelFlag);

  DataItem enrollDelFlag(int enrollDelFlag);

  DataItem isNeiWangKs(int isNeiWangKs);

  DataItem showKaoshiTimeType(int showKaoshiTimeType);

  DataItem showKaoshiTimeContent(dynamic showKaoshiTimeContent);

  DataItem enrollMaxStuCount(int enrollMaxStuCount);

  DataItem realEnrollStuCount(int realEnrollStuCount);

  DataItem kaoshiNote(dynamic kaoshiNote);

  DataItem kcName(dynamic kcName);

  DataItem checkContentType(int checkContentType);

  DataItem viewSubMacScorFlag(int viewSubMacScorFlag);

  DataItem subMacScorFlag(int subMacScorFlag);

  DataItem guidangTime(dynamic guidangTime);

  DataItem isSupportApp(int isSupportApp);

  DataItem ppId(int ppId);

  DataItem tplId(int tplId);

  DataItem zhiyueFlag(int zhiyueFlag);

  DataItem examTypeEnum(String examTypeEnum);

  DataItem postType(dynamic postType);

  DataItem taskMode(dynamic taskMode);

  DataItem scorePercentage(dynamic scorePercentage);

  DataItem finalScoreType(dynamic finalScoreType);

  DataItem score(dynamic score);

  DataItem answerTimes(dynamic answerTimes);

  DataItem standardScore(dynamic standardScore);

  DataItem current(bool current);

  DataItem totalScore(int totalScore);

  DataItem examTag(int examTag);

  DataItem skill(int skill);

  DataItem level(int level);

  DataItem mark(int mark);

  DataItem type(int type);

  DataItem allowEntryId(dynamic allowEntryId);

  DataItem rateScore(int rateScore);

  DataItem ksLimitStr(dynamic ksLimitStr);

  DataItem faceRecognize(dynamic faceRecognize);

  DataItem terminal(int terminal);

  DataItem terminalList(List<int> terminalList);

  DataItem cetOralFlag(int cetOralFlag);

  DataItem hasFaceRecognize(dynamic hasFaceRecognize);

  DataItem hasFaceRecognizeCount(dynamic hasFaceRecognizeCount);

  DataItem commitment(dynamic commitment);

  DataItem rtcFlag(dynamic rtcFlag);

  DataItem captureFlag(int captureFlag);

  DataItem screenMonitoringFlag(int screenMonitoringFlag);

  DataItem competitionFlag(int competitionFlag);

  DataItem recordFlag(int recordFlag);

  DataItem classX(bool? classX);

  DataItem rateObjFinal(RateObjFinal rateObjFinal);

  DataItem diagnosisExam(bool diagnosisExam);

  DataItem viewScore(bool viewScore);

  DataItem kaoshiShowTimeForCurrentStu(dynamic kaoshiShowTimeForCurrentStu);

  DataItem ansBeginAndEndTimeShow(String ansBeginAndEndTimeShow);

  DataItem enrollStartEndTime(String enrollStartEndTime);

  DataItem examEnrollInfo(String examEnrollInfo);

  DataItem restrictBeginTimeStr(String restrictBeginTimeStr);

  DataItem restrictEndTimeStr(String restrictEndTimeStr);

  DataItem beginTimeStr(String beginTimeStr);

  DataItem enrollStartTimeStr(String enrollStartTimeStr);

  DataItem enrollEndTimeStr(String enrollEndTimeStr);

  DataItem ansBeginTimeStr(String ansBeginTimeStr);

  DataItem ansSubmitTimeStr(String ansSubmitTimeStr);

  DataItem school(bool school);

  DataItem task(bool task);

  DataItem canKaoshiJudgeBean(CanKaoshiJudgeBean canKaoshiJudgeBean);

  DataItem canViewKaojuanJudgeBean(
    CanViewKaojuanJudgeBean canViewKaojuanJudgeBean,
  );

  DataItem ksText(String ksText);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataItem(...).copyWith(id: 12, name: "My name")
  /// ````
  DataItem call({
    int uid,
    int ksdId,
    int finish,
    int delFlag,
    int ksId,
    String ksName,
    bool examCodeFlag,
    dynamic examType,
    int restrictBeginTime,
    int restrictEndTime,
    dynamic beginTime,
    int processStep,
    dynamic enrollStartTime,
    dynamic enrollEndTime,
    dynamic ansBeginTime,
    int clsId,
    int ksLimit,
    int checkTime,
    int beingOrOver,
    dynamic countdownSeconds,
    bool examCanCountdown,
    int endayFlag,
    dynamic realCheckTime,
    int rateStatus,
    dynamic autoRateJson,
    dynamic rateJson,
    dynamic ansSubmitTime,
    int kcId,
    bool ksDelFlag,
    int enrollDelFlag,
    int isNeiWangKs,
    int showKaoshiTimeType,
    dynamic showKaoshiTimeContent,
    int enrollMaxStuCount,
    int realEnrollStuCount,
    dynamic kaoshiNote,
    dynamic kcName,
    int checkContentType,
    int viewSubMacScorFlag,
    int subMacScorFlag,
    dynamic guidangTime,
    int isSupportApp,
    int ppId,
    int tplId,
    int zhiyueFlag,
    String examTypeEnum,
    dynamic postType,
    dynamic taskMode,
    dynamic scorePercentage,
    dynamic finalScoreType,
    dynamic score,
    dynamic answerTimes,
    dynamic standardScore,
    bool current,
    int totalScore,
    int examTag,
    int skill,
    int level,
    int mark,
    int type,
    dynamic allowEntryId,
    int rateScore,
    dynamic ksLimitStr,
    dynamic faceRecognize,
    int terminal,
    List<int> terminalList,
    int cetOralFlag,
    dynamic hasFaceRecognize,
    dynamic hasFaceRecognizeCount,
    dynamic commitment,
    dynamic rtcFlag,
    int captureFlag,
    int screenMonitoringFlag,
    int competitionFlag,
    int recordFlag,
    bool? classX,
    RateObjFinal rateObjFinal,
    bool diagnosisExam,
    bool viewScore,
    dynamic kaoshiShowTimeForCurrentStu,
    String ansBeginAndEndTimeShow,
    String enrollStartEndTime,
    String examEnrollInfo,
    String restrictBeginTimeStr,
    String restrictEndTimeStr,
    String beginTimeStr,
    String enrollStartTimeStr,
    String enrollEndTimeStr,
    String ansBeginTimeStr,
    String ansSubmitTimeStr,
    bool school,
    bool task,
    CanKaoshiJudgeBean canKaoshiJudgeBean,
    CanViewKaojuanJudgeBean canViewKaojuanJudgeBean,
    String ksText,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDataItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDataItem.copyWith.fieldName(...)`
class _$DataItemCWProxyImpl implements _$DataItemCWProxy {
  const _$DataItemCWProxyImpl(this._value);

  final DataItem _value;

  @override
  DataItem uid(int uid) => this(uid: uid);

  @override
  DataItem ksdId(int ksdId) => this(ksdId: ksdId);

  @override
  DataItem finish(int finish) => this(finish: finish);

  @override
  DataItem delFlag(int delFlag) => this(delFlag: delFlag);

  @override
  DataItem ksId(int ksId) => this(ksId: ksId);

  @override
  DataItem ksName(String ksName) => this(ksName: ksName);

  @override
  DataItem examCodeFlag(bool examCodeFlag) => this(examCodeFlag: examCodeFlag);

  @override
  DataItem examType(dynamic examType) => this(examType: examType);

  @override
  DataItem restrictBeginTime(int restrictBeginTime) =>
      this(restrictBeginTime: restrictBeginTime);

  @override
  DataItem restrictEndTime(int restrictEndTime) =>
      this(restrictEndTime: restrictEndTime);

  @override
  DataItem beginTime(dynamic beginTime) => this(beginTime: beginTime);

  @override
  DataItem processStep(int processStep) => this(processStep: processStep);

  @override
  DataItem enrollStartTime(dynamic enrollStartTime) =>
      this(enrollStartTime: enrollStartTime);

  @override
  DataItem enrollEndTime(dynamic enrollEndTime) =>
      this(enrollEndTime: enrollEndTime);

  @override
  DataItem ansBeginTime(dynamic ansBeginTime) =>
      this(ansBeginTime: ansBeginTime);

  @override
  DataItem clsId(int clsId) => this(clsId: clsId);

  @override
  DataItem ksLimit(int ksLimit) => this(ksLimit: ksLimit);

  @override
  DataItem checkTime(int checkTime) => this(checkTime: checkTime);

  @override
  DataItem beingOrOver(int beingOrOver) => this(beingOrOver: beingOrOver);

  @override
  DataItem countdownSeconds(dynamic countdownSeconds) =>
      this(countdownSeconds: countdownSeconds);

  @override
  DataItem examCanCountdown(bool examCanCountdown) =>
      this(examCanCountdown: examCanCountdown);

  @override
  DataItem endayFlag(int endayFlag) => this(endayFlag: endayFlag);

  @override
  DataItem realCheckTime(dynamic realCheckTime) =>
      this(realCheckTime: realCheckTime);

  @override
  DataItem rateStatus(int rateStatus) => this(rateStatus: rateStatus);

  @override
  DataItem autoRateJson(dynamic autoRateJson) =>
      this(autoRateJson: autoRateJson);

  @override
  DataItem rateJson(dynamic rateJson) => this(rateJson: rateJson);

  @override
  DataItem ansSubmitTime(dynamic ansSubmitTime) =>
      this(ansSubmitTime: ansSubmitTime);

  @override
  DataItem kcId(int kcId) => this(kcId: kcId);

  @override
  DataItem ksDelFlag(bool ksDelFlag) => this(ksDelFlag: ksDelFlag);

  @override
  DataItem enrollDelFlag(int enrollDelFlag) =>
      this(enrollDelFlag: enrollDelFlag);

  @override
  DataItem isNeiWangKs(int isNeiWangKs) => this(isNeiWangKs: isNeiWangKs);

  @override
  DataItem showKaoshiTimeType(int showKaoshiTimeType) =>
      this(showKaoshiTimeType: showKaoshiTimeType);

  @override
  DataItem showKaoshiTimeContent(dynamic showKaoshiTimeContent) =>
      this(showKaoshiTimeContent: showKaoshiTimeContent);

  @override
  DataItem enrollMaxStuCount(int enrollMaxStuCount) =>
      this(enrollMaxStuCount: enrollMaxStuCount);

  @override
  DataItem realEnrollStuCount(int realEnrollStuCount) =>
      this(realEnrollStuCount: realEnrollStuCount);

  @override
  DataItem kaoshiNote(dynamic kaoshiNote) => this(kaoshiNote: kaoshiNote);

  @override
  DataItem kcName(dynamic kcName) => this(kcName: kcName);

  @override
  DataItem checkContentType(int checkContentType) =>
      this(checkContentType: checkContentType);

  @override
  DataItem viewSubMacScorFlag(int viewSubMacScorFlag) =>
      this(viewSubMacScorFlag: viewSubMacScorFlag);

  @override
  DataItem subMacScorFlag(int subMacScorFlag) =>
      this(subMacScorFlag: subMacScorFlag);

  @override
  DataItem guidangTime(dynamic guidangTime) => this(guidangTime: guidangTime);

  @override
  DataItem isSupportApp(int isSupportApp) => this(isSupportApp: isSupportApp);

  @override
  DataItem ppId(int ppId) => this(ppId: ppId);

  @override
  DataItem tplId(int tplId) => this(tplId: tplId);

  @override
  DataItem zhiyueFlag(int zhiyueFlag) => this(zhiyueFlag: zhiyueFlag);

  @override
  DataItem examTypeEnum(String examTypeEnum) =>
      this(examTypeEnum: examTypeEnum);

  @override
  DataItem postType(dynamic postType) => this(postType: postType);

  @override
  DataItem taskMode(dynamic taskMode) => this(taskMode: taskMode);

  @override
  DataItem scorePercentage(dynamic scorePercentage) =>
      this(scorePercentage: scorePercentage);

  @override
  DataItem finalScoreType(dynamic finalScoreType) =>
      this(finalScoreType: finalScoreType);

  @override
  DataItem score(dynamic score) => this(score: score);

  @override
  DataItem answerTimes(dynamic answerTimes) => this(answerTimes: answerTimes);

  @override
  DataItem standardScore(dynamic standardScore) =>
      this(standardScore: standardScore);

  @override
  DataItem current(bool current) => this(current: current);

  @override
  DataItem totalScore(int totalScore) => this(totalScore: totalScore);

  @override
  DataItem examTag(int examTag) => this(examTag: examTag);

  @override
  DataItem skill(int skill) => this(skill: skill);

  @override
  DataItem level(int level) => this(level: level);

  @override
  DataItem mark(int mark) => this(mark: mark);

  @override
  DataItem type(int type) => this(type: type);

  @override
  DataItem allowEntryId(dynamic allowEntryId) =>
      this(allowEntryId: allowEntryId);

  @override
  DataItem rateScore(int rateScore) => this(rateScore: rateScore);

  @override
  DataItem ksLimitStr(dynamic ksLimitStr) => this(ksLimitStr: ksLimitStr);

  @override
  DataItem faceRecognize(dynamic faceRecognize) =>
      this(faceRecognize: faceRecognize);

  @override
  DataItem terminal(int terminal) => this(terminal: terminal);

  @override
  DataItem terminalList(List<int> terminalList) =>
      this(terminalList: terminalList);

  @override
  DataItem cetOralFlag(int cetOralFlag) => this(cetOralFlag: cetOralFlag);

  @override
  DataItem hasFaceRecognize(dynamic hasFaceRecognize) =>
      this(hasFaceRecognize: hasFaceRecognize);

  @override
  DataItem hasFaceRecognizeCount(dynamic hasFaceRecognizeCount) =>
      this(hasFaceRecognizeCount: hasFaceRecognizeCount);

  @override
  DataItem commitment(dynamic commitment) => this(commitment: commitment);

  @override
  DataItem rtcFlag(dynamic rtcFlag) => this(rtcFlag: rtcFlag);

  @override
  DataItem captureFlag(int captureFlag) => this(captureFlag: captureFlag);

  @override
  DataItem screenMonitoringFlag(int screenMonitoringFlag) =>
      this(screenMonitoringFlag: screenMonitoringFlag);

  @override
  DataItem competitionFlag(int competitionFlag) =>
      this(competitionFlag: competitionFlag);

  @override
  DataItem recordFlag(int recordFlag) => this(recordFlag: recordFlag);

  @override
  DataItem classX(bool? classX) => this(classX: classX);

  @override
  DataItem rateObjFinal(RateObjFinal rateObjFinal) =>
      this(rateObjFinal: rateObjFinal);

  @override
  DataItem diagnosisExam(bool diagnosisExam) =>
      this(diagnosisExam: diagnosisExam);

  @override
  DataItem viewScore(bool viewScore) => this(viewScore: viewScore);

  @override
  DataItem kaoshiShowTimeForCurrentStu(dynamic kaoshiShowTimeForCurrentStu) =>
      this(kaoshiShowTimeForCurrentStu: kaoshiShowTimeForCurrentStu);

  @override
  DataItem ansBeginAndEndTimeShow(String ansBeginAndEndTimeShow) =>
      this(ansBeginAndEndTimeShow: ansBeginAndEndTimeShow);

  @override
  DataItem enrollStartEndTime(String enrollStartEndTime) =>
      this(enrollStartEndTime: enrollStartEndTime);

  @override
  DataItem examEnrollInfo(String examEnrollInfo) =>
      this(examEnrollInfo: examEnrollInfo);

  @override
  DataItem restrictBeginTimeStr(String restrictBeginTimeStr) =>
      this(restrictBeginTimeStr: restrictBeginTimeStr);

  @override
  DataItem restrictEndTimeStr(String restrictEndTimeStr) =>
      this(restrictEndTimeStr: restrictEndTimeStr);

  @override
  DataItem beginTimeStr(String beginTimeStr) =>
      this(beginTimeStr: beginTimeStr);

  @override
  DataItem enrollStartTimeStr(String enrollStartTimeStr) =>
      this(enrollStartTimeStr: enrollStartTimeStr);

  @override
  DataItem enrollEndTimeStr(String enrollEndTimeStr) =>
      this(enrollEndTimeStr: enrollEndTimeStr);

  @override
  DataItem ansBeginTimeStr(String ansBeginTimeStr) =>
      this(ansBeginTimeStr: ansBeginTimeStr);

  @override
  DataItem ansSubmitTimeStr(String ansSubmitTimeStr) =>
      this(ansSubmitTimeStr: ansSubmitTimeStr);

  @override
  DataItem school(bool school) => this(school: school);

  @override
  DataItem task(bool task) => this(task: task);

  @override
  DataItem canKaoshiJudgeBean(CanKaoshiJudgeBean canKaoshiJudgeBean) =>
      this(canKaoshiJudgeBean: canKaoshiJudgeBean);

  @override
  DataItem canViewKaojuanJudgeBean(
    CanViewKaojuanJudgeBean canViewKaojuanJudgeBean,
  ) => this(canViewKaojuanJudgeBean: canViewKaojuanJudgeBean);

  @override
  DataItem ksText(String ksText) => this(ksText: ksText);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataItem(...).copyWith(id: 12, name: "My name")
  /// ````
  DataItem call({
    Object? uid = const $CopyWithPlaceholder(),
    Object? ksdId = const $CopyWithPlaceholder(),
    Object? finish = const $CopyWithPlaceholder(),
    Object? delFlag = const $CopyWithPlaceholder(),
    Object? ksId = const $CopyWithPlaceholder(),
    Object? ksName = const $CopyWithPlaceholder(),
    Object? examCodeFlag = const $CopyWithPlaceholder(),
    Object? examType = const $CopyWithPlaceholder(),
    Object? restrictBeginTime = const $CopyWithPlaceholder(),
    Object? restrictEndTime = const $CopyWithPlaceholder(),
    Object? beginTime = const $CopyWithPlaceholder(),
    Object? processStep = const $CopyWithPlaceholder(),
    Object? enrollStartTime = const $CopyWithPlaceholder(),
    Object? enrollEndTime = const $CopyWithPlaceholder(),
    Object? ansBeginTime = const $CopyWithPlaceholder(),
    Object? clsId = const $CopyWithPlaceholder(),
    Object? ksLimit = const $CopyWithPlaceholder(),
    Object? checkTime = const $CopyWithPlaceholder(),
    Object? beingOrOver = const $CopyWithPlaceholder(),
    Object? countdownSeconds = const $CopyWithPlaceholder(),
    Object? examCanCountdown = const $CopyWithPlaceholder(),
    Object? endayFlag = const $CopyWithPlaceholder(),
    Object? realCheckTime = const $CopyWithPlaceholder(),
    Object? rateStatus = const $CopyWithPlaceholder(),
    Object? autoRateJson = const $CopyWithPlaceholder(),
    Object? rateJson = const $CopyWithPlaceholder(),
    Object? ansSubmitTime = const $CopyWithPlaceholder(),
    Object? kcId = const $CopyWithPlaceholder(),
    Object? ksDelFlag = const $CopyWithPlaceholder(),
    Object? enrollDelFlag = const $CopyWithPlaceholder(),
    Object? isNeiWangKs = const $CopyWithPlaceholder(),
    Object? showKaoshiTimeType = const $CopyWithPlaceholder(),
    Object? showKaoshiTimeContent = const $CopyWithPlaceholder(),
    Object? enrollMaxStuCount = const $CopyWithPlaceholder(),
    Object? realEnrollStuCount = const $CopyWithPlaceholder(),
    Object? kaoshiNote = const $CopyWithPlaceholder(),
    Object? kcName = const $CopyWithPlaceholder(),
    Object? checkContentType = const $CopyWithPlaceholder(),
    Object? viewSubMacScorFlag = const $CopyWithPlaceholder(),
    Object? subMacScorFlag = const $CopyWithPlaceholder(),
    Object? guidangTime = const $CopyWithPlaceholder(),
    Object? isSupportApp = const $CopyWithPlaceholder(),
    Object? ppId = const $CopyWithPlaceholder(),
    Object? tplId = const $CopyWithPlaceholder(),
    Object? zhiyueFlag = const $CopyWithPlaceholder(),
    Object? examTypeEnum = const $CopyWithPlaceholder(),
    Object? postType = const $CopyWithPlaceholder(),
    Object? taskMode = const $CopyWithPlaceholder(),
    Object? scorePercentage = const $CopyWithPlaceholder(),
    Object? finalScoreType = const $CopyWithPlaceholder(),
    Object? score = const $CopyWithPlaceholder(),
    Object? answerTimes = const $CopyWithPlaceholder(),
    Object? standardScore = const $CopyWithPlaceholder(),
    Object? current = const $CopyWithPlaceholder(),
    Object? totalScore = const $CopyWithPlaceholder(),
    Object? examTag = const $CopyWithPlaceholder(),
    Object? skill = const $CopyWithPlaceholder(),
    Object? level = const $CopyWithPlaceholder(),
    Object? mark = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? allowEntryId = const $CopyWithPlaceholder(),
    Object? rateScore = const $CopyWithPlaceholder(),
    Object? ksLimitStr = const $CopyWithPlaceholder(),
    Object? faceRecognize = const $CopyWithPlaceholder(),
    Object? terminal = const $CopyWithPlaceholder(),
    Object? terminalList = const $CopyWithPlaceholder(),
    Object? cetOralFlag = const $CopyWithPlaceholder(),
    Object? hasFaceRecognize = const $CopyWithPlaceholder(),
    Object? hasFaceRecognizeCount = const $CopyWithPlaceholder(),
    Object? commitment = const $CopyWithPlaceholder(),
    Object? rtcFlag = const $CopyWithPlaceholder(),
    Object? captureFlag = const $CopyWithPlaceholder(),
    Object? screenMonitoringFlag = const $CopyWithPlaceholder(),
    Object? competitionFlag = const $CopyWithPlaceholder(),
    Object? recordFlag = const $CopyWithPlaceholder(),
    Object? classX = const $CopyWithPlaceholder(),
    Object? rateObjFinal = const $CopyWithPlaceholder(),
    Object? diagnosisExam = const $CopyWithPlaceholder(),
    Object? viewScore = const $CopyWithPlaceholder(),
    Object? kaoshiShowTimeForCurrentStu = const $CopyWithPlaceholder(),
    Object? ansBeginAndEndTimeShow = const $CopyWithPlaceholder(),
    Object? enrollStartEndTime = const $CopyWithPlaceholder(),
    Object? examEnrollInfo = const $CopyWithPlaceholder(),
    Object? restrictBeginTimeStr = const $CopyWithPlaceholder(),
    Object? restrictEndTimeStr = const $CopyWithPlaceholder(),
    Object? beginTimeStr = const $CopyWithPlaceholder(),
    Object? enrollStartTimeStr = const $CopyWithPlaceholder(),
    Object? enrollEndTimeStr = const $CopyWithPlaceholder(),
    Object? ansBeginTimeStr = const $CopyWithPlaceholder(),
    Object? ansSubmitTimeStr = const $CopyWithPlaceholder(),
    Object? school = const $CopyWithPlaceholder(),
    Object? task = const $CopyWithPlaceholder(),
    Object? canKaoshiJudgeBean = const $CopyWithPlaceholder(),
    Object? canViewKaojuanJudgeBean = const $CopyWithPlaceholder(),
    Object? ksText = const $CopyWithPlaceholder(),
  }) {
    return DataItem(
      uid:
          uid == const $CopyWithPlaceholder()
              ? _value.uid
              // ignore: cast_nullable_to_non_nullable
              : uid as int,
      ksdId:
          ksdId == const $CopyWithPlaceholder()
              ? _value.ksdId
              // ignore: cast_nullable_to_non_nullable
              : ksdId as int,
      finish:
          finish == const $CopyWithPlaceholder()
              ? _value.finish
              // ignore: cast_nullable_to_non_nullable
              : finish as int,
      delFlag:
          delFlag == const $CopyWithPlaceholder()
              ? _value.delFlag
              // ignore: cast_nullable_to_non_nullable
              : delFlag as int,
      ksId:
          ksId == const $CopyWithPlaceholder()
              ? _value.ksId
              // ignore: cast_nullable_to_non_nullable
              : ksId as int,
      ksName:
          ksName == const $CopyWithPlaceholder()
              ? _value.ksName
              // ignore: cast_nullable_to_non_nullable
              : ksName as String,
      examCodeFlag:
          examCodeFlag == const $CopyWithPlaceholder()
              ? _value.examCodeFlag
              // ignore: cast_nullable_to_non_nullable
              : examCodeFlag as bool,
      examType:
          examType == const $CopyWithPlaceholder()
              ? _value.examType
              // ignore: cast_nullable_to_non_nullable
              : examType as dynamic,
      restrictBeginTime:
          restrictBeginTime == const $CopyWithPlaceholder()
              ? _value.restrictBeginTime
              // ignore: cast_nullable_to_non_nullable
              : restrictBeginTime as int,
      restrictEndTime:
          restrictEndTime == const $CopyWithPlaceholder()
              ? _value.restrictEndTime
              // ignore: cast_nullable_to_non_nullable
              : restrictEndTime as int,
      beginTime:
          beginTime == const $CopyWithPlaceholder()
              ? _value.beginTime
              // ignore: cast_nullable_to_non_nullable
              : beginTime as dynamic,
      processStep:
          processStep == const $CopyWithPlaceholder()
              ? _value.processStep
              // ignore: cast_nullable_to_non_nullable
              : processStep as int,
      enrollStartTime:
          enrollStartTime == const $CopyWithPlaceholder()
              ? _value.enrollStartTime
              // ignore: cast_nullable_to_non_nullable
              : enrollStartTime as dynamic,
      enrollEndTime:
          enrollEndTime == const $CopyWithPlaceholder()
              ? _value.enrollEndTime
              // ignore: cast_nullable_to_non_nullable
              : enrollEndTime as dynamic,
      ansBeginTime:
          ansBeginTime == const $CopyWithPlaceholder()
              ? _value.ansBeginTime
              // ignore: cast_nullable_to_non_nullable
              : ansBeginTime as dynamic,
      clsId:
          clsId == const $CopyWithPlaceholder()
              ? _value.clsId
              // ignore: cast_nullable_to_non_nullable
              : clsId as int,
      ksLimit:
          ksLimit == const $CopyWithPlaceholder()
              ? _value.ksLimit
              // ignore: cast_nullable_to_non_nullable
              : ksLimit as int,
      checkTime:
          checkTime == const $CopyWithPlaceholder()
              ? _value.checkTime
              // ignore: cast_nullable_to_non_nullable
              : checkTime as int,
      beingOrOver:
          beingOrOver == const $CopyWithPlaceholder()
              ? _value.beingOrOver
              // ignore: cast_nullable_to_non_nullable
              : beingOrOver as int,
      countdownSeconds:
          countdownSeconds == const $CopyWithPlaceholder()
              ? _value.countdownSeconds
              // ignore: cast_nullable_to_non_nullable
              : countdownSeconds as dynamic,
      examCanCountdown:
          examCanCountdown == const $CopyWithPlaceholder()
              ? _value.examCanCountdown
              // ignore: cast_nullable_to_non_nullable
              : examCanCountdown as bool,
      endayFlag:
          endayFlag == const $CopyWithPlaceholder()
              ? _value.endayFlag
              // ignore: cast_nullable_to_non_nullable
              : endayFlag as int,
      realCheckTime:
          realCheckTime == const $CopyWithPlaceholder()
              ? _value.realCheckTime
              // ignore: cast_nullable_to_non_nullable
              : realCheckTime as dynamic,
      rateStatus:
          rateStatus == const $CopyWithPlaceholder()
              ? _value.rateStatus
              // ignore: cast_nullable_to_non_nullable
              : rateStatus as int,
      autoRateJson:
          autoRateJson == const $CopyWithPlaceholder()
              ? _value.autoRateJson
              // ignore: cast_nullable_to_non_nullable
              : autoRateJson as dynamic,
      rateJson:
          rateJson == const $CopyWithPlaceholder()
              ? _value.rateJson
              // ignore: cast_nullable_to_non_nullable
              : rateJson as dynamic,
      ansSubmitTime:
          ansSubmitTime == const $CopyWithPlaceholder()
              ? _value.ansSubmitTime
              // ignore: cast_nullable_to_non_nullable
              : ansSubmitTime as dynamic,
      kcId:
          kcId == const $CopyWithPlaceholder()
              ? _value.kcId
              // ignore: cast_nullable_to_non_nullable
              : kcId as int,
      ksDelFlag:
          ksDelFlag == const $CopyWithPlaceholder()
              ? _value.ksDelFlag
              // ignore: cast_nullable_to_non_nullable
              : ksDelFlag as bool,
      enrollDelFlag:
          enrollDelFlag == const $CopyWithPlaceholder()
              ? _value.enrollDelFlag
              // ignore: cast_nullable_to_non_nullable
              : enrollDelFlag as int,
      isNeiWangKs:
          isNeiWangKs == const $CopyWithPlaceholder()
              ? _value.isNeiWangKs
              // ignore: cast_nullable_to_non_nullable
              : isNeiWangKs as int,
      showKaoshiTimeType:
          showKaoshiTimeType == const $CopyWithPlaceholder()
              ? _value.showKaoshiTimeType
              // ignore: cast_nullable_to_non_nullable
              : showKaoshiTimeType as int,
      showKaoshiTimeContent:
          showKaoshiTimeContent == const $CopyWithPlaceholder()
              ? _value.showKaoshiTimeContent
              // ignore: cast_nullable_to_non_nullable
              : showKaoshiTimeContent as dynamic,
      enrollMaxStuCount:
          enrollMaxStuCount == const $CopyWithPlaceholder()
              ? _value.enrollMaxStuCount
              // ignore: cast_nullable_to_non_nullable
              : enrollMaxStuCount as int,
      realEnrollStuCount:
          realEnrollStuCount == const $CopyWithPlaceholder()
              ? _value.realEnrollStuCount
              // ignore: cast_nullable_to_non_nullable
              : realEnrollStuCount as int,
      kaoshiNote:
          kaoshiNote == const $CopyWithPlaceholder()
              ? _value.kaoshiNote
              // ignore: cast_nullable_to_non_nullable
              : kaoshiNote as dynamic,
      kcName:
          kcName == const $CopyWithPlaceholder()
              ? _value.kcName
              // ignore: cast_nullable_to_non_nullable
              : kcName as dynamic,
      checkContentType:
          checkContentType == const $CopyWithPlaceholder()
              ? _value.checkContentType
              // ignore: cast_nullable_to_non_nullable
              : checkContentType as int,
      viewSubMacScorFlag:
          viewSubMacScorFlag == const $CopyWithPlaceholder()
              ? _value.viewSubMacScorFlag
              // ignore: cast_nullable_to_non_nullable
              : viewSubMacScorFlag as int,
      subMacScorFlag:
          subMacScorFlag == const $CopyWithPlaceholder()
              ? _value.subMacScorFlag
              // ignore: cast_nullable_to_non_nullable
              : subMacScorFlag as int,
      guidangTime:
          guidangTime == const $CopyWithPlaceholder()
              ? _value.guidangTime
              // ignore: cast_nullable_to_non_nullable
              : guidangTime as dynamic,
      isSupportApp:
          isSupportApp == const $CopyWithPlaceholder()
              ? _value.isSupportApp
              // ignore: cast_nullable_to_non_nullable
              : isSupportApp as int,
      ppId:
          ppId == const $CopyWithPlaceholder()
              ? _value.ppId
              // ignore: cast_nullable_to_non_nullable
              : ppId as int,
      tplId:
          tplId == const $CopyWithPlaceholder()
              ? _value.tplId
              // ignore: cast_nullable_to_non_nullable
              : tplId as int,
      zhiyueFlag:
          zhiyueFlag == const $CopyWithPlaceholder()
              ? _value.zhiyueFlag
              // ignore: cast_nullable_to_non_nullable
              : zhiyueFlag as int,
      examTypeEnum:
          examTypeEnum == const $CopyWithPlaceholder()
              ? _value.examTypeEnum
              // ignore: cast_nullable_to_non_nullable
              : examTypeEnum as String,
      postType:
          postType == const $CopyWithPlaceholder()
              ? _value.postType
              // ignore: cast_nullable_to_non_nullable
              : postType as dynamic,
      taskMode:
          taskMode == const $CopyWithPlaceholder()
              ? _value.taskMode
              // ignore: cast_nullable_to_non_nullable
              : taskMode as dynamic,
      scorePercentage:
          scorePercentage == const $CopyWithPlaceholder()
              ? _value.scorePercentage
              // ignore: cast_nullable_to_non_nullable
              : scorePercentage as dynamic,
      finalScoreType:
          finalScoreType == const $CopyWithPlaceholder()
              ? _value.finalScoreType
              // ignore: cast_nullable_to_non_nullable
              : finalScoreType as dynamic,
      score:
          score == const $CopyWithPlaceholder()
              ? _value.score
              // ignore: cast_nullable_to_non_nullable
              : score as dynamic,
      answerTimes:
          answerTimes == const $CopyWithPlaceholder()
              ? _value.answerTimes
              // ignore: cast_nullable_to_non_nullable
              : answerTimes as dynamic,
      standardScore:
          standardScore == const $CopyWithPlaceholder()
              ? _value.standardScore
              // ignore: cast_nullable_to_non_nullable
              : standardScore as dynamic,
      current:
          current == const $CopyWithPlaceholder()
              ? _value.current
              // ignore: cast_nullable_to_non_nullable
              : current as bool,
      totalScore:
          totalScore == const $CopyWithPlaceholder()
              ? _value.totalScore
              // ignore: cast_nullable_to_non_nullable
              : totalScore as int,
      examTag:
          examTag == const $CopyWithPlaceholder()
              ? _value.examTag
              // ignore: cast_nullable_to_non_nullable
              : examTag as int,
      skill:
          skill == const $CopyWithPlaceholder()
              ? _value.skill
              // ignore: cast_nullable_to_non_nullable
              : skill as int,
      level:
          level == const $CopyWithPlaceholder()
              ? _value.level
              // ignore: cast_nullable_to_non_nullable
              : level as int,
      mark:
          mark == const $CopyWithPlaceholder()
              ? _value.mark
              // ignore: cast_nullable_to_non_nullable
              : mark as int,
      type:
          type == const $CopyWithPlaceholder()
              ? _value.type
              // ignore: cast_nullable_to_non_nullable
              : type as int,
      allowEntryId:
          allowEntryId == const $CopyWithPlaceholder()
              ? _value.allowEntryId
              // ignore: cast_nullable_to_non_nullable
              : allowEntryId as dynamic,
      rateScore:
          rateScore == const $CopyWithPlaceholder()
              ? _value.rateScore
              // ignore: cast_nullable_to_non_nullable
              : rateScore as int,
      ksLimitStr:
          ksLimitStr == const $CopyWithPlaceholder()
              ? _value.ksLimitStr
              // ignore: cast_nullable_to_non_nullable
              : ksLimitStr as dynamic,
      faceRecognize:
          faceRecognize == const $CopyWithPlaceholder()
              ? _value.faceRecognize
              // ignore: cast_nullable_to_non_nullable
              : faceRecognize as dynamic,
      terminal:
          terminal == const $CopyWithPlaceholder()
              ? _value.terminal
              // ignore: cast_nullable_to_non_nullable
              : terminal as int,
      terminalList:
          terminalList == const $CopyWithPlaceholder()
              ? _value.terminalList
              // ignore: cast_nullable_to_non_nullable
              : terminalList as List<int>,
      cetOralFlag:
          cetOralFlag == const $CopyWithPlaceholder()
              ? _value.cetOralFlag
              // ignore: cast_nullable_to_non_nullable
              : cetOralFlag as int,
      hasFaceRecognize:
          hasFaceRecognize == const $CopyWithPlaceholder()
              ? _value.hasFaceRecognize
              // ignore: cast_nullable_to_non_nullable
              : hasFaceRecognize as dynamic,
      hasFaceRecognizeCount:
          hasFaceRecognizeCount == const $CopyWithPlaceholder()
              ? _value.hasFaceRecognizeCount
              // ignore: cast_nullable_to_non_nullable
              : hasFaceRecognizeCount as dynamic,
      commitment:
          commitment == const $CopyWithPlaceholder()
              ? _value.commitment
              // ignore: cast_nullable_to_non_nullable
              : commitment as dynamic,
      rtcFlag:
          rtcFlag == const $CopyWithPlaceholder()
              ? _value.rtcFlag
              // ignore: cast_nullable_to_non_nullable
              : rtcFlag as dynamic,
      captureFlag:
          captureFlag == const $CopyWithPlaceholder()
              ? _value.captureFlag
              // ignore: cast_nullable_to_non_nullable
              : captureFlag as int,
      screenMonitoringFlag:
          screenMonitoringFlag == const $CopyWithPlaceholder()
              ? _value.screenMonitoringFlag
              // ignore: cast_nullable_to_non_nullable
              : screenMonitoringFlag as int,
      competitionFlag:
          competitionFlag == const $CopyWithPlaceholder()
              ? _value.competitionFlag
              // ignore: cast_nullable_to_non_nullable
              : competitionFlag as int,
      recordFlag:
          recordFlag == const $CopyWithPlaceholder()
              ? _value.recordFlag
              // ignore: cast_nullable_to_non_nullable
              : recordFlag as int,
      classX:
          classX == const $CopyWithPlaceholder()
              ? _value.classX
              // ignore: cast_nullable_to_non_nullable
              : classX as bool?,
      rateObjFinal:
          rateObjFinal == const $CopyWithPlaceholder()
              ? _value.rateObjFinal
              // ignore: cast_nullable_to_non_nullable
              : rateObjFinal as RateObjFinal,
      diagnosisExam:
          diagnosisExam == const $CopyWithPlaceholder()
              ? _value.diagnosisExam
              // ignore: cast_nullable_to_non_nullable
              : diagnosisExam as bool,
      viewScore:
          viewScore == const $CopyWithPlaceholder()
              ? _value.viewScore
              // ignore: cast_nullable_to_non_nullable
              : viewScore as bool,
      kaoshiShowTimeForCurrentStu:
          kaoshiShowTimeForCurrentStu == const $CopyWithPlaceholder()
              ? _value.kaoshiShowTimeForCurrentStu
              // ignore: cast_nullable_to_non_nullable
              : kaoshiShowTimeForCurrentStu as dynamic,
      ansBeginAndEndTimeShow:
          ansBeginAndEndTimeShow == const $CopyWithPlaceholder()
              ? _value.ansBeginAndEndTimeShow
              // ignore: cast_nullable_to_non_nullable
              : ansBeginAndEndTimeShow as String,
      enrollStartEndTime:
          enrollStartEndTime == const $CopyWithPlaceholder()
              ? _value.enrollStartEndTime
              // ignore: cast_nullable_to_non_nullable
              : enrollStartEndTime as String,
      examEnrollInfo:
          examEnrollInfo == const $CopyWithPlaceholder()
              ? _value.examEnrollInfo
              // ignore: cast_nullable_to_non_nullable
              : examEnrollInfo as String,
      restrictBeginTimeStr:
          restrictBeginTimeStr == const $CopyWithPlaceholder()
              ? _value.restrictBeginTimeStr
              // ignore: cast_nullable_to_non_nullable
              : restrictBeginTimeStr as String,
      restrictEndTimeStr:
          restrictEndTimeStr == const $CopyWithPlaceholder()
              ? _value.restrictEndTimeStr
              // ignore: cast_nullable_to_non_nullable
              : restrictEndTimeStr as String,
      beginTimeStr:
          beginTimeStr == const $CopyWithPlaceholder()
              ? _value.beginTimeStr
              // ignore: cast_nullable_to_non_nullable
              : beginTimeStr as String,
      enrollStartTimeStr:
          enrollStartTimeStr == const $CopyWithPlaceholder()
              ? _value.enrollStartTimeStr
              // ignore: cast_nullable_to_non_nullable
              : enrollStartTimeStr as String,
      enrollEndTimeStr:
          enrollEndTimeStr == const $CopyWithPlaceholder()
              ? _value.enrollEndTimeStr
              // ignore: cast_nullable_to_non_nullable
              : enrollEndTimeStr as String,
      ansBeginTimeStr:
          ansBeginTimeStr == const $CopyWithPlaceholder()
              ? _value.ansBeginTimeStr
              // ignore: cast_nullable_to_non_nullable
              : ansBeginTimeStr as String,
      ansSubmitTimeStr:
          ansSubmitTimeStr == const $CopyWithPlaceholder()
              ? _value.ansSubmitTimeStr
              // ignore: cast_nullable_to_non_nullable
              : ansSubmitTimeStr as String,
      school:
          school == const $CopyWithPlaceholder()
              ? _value.school
              // ignore: cast_nullable_to_non_nullable
              : school as bool,
      task:
          task == const $CopyWithPlaceholder()
              ? _value.task
              // ignore: cast_nullable_to_non_nullable
              : task as bool,
      canKaoshiJudgeBean:
          canKaoshiJudgeBean == const $CopyWithPlaceholder()
              ? _value.canKaoshiJudgeBean
              // ignore: cast_nullable_to_non_nullable
              : canKaoshiJudgeBean as CanKaoshiJudgeBean,
      canViewKaojuanJudgeBean:
          canViewKaojuanJudgeBean == const $CopyWithPlaceholder()
              ? _value.canViewKaojuanJudgeBean
              // ignore: cast_nullable_to_non_nullable
              : canViewKaojuanJudgeBean as CanViewKaojuanJudgeBean,
      ksText:
          ksText == const $CopyWithPlaceholder()
              ? _value.ksText
              // ignore: cast_nullable_to_non_nullable
              : ksText as String,
    );
  }
}

extension $DataItemCopyWith on DataItem {
  /// Returns a callable class that can be used as follows: `instanceOfDataItem.copyWith(...)` or like so:`instanceOfDataItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DataItemCWProxy get copyWith => _$DataItemCWProxyImpl(this);
}

abstract class _$SummaryCWProxy {
  Summary diagnosisTrainUnfinishCount(dynamic diagnosisTrainUnfinishCount);

  Summary classTrainUnfinishCount(dynamic classTrainUnfinishCount);

  Summary mockUnfinishCount(dynamic mockUnfinishCount);

  Summary basisFinishPercentage(dynamic basisFinishPercentage);

  Summary diagnosisFlag(bool diagnosisFlag);

  Summary examDoneCount(int examDoneCount);

  Summary examTodoCount(int examTodoCount);

  Summary diagnosisReportCount(int diagnosisReportCount);

  Summary examTotalCount(int examTotalCount);

  Summary clsNames(List<String> clsNames);

  Summary notDoneExamFlag(bool notDoneExamFlag);

  Summary notDoneTrainFlag(bool notDoneTrainFlag);

  Summary trainAfterDiagnosisUnFinishCount(
    dynamic trainAfterDiagnosisUnFinishCount,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Summary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Summary(...).copyWith(id: 12, name: "My name")
  /// ````
  Summary call({
    dynamic diagnosisTrainUnfinishCount,
    dynamic classTrainUnfinishCount,
    dynamic mockUnfinishCount,
    dynamic basisFinishPercentage,
    bool diagnosisFlag,
    int examDoneCount,
    int examTodoCount,
    int diagnosisReportCount,
    int examTotalCount,
    List<String> clsNames,
    bool notDoneExamFlag,
    bool notDoneTrainFlag,
    dynamic trainAfterDiagnosisUnFinishCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSummary.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSummary.copyWith.fieldName(...)`
class _$SummaryCWProxyImpl implements _$SummaryCWProxy {
  const _$SummaryCWProxyImpl(this._value);

  final Summary _value;

  @override
  Summary diagnosisTrainUnfinishCount(dynamic diagnosisTrainUnfinishCount) =>
      this(diagnosisTrainUnfinishCount: diagnosisTrainUnfinishCount);

  @override
  Summary classTrainUnfinishCount(dynamic classTrainUnfinishCount) =>
      this(classTrainUnfinishCount: classTrainUnfinishCount);

  @override
  Summary mockUnfinishCount(dynamic mockUnfinishCount) =>
      this(mockUnfinishCount: mockUnfinishCount);

  @override
  Summary basisFinishPercentage(dynamic basisFinishPercentage) =>
      this(basisFinishPercentage: basisFinishPercentage);

  @override
  Summary diagnosisFlag(bool diagnosisFlag) =>
      this(diagnosisFlag: diagnosisFlag);

  @override
  Summary examDoneCount(int examDoneCount) =>
      this(examDoneCount: examDoneCount);

  @override
  Summary examTodoCount(int examTodoCount) =>
      this(examTodoCount: examTodoCount);

  @override
  Summary diagnosisReportCount(int diagnosisReportCount) =>
      this(diagnosisReportCount: diagnosisReportCount);

  @override
  Summary examTotalCount(int examTotalCount) =>
      this(examTotalCount: examTotalCount);

  @override
  Summary clsNames(List<String> clsNames) => this(clsNames: clsNames);

  @override
  Summary notDoneExamFlag(bool notDoneExamFlag) =>
      this(notDoneExamFlag: notDoneExamFlag);

  @override
  Summary notDoneTrainFlag(bool notDoneTrainFlag) =>
      this(notDoneTrainFlag: notDoneTrainFlag);

  @override
  Summary trainAfterDiagnosisUnFinishCount(
    dynamic trainAfterDiagnosisUnFinishCount,
  ) => this(trainAfterDiagnosisUnFinishCount: trainAfterDiagnosisUnFinishCount);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Summary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Summary(...).copyWith(id: 12, name: "My name")
  /// ````
  Summary call({
    Object? diagnosisTrainUnfinishCount = const $CopyWithPlaceholder(),
    Object? classTrainUnfinishCount = const $CopyWithPlaceholder(),
    Object? mockUnfinishCount = const $CopyWithPlaceholder(),
    Object? basisFinishPercentage = const $CopyWithPlaceholder(),
    Object? diagnosisFlag = const $CopyWithPlaceholder(),
    Object? examDoneCount = const $CopyWithPlaceholder(),
    Object? examTodoCount = const $CopyWithPlaceholder(),
    Object? diagnosisReportCount = const $CopyWithPlaceholder(),
    Object? examTotalCount = const $CopyWithPlaceholder(),
    Object? clsNames = const $CopyWithPlaceholder(),
    Object? notDoneExamFlag = const $CopyWithPlaceholder(),
    Object? notDoneTrainFlag = const $CopyWithPlaceholder(),
    Object? trainAfterDiagnosisUnFinishCount = const $CopyWithPlaceholder(),
  }) {
    return Summary(
      diagnosisTrainUnfinishCount:
          diagnosisTrainUnfinishCount == const $CopyWithPlaceholder()
              ? _value.diagnosisTrainUnfinishCount
              // ignore: cast_nullable_to_non_nullable
              : diagnosisTrainUnfinishCount as dynamic,
      classTrainUnfinishCount:
          classTrainUnfinishCount == const $CopyWithPlaceholder()
              ? _value.classTrainUnfinishCount
              // ignore: cast_nullable_to_non_nullable
              : classTrainUnfinishCount as dynamic,
      mockUnfinishCount:
          mockUnfinishCount == const $CopyWithPlaceholder()
              ? _value.mockUnfinishCount
              // ignore: cast_nullable_to_non_nullable
              : mockUnfinishCount as dynamic,
      basisFinishPercentage:
          basisFinishPercentage == const $CopyWithPlaceholder()
              ? _value.basisFinishPercentage
              // ignore: cast_nullable_to_non_nullable
              : basisFinishPercentage as dynamic,
      diagnosisFlag:
          diagnosisFlag == const $CopyWithPlaceholder()
              ? _value.diagnosisFlag
              // ignore: cast_nullable_to_non_nullable
              : diagnosisFlag as bool,
      examDoneCount:
          examDoneCount == const $CopyWithPlaceholder()
              ? _value.examDoneCount
              // ignore: cast_nullable_to_non_nullable
              : examDoneCount as int,
      examTodoCount:
          examTodoCount == const $CopyWithPlaceholder()
              ? _value.examTodoCount
              // ignore: cast_nullable_to_non_nullable
              : examTodoCount as int,
      diagnosisReportCount:
          diagnosisReportCount == const $CopyWithPlaceholder()
              ? _value.diagnosisReportCount
              // ignore: cast_nullable_to_non_nullable
              : diagnosisReportCount as int,
      examTotalCount:
          examTotalCount == const $CopyWithPlaceholder()
              ? _value.examTotalCount
              // ignore: cast_nullable_to_non_nullable
              : examTotalCount as int,
      clsNames:
          clsNames == const $CopyWithPlaceholder()
              ? _value.clsNames
              // ignore: cast_nullable_to_non_nullable
              : clsNames as List<String>,
      notDoneExamFlag:
          notDoneExamFlag == const $CopyWithPlaceholder()
              ? _value.notDoneExamFlag
              // ignore: cast_nullable_to_non_nullable
              : notDoneExamFlag as bool,
      notDoneTrainFlag:
          notDoneTrainFlag == const $CopyWithPlaceholder()
              ? _value.notDoneTrainFlag
              // ignore: cast_nullable_to_non_nullable
              : notDoneTrainFlag as bool,
      trainAfterDiagnosisUnFinishCount:
          trainAfterDiagnosisUnFinishCount == const $CopyWithPlaceholder()
              ? _value.trainAfterDiagnosisUnFinishCount
              // ignore: cast_nullable_to_non_nullable
              : trainAfterDiagnosisUnFinishCount as dynamic,
    );
  }
}

extension $SummaryCopyWith on Summary {
  /// Returns a callable class that can be used as follows: `instanceOfSummary.copyWith(...)` or like so:`instanceOfSummary.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SummaryCWProxy get copyWith => _$SummaryCWProxyImpl(this);
}

abstract class _$ItestExamResultCWProxy {
  ItestExamResult pageSize(int pageSize);

  ItestExamResult totalNum(int totalNum);

  ItestExamResult currentPage(int currentPage);

  ItestExamResult totalPage(int totalPage);

  ItestExamResult data(List<DataItem> data);

  ItestExamResult pageInfo(dynamic pageInfo);

  ItestExamResult summary(Summary summary);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamResult(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamResult call({
    int pageSize,
    int totalNum,
    int currentPage,
    int totalPage,
    List<DataItem> data,
    dynamic pageInfo,
    Summary summary,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItestExamResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItestExamResult.copyWith.fieldName(...)`
class _$ItestExamResultCWProxyImpl implements _$ItestExamResultCWProxy {
  const _$ItestExamResultCWProxyImpl(this._value);

  final ItestExamResult _value;

  @override
  ItestExamResult pageSize(int pageSize) => this(pageSize: pageSize);

  @override
  ItestExamResult totalNum(int totalNum) => this(totalNum: totalNum);

  @override
  ItestExamResult currentPage(int currentPage) =>
      this(currentPage: currentPage);

  @override
  ItestExamResult totalPage(int totalPage) => this(totalPage: totalPage);

  @override
  ItestExamResult data(List<DataItem> data) => this(data: data);

  @override
  ItestExamResult pageInfo(dynamic pageInfo) => this(pageInfo: pageInfo);

  @override
  ItestExamResult summary(Summary summary) => this(summary: summary);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamResult(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamResult call({
    Object? pageSize = const $CopyWithPlaceholder(),
    Object? totalNum = const $CopyWithPlaceholder(),
    Object? currentPage = const $CopyWithPlaceholder(),
    Object? totalPage = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? pageInfo = const $CopyWithPlaceholder(),
    Object? summary = const $CopyWithPlaceholder(),
  }) {
    return ItestExamResult(
      pageSize:
          pageSize == const $CopyWithPlaceholder()
              ? _value.pageSize
              // ignore: cast_nullable_to_non_nullable
              : pageSize as int,
      totalNum:
          totalNum == const $CopyWithPlaceholder()
              ? _value.totalNum
              // ignore: cast_nullable_to_non_nullable
              : totalNum as int,
      currentPage:
          currentPage == const $CopyWithPlaceholder()
              ? _value.currentPage
              // ignore: cast_nullable_to_non_nullable
              : currentPage as int,
      totalPage:
          totalPage == const $CopyWithPlaceholder()
              ? _value.totalPage
              // ignore: cast_nullable_to_non_nullable
              : totalPage as int,
      data:
          data == const $CopyWithPlaceholder()
              ? _value.data
              // ignore: cast_nullable_to_non_nullable
              : data as List<DataItem>,
      pageInfo:
          pageInfo == const $CopyWithPlaceholder()
              ? _value.pageInfo
              // ignore: cast_nullable_to_non_nullable
              : pageInfo as dynamic,
      summary:
          summary == const $CopyWithPlaceholder()
              ? _value.summary
              // ignore: cast_nullable_to_non_nullable
              : summary as Summary,
    );
  }
}

extension $ItestExamResultCopyWith on ItestExamResult {
  /// Returns a callable class that can be used as follows: `instanceOfItestExamResult.copyWith(...)` or like so:`instanceOfItestExamResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItestExamResultCWProxy get copyWith => _$ItestExamResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItestExamListResponse _$ItestExamListResponseFromJson(
  Map<String, dynamic> json,
) => ItestExamListResponse(
  code: (json['code'] as num?)?.toInt() ?? 0,
  msg: json['msg'] as String? ?? '',
  rs:
      json['rs'] == null
          ? ItestExamResult.emptyInstance()
          : ItestExamResult.fromJson(json['rs'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItestExamListResponseToJson(
  ItestExamListResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'msg': instance.msg,
  'rs': instance.rs.toJson(),
};

RateObjFinal _$RateObjFinalFromJson(Map<String, dynamic> json) => RateObjFinal(
  ratedSectionIds: json['ratedSectionIds'] as List<dynamic>? ?? [],
  rateItems: json['rateItems'] as List<dynamic>? ?? [],
);

Map<String, dynamic> _$RateObjFinalToJson(RateObjFinal instance) =>
    <String, dynamic>{
      'ratedSectionIds': instance.ratedSectionIds,
      'rateItems': instance.rateItems,
    };

CanKaoshiJudgeBean _$CanKaoshiJudgeBeanFromJson(Map<String, dynamic> json) =>
    CanKaoshiJudgeBean(
      stuCanEnterKaoshi: json['stuCanEnterKaoshi'] as bool? ?? false,
      stuCanEnterEnroll: json['stuCanEnterEnroll'] as bool? ?? false,
      stuCanCancelEnroll: json['stuCanCancelEnroll'] as bool? ?? false,
      examCanCountdown: json['examCanCountdown'] as bool? ?? false,
      countdownSeconds: json['countdownSeconds'],
      kaoshiStatusInfo: json['kaoshiStatusInfo'],
      kaoshiBtnInfo: json['kaoshiBtnInfo'],
      examType: (json['examType'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CanKaoshiJudgeBeanToJson(CanKaoshiJudgeBean instance) =>
    <String, dynamic>{
      'stuCanEnterKaoshi': instance.stuCanEnterKaoshi,
      'stuCanEnterEnroll': instance.stuCanEnterEnroll,
      'stuCanCancelEnroll': instance.stuCanCancelEnroll,
      'examCanCountdown': instance.examCanCountdown,
      'countdownSeconds': instance.countdownSeconds,
      'kaoshiStatusInfo': instance.kaoshiStatusInfo,
      'kaoshiBtnInfo': instance.kaoshiBtnInfo,
      'examType': instance.examType,
    };

CanViewKaojuanJudgeBean _$CanViewKaojuanJudgeBeanFromJson(
  Map<String, dynamic> json,
) => CanViewKaojuanJudgeBean(
  stuCanViewScore: json['stuCanViewScore'] as bool? ?? false,
  scoreText: json['scoreText'] as String? ?? '',
  scoreReason: json['scoreReason'] as String? ?? '',
  stuCanViewKaojuan: json['stuCanViewKaojuan'] as bool? ?? false,
  kaojuanReason: json['kaojuanReason'] as String? ?? '',
  canShowPaper: (json['canShowPaper'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CanViewKaojuanJudgeBeanToJson(
  CanViewKaojuanJudgeBean instance,
) => <String, dynamic>{
  'stuCanViewScore': instance.stuCanViewScore,
  'scoreText': instance.scoreText,
  'scoreReason': instance.scoreReason,
  'stuCanViewKaojuan': instance.stuCanViewKaojuan,
  'kaojuanReason': instance.kaojuanReason,
  'canShowPaper': instance.canShowPaper,
};

DataItem _$DataItemFromJson(Map<String, dynamic> json) => DataItem(
  uid: (json['uid'] as num?)?.toInt() ?? 0,
  ksdId: (json['ksdId'] as num?)?.toInt() ?? 0,
  finish: (json['finish'] as num?)?.toInt() ?? 0,
  delFlag: (json['delFlag'] as num?)?.toInt() ?? 0,
  ksId: (json['ksId'] as num?)?.toInt() ?? 0,
  ksName: json['ksName'] as String? ?? '',
  examCodeFlag: json['examCodeFlag'] as bool? ?? false,
  examType: json['examType'],
  restrictBeginTime: (json['restrictBeginTime'] as num?)?.toInt() ?? 0,
  restrictEndTime: (json['restrictEndTime'] as num?)?.toInt() ?? 0,
  beginTime: json['beginTime'],
  processStep: (json['processStep'] as num?)?.toInt() ?? 0,
  enrollStartTime: json['enrollStartTime'],
  enrollEndTime: json['enrollEndTime'],
  ansBeginTime: json['ansBeginTime'],
  clsId: (json['clsId'] as num?)?.toInt() ?? 0,
  ksLimit: (json['ksLimit'] as num?)?.toInt() ?? 0,
  checkTime: (json['checkTime'] as num?)?.toInt() ?? 0,
  beingOrOver: (json['beingOrOver'] as num?)?.toInt() ?? 0,
  countdownSeconds: json['countdownSeconds'],
  examCanCountdown: json['examCanCountdown'] as bool? ?? false,
  endayFlag: (json['endayFlag'] as num?)?.toInt() ?? 0,
  realCheckTime: json['realCheckTime'],
  rateStatus: (json['rateStatus'] as num?)?.toInt() ?? 0,
  autoRateJson: json['autoRateJson'],
  rateJson: json['rateJson'],
  ansSubmitTime: json['ansSubmitTime'],
  kcId: (json['kcId'] as num?)?.toInt() ?? 0,
  ksDelFlag: json['ksDelFlag'] as bool? ?? false,
  enrollDelFlag: (json['enrollDelFlag'] as num?)?.toInt() ?? 0,
  isNeiWangKs: (json['isNeiWangKs'] as num?)?.toInt() ?? 0,
  showKaoshiTimeType: (json['showKaoshiTimeType'] as num?)?.toInt() ?? 0,
  showKaoshiTimeContent: json['showKaoshiTimeContent'],
  enrollMaxStuCount: (json['enrollMaxStuCount'] as num?)?.toInt() ?? 0,
  realEnrollStuCount: (json['realEnrollStuCount'] as num?)?.toInt() ?? 0,
  kaoshiNote: json['kaoshiNote'],
  kcName: json['kcName'],
  checkContentType: (json['checkContentType'] as num?)?.toInt() ?? 0,
  viewSubMacScorFlag: (json['viewSubMacScorFlag'] as num?)?.toInt() ?? 0,
  subMacScorFlag: (json['subMacScorFlag'] as num?)?.toInt() ?? 0,
  guidangTime: json['guidangTime'],
  isSupportApp: (json['isSupportApp'] as num?)?.toInt() ?? 0,
  ppId: (json['ppId'] as num?)?.toInt() ?? 0,
  tplId: (json['tplId'] as num?)?.toInt() ?? 0,
  zhiyueFlag: (json['zhiyueFlag'] as num?)?.toInt() ?? 0,
  examTypeEnum: json['examTypeEnum'] as String? ?? '',
  postType: json['postType'],
  taskMode: json['taskMode'],
  scorePercentage: json['scorePercentage'],
  finalScoreType: json['finalScoreType'],
  score: json['score'],
  answerTimes: json['answerTimes'],
  standardScore: json['standardScore'],
  current: json['current'] as bool? ?? false,
  totalScore: (json['totalScore'] as num?)?.toInt() ?? 0,
  examTag: (json['examTag'] as num?)?.toInt() ?? 0,
  skill: (json['skill'] as num?)?.toInt() ?? 0,
  level: (json['level'] as num?)?.toInt() ?? 0,
  mark: (json['mark'] as num?)?.toInt() ?? 0,
  type: (json['type'] as num?)?.toInt() ?? 0,
  allowEntryId: json['allowEntryId'],
  rateScore: (json['rateScore'] as num?)?.toInt() ?? 0,
  ksLimitStr: json['ksLimitStr'],
  faceRecognize: json['faceRecognize'],
  terminal: (json['terminal'] as num?)?.toInt() ?? 0,
  terminalList:
      (json['terminalList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  cetOralFlag: (json['cetOralFlag'] as num?)?.toInt() ?? 0,
  hasFaceRecognize: json['hasFaceRecognize'],
  hasFaceRecognizeCount: json['hasFaceRecognizeCount'],
  commitment: json['commitment'],
  rtcFlag: json['rtcFlag'],
  captureFlag: (json['captureFlag'] as num?)?.toInt() ?? 0,
  screenMonitoringFlag: (json['screenMonitoringFlag'] as num?)?.toInt() ?? 0,
  competitionFlag: (json['competitionFlag'] as num?)?.toInt() ?? 0,
  recordFlag: (json['recordFlag'] as num?)?.toInt() ?? 0,
  classX: json['class'] as bool?,
  rateObjFinal:
      json['rateObjFinal'] == null
          ? RateObjFinal.emptyInstance()
          : RateObjFinal.fromJson(json['rateObjFinal'] as Map<String, dynamic>),
  diagnosisExam: json['diagnosisExam'] as bool? ?? false,
  viewScore: json['viewScore'] as bool? ?? false,
  kaoshiShowTimeForCurrentStu: json['kaoshiShowTimeForCurrentStu'],
  ansBeginAndEndTimeShow: json['ansBeginAndEndTimeShow'] as String? ?? '',
  enrollStartEndTime: json['enrollStartEndTime'] as String? ?? '',
  examEnrollInfo: json['examEnrollInfo'] as String? ?? '',
  restrictBeginTimeStr: json['restrictBeginTimeStr'] as String? ?? '',
  restrictEndTimeStr: json['restrictEndTimeStr'] as String? ?? '',
  beginTimeStr: json['beginTimeStr'] as String? ?? '',
  enrollStartTimeStr: json['enrollStartTimeStr'] as String? ?? '',
  enrollEndTimeStr: json['enrollEndTimeStr'] as String? ?? '',
  ansBeginTimeStr: json['ansBeginTimeStr'] as String? ?? '',
  ansSubmitTimeStr: json['ansSubmitTimeStr'] as String? ?? '',
  school: json['school'] as bool? ?? false,
  task: json['task'] as bool? ?? false,
  canKaoshiJudgeBean:
      json['canKaoshiJudgeBean'] == null
          ? CanKaoshiJudgeBean.emptyInstance()
          : CanKaoshiJudgeBean.fromJson(
            json['canKaoshiJudgeBean'] as Map<String, dynamic>,
          ),
  canViewKaojuanJudgeBean:
      json['canViewKaojuanJudgeBean'] == null
          ? CanViewKaojuanJudgeBean.emptyInstance()
          : CanViewKaojuanJudgeBean.fromJson(
            json['canViewKaojuanJudgeBean'] as Map<String, dynamic>,
          ),
  ksText: json['ksText'] as String? ?? '',
);

Map<String, dynamic> _$DataItemToJson(DataItem instance) => <String, dynamic>{
  'uid': instance.uid,
  'ksdId': instance.ksdId,
  'finish': instance.finish,
  'delFlag': instance.delFlag,
  'ksId': instance.ksId,
  'ksName': instance.ksName,
  'examCodeFlag': instance.examCodeFlag,
  'examType': instance.examType,
  'restrictBeginTime': instance.restrictBeginTime,
  'restrictEndTime': instance.restrictEndTime,
  'beginTime': instance.beginTime,
  'processStep': instance.processStep,
  'enrollStartTime': instance.enrollStartTime,
  'enrollEndTime': instance.enrollEndTime,
  'ansBeginTime': instance.ansBeginTime,
  'clsId': instance.clsId,
  'ksLimit': instance.ksLimit,
  'checkTime': instance.checkTime,
  'beingOrOver': instance.beingOrOver,
  'countdownSeconds': instance.countdownSeconds,
  'examCanCountdown': instance.examCanCountdown,
  'endayFlag': instance.endayFlag,
  'realCheckTime': instance.realCheckTime,
  'rateStatus': instance.rateStatus,
  'autoRateJson': instance.autoRateJson,
  'rateJson': instance.rateJson,
  'ansSubmitTime': instance.ansSubmitTime,
  'kcId': instance.kcId,
  'ksDelFlag': instance.ksDelFlag,
  'enrollDelFlag': instance.enrollDelFlag,
  'isNeiWangKs': instance.isNeiWangKs,
  'showKaoshiTimeType': instance.showKaoshiTimeType,
  'showKaoshiTimeContent': instance.showKaoshiTimeContent,
  'enrollMaxStuCount': instance.enrollMaxStuCount,
  'realEnrollStuCount': instance.realEnrollStuCount,
  'kaoshiNote': instance.kaoshiNote,
  'kcName': instance.kcName,
  'checkContentType': instance.checkContentType,
  'viewSubMacScorFlag': instance.viewSubMacScorFlag,
  'subMacScorFlag': instance.subMacScorFlag,
  'guidangTime': instance.guidangTime,
  'isSupportApp': instance.isSupportApp,
  'ppId': instance.ppId,
  'tplId': instance.tplId,
  'zhiyueFlag': instance.zhiyueFlag,
  'examTypeEnum': instance.examTypeEnum,
  'postType': instance.postType,
  'taskMode': instance.taskMode,
  'scorePercentage': instance.scorePercentage,
  'finalScoreType': instance.finalScoreType,
  'score': instance.score,
  'answerTimes': instance.answerTimes,
  'standardScore': instance.standardScore,
  'current': instance.current,
  'totalScore': instance.totalScore,
  'examTag': instance.examTag,
  'skill': instance.skill,
  'level': instance.level,
  'mark': instance.mark,
  'type': instance.type,
  'allowEntryId': instance.allowEntryId,
  'rateScore': instance.rateScore,
  'ksLimitStr': instance.ksLimitStr,
  'faceRecognize': instance.faceRecognize,
  'terminal': instance.terminal,
  'terminalList': instance.terminalList,
  'cetOralFlag': instance.cetOralFlag,
  'hasFaceRecognize': instance.hasFaceRecognize,
  'hasFaceRecognizeCount': instance.hasFaceRecognizeCount,
  'commitment': instance.commitment,
  'rtcFlag': instance.rtcFlag,
  'captureFlag': instance.captureFlag,
  'screenMonitoringFlag': instance.screenMonitoringFlag,
  'competitionFlag': instance.competitionFlag,
  'recordFlag': instance.recordFlag,
  'class': instance.classX,
  'rateObjFinal': instance.rateObjFinal.toJson(),
  'diagnosisExam': instance.diagnosisExam,
  'viewScore': instance.viewScore,
  'kaoshiShowTimeForCurrentStu': instance.kaoshiShowTimeForCurrentStu,
  'ansBeginAndEndTimeShow': instance.ansBeginAndEndTimeShow,
  'enrollStartEndTime': instance.enrollStartEndTime,
  'examEnrollInfo': instance.examEnrollInfo,
  'restrictBeginTimeStr': instance.restrictBeginTimeStr,
  'restrictEndTimeStr': instance.restrictEndTimeStr,
  'beginTimeStr': instance.beginTimeStr,
  'enrollStartTimeStr': instance.enrollStartTimeStr,
  'enrollEndTimeStr': instance.enrollEndTimeStr,
  'ansBeginTimeStr': instance.ansBeginTimeStr,
  'ansSubmitTimeStr': instance.ansSubmitTimeStr,
  'school': instance.school,
  'task': instance.task,
  'canKaoshiJudgeBean': instance.canKaoshiJudgeBean.toJson(),
  'canViewKaojuanJudgeBean': instance.canViewKaojuanJudgeBean.toJson(),
  'ksText': instance.ksText,
};

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
  diagnosisTrainUnfinishCount: json['diagnosisTrainUnfinishCount'],
  classTrainUnfinishCount: json['classTrainUnfinishCount'],
  mockUnfinishCount: json['mockUnfinishCount'],
  basisFinishPercentage: json['basisFinishPercentage'],
  diagnosisFlag: json['diagnosisFlag'] as bool? ?? false,
  examDoneCount: (json['examDoneCount'] as num?)?.toInt() ?? 0,
  examTodoCount: (json['examTodoCount'] as num?)?.toInt() ?? 0,
  diagnosisReportCount: (json['diagnosisReportCount'] as num?)?.toInt() ?? 0,
  examTotalCount: (json['examTotalCount'] as num?)?.toInt() ?? 0,
  clsNames:
      (json['clsNames'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  notDoneExamFlag: json['notDoneExamFlag'] as bool? ?? false,
  notDoneTrainFlag: json['notDoneTrainFlag'] as bool? ?? false,
  trainAfterDiagnosisUnFinishCount: json['trainAfterDiagnosisUnFinishCount'],
);

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
  'diagnosisTrainUnfinishCount': instance.diagnosisTrainUnfinishCount,
  'classTrainUnfinishCount': instance.classTrainUnfinishCount,
  'mockUnfinishCount': instance.mockUnfinishCount,
  'basisFinishPercentage': instance.basisFinishPercentage,
  'diagnosisFlag': instance.diagnosisFlag,
  'examDoneCount': instance.examDoneCount,
  'examTodoCount': instance.examTodoCount,
  'diagnosisReportCount': instance.diagnosisReportCount,
  'examTotalCount': instance.examTotalCount,
  'clsNames': instance.clsNames,
  'notDoneExamFlag': instance.notDoneExamFlag,
  'notDoneTrainFlag': instance.notDoneTrainFlag,
  'trainAfterDiagnosisUnFinishCount': instance.trainAfterDiagnosisUnFinishCount,
};

ItestExamResult _$ItestExamResultFromJson(Map<String, dynamic> json) =>
    ItestExamResult(
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
      totalNum: (json['totalNum'] as num?)?.toInt() ?? 0,
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
      totalPage: (json['totalPage'] as num?)?.toInt() ?? 0,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => DataItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pageInfo: json['pageInfo'],
      summary:
          json['summary'] == null
              ? Summary.emptyInstance()
              : Summary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItestExamResultToJson(ItestExamResult instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'totalNum': instance.totalNum,
      'currentPage': instance.currentPage,
      'totalPage': instance.totalPage,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'pageInfo': instance.pageInfo,
      'summary': instance.summary.toJson(),
    };
