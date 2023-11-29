import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProjectsRecord extends FirestoreRecord {
  ProjectsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  bool hasGoal() => _goal != null;

  // "due_date" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "project_creator" field.
  DocumentReference? _projectCreator;
  DocumentReference? get projectCreator => _projectCreator;
  bool hasProjectCreator() => _projectCreator != null;

  // "project_team" field.
  List<DocumentReference>? _projectTeam;
  List<DocumentReference> get projectTeam => _projectTeam ?? const [];
  bool hasProjectTeam() => _projectTeam != null;

  // "projectHour" field.
  String? _projectHour;
  String get projectHour => _projectHour ?? '';
  bool hasProjectHour() => _projectHour != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _goal = snapshotData['goal'] as String?;
    _dueDate = snapshotData['due_date'] as DateTime?;
    _projectCreator = snapshotData['project_creator'] as DocumentReference?;
    _projectTeam = getDataList(snapshotData['project_team']);
    _projectHour = snapshotData['projectHour'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectsRecord.fromSnapshot(s));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectsRecord.fromSnapshot(s));

  static ProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectsRecordData({
  String? title,
  String? goal,
  DateTime? dueDate,
  DocumentReference? projectCreator,
  String? projectHour,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'goal': goal,
      'due_date': dueDate,
      'project_creator': projectCreator,
      'projectHour': projectHour,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectsRecordDocumentEquality implements Equality<ProjectsRecord> {
  const ProjectsRecordDocumentEquality();

  @override
  bool equals(ProjectsRecord? e1, ProjectsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.goal == e2?.goal &&
        e1?.dueDate == e2?.dueDate &&
        e1?.projectCreator == e2?.projectCreator &&
        listEquality.equals(e1?.projectTeam, e2?.projectTeam) &&
        e1?.projectHour == e2?.projectHour;
  }

  @override
  int hash(ProjectsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.goal,
        e?.dueDate,
        e?.projectCreator,
        e?.projectTeam,
        e?.projectHour
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectsRecord;
}
