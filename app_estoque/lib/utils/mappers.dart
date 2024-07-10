import 'package:intl/intl.dart';

bool fromJsonBoolean(dynamic value) => value is int ? value == 1 : (value as bool?) ?? true;
bool fromJsonBooleanIfNullFalse(dynamic value) => value is int ? value == 1 : (value as bool?) ?? false;
Map<String, dynamic> toJsonRepository(Map<String, dynamic> json) =>
    json.map((key, value) => MapEntry(key.capitalize(), value));

Map<String, dynamic> fromJsonRepository(Map<String, dynamic> json) =>
    json.map((key, value) => MapEntry(key.uncapitalize(), value));

extension ExtensionString on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String uncapitalize() {
    return "${this[0].toLowerCase()}${substring(1)}";
  }
}

extension ExtensionInt on int? {
  String? toStringOrNull() {
    return this == null ? null : toString();
  }
}

extension ExtensionDateTime on DateTime {
  String toStringDDmmYYYY() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
