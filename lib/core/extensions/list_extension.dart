///
/// list_extension.dart
/// lib/core/extensions
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

extension StringExtension on List? {
  List ifNull(List value) {
    return this ?? value;
  }
}
