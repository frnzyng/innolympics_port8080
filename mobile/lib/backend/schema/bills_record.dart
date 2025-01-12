import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillsRecord extends FirestoreRecord {
  BillsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "billNo" field.
  String? _billNo;
  String get billNo => _billNo ?? '';
  bool hasBillNo() => _billNo != null;

  // "billTitle" field.
  String? _billTitle;
  String get billTitle => _billTitle ?? '';
  bool hasBillTitle() => _billTitle != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "coAuthors" field.
  String? _coAuthors;
  String get coAuthors => _coAuthors ?? '';
  bool hasCoAuthors() => _coAuthors != null;

  // "committeeReferral" field.
  String? _committeeReferral;
  String get committeeReferral => _committeeReferral ?? '';
  bool hasCommitteeReferral() => _committeeReferral != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "fullBillFile" field.
  String? _fullBillFile;
  String get fullBillFile => _fullBillFile ?? '';
  bool hasFullBillFile() => _fullBillFile != null;

  // "scope" field.
  String? _scope;
  String get scope => _scope ?? '';
  bool hasScope() => _scope != null;

  // "submittedAt" field.
  String? _submittedAt;
  String get submittedAt => _submittedAt ?? '';
  bool hasSubmittedAt() => _submittedAt != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  void _initializeFields() {
    _author = snapshotData['author'] as String?;
    _billNo = snapshotData['billNo'] as String?;
    _billTitle = snapshotData['billTitle'] as String?;
    _category = snapshotData['category'] as String?;
    _coAuthors = snapshotData['coAuthors'] as String?;
    _committeeReferral = snapshotData['committeeReferral'] as String?;
    _date = snapshotData['date'] as String?;
    _fullBillFile = snapshotData['fullBillFile'] as String?;
    _scope = snapshotData['scope'] as String?;
    _submittedAt = snapshotData['submittedAt'] as String?;
    _summary = snapshotData['summary'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bills');

  static Stream<BillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BillsRecord.fromSnapshot(s));

  static Future<BillsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BillsRecord.fromSnapshot(s));

  static BillsRecord fromSnapshot(DocumentSnapshot snapshot) => BillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BillsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BillsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BillsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBillsRecordData({
  String? author,
  String? billNo,
  String? billTitle,
  String? category,
  String? coAuthors,
  String? committeeReferral,
  String? date,
  String? fullBillFile,
  String? scope,
  String? submittedAt,
  String? summary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'billNo': billNo,
      'billTitle': billTitle,
      'category': category,
      'coAuthors': coAuthors,
      'committeeReferral': committeeReferral,
      'date': date,
      'fullBillFile': fullBillFile,
      'scope': scope,
      'submittedAt': submittedAt,
      'summary': summary,
    }.withoutNulls,
  );

  return firestoreData;
}

class BillsRecordDocumentEquality implements Equality<BillsRecord> {
  const BillsRecordDocumentEquality();

  @override
  bool equals(BillsRecord? e1, BillsRecord? e2) {
    return e1?.author == e2?.author &&
        e1?.billNo == e2?.billNo &&
        e1?.billTitle == e2?.billTitle &&
        e1?.category == e2?.category &&
        e1?.coAuthors == e2?.coAuthors &&
        e1?.committeeReferral == e2?.committeeReferral &&
        e1?.date == e2?.date &&
        e1?.fullBillFile == e2?.fullBillFile &&
        e1?.scope == e2?.scope &&
        e1?.submittedAt == e2?.submittedAt &&
        e1?.summary == e2?.summary;
  }

  @override
  int hash(BillsRecord? e) => const ListEquality().hash([
        e?.author,
        e?.billNo,
        e?.billTitle,
        e?.category,
        e?.coAuthors,
        e?.committeeReferral,
        e?.date,
        e?.fullBillFile,
        e?.scope,
        e?.submittedAt,
        e?.summary
      ]);

  @override
  bool isValidKey(Object? o) => o is BillsRecord;
}
