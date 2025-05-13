///
/// int_extension.dart
/// lib/core/extensions
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

extension DoubleExtension on double? {
  double ifNull(double value) {
    return this ?? value;
  }
}
