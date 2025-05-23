///
/// datetime_extension.dart
/// lib/core/extensions
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

extension DateTimeExtension on DateTime? {
  DateTime ifNull(DateTime value) {
    return this ?? value;
  }
}
