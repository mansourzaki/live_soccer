import 'constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.EMPTY;
    } else {
      return this!;
    }
  }
}

extension NonNullList on List? {
  List orIsEmpty() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.ZERO;
    } else {
      return this!;
    }
  }
}
