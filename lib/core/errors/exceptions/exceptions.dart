///
/// exceptions.dart
/// lib/core/errors/exceptions
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:equatable/equatable.dart';

// Api Exception
class ApiException extends Equatable implements Exception {
  final int? code;
  final String? message;

  const ApiException(this.code, this.message);

  @override
  List<Object?> get props => [code, message];
}

// Custom Exception
class DataNotFoundException extends Equatable implements Exception {
  const DataNotFoundException();

  @override
  List<Object?> get props => [];
}

class UnableToProcessException extends Equatable implements Exception {
  const UnableToProcessException();

  @override
  List<Object?> get props => [];
}

class VoucherInvalidException extends Equatable implements Exception {
  String message;

  VoucherInvalidException(this.message);

  @override
  List<Object?> get props => [message];
}

class UnableToOpenGoogleMapsException extends Equatable implements Exception {
  const UnableToOpenGoogleMapsException();

  @override
  List<Object?> get props => [];
}

class LocationPermissionDeniedException extends Equatable implements Exception {
  const LocationPermissionDeniedException();

  @override
  List<Object?> get props => [];
}

class LocationPermissionDeniedPermanentException extends Equatable
    implements Exception {
  const LocationPermissionDeniedPermanentException();

  @override
  List<Object?> get props => [];
}

class LocationDisabledException extends Equatable implements Exception {
  const LocationDisabledException();

  @override
  List<Object?> get props => [];
}

class InvalidLoginCredentialException extends Equatable implements Exception {
  const InvalidLoginCredentialException();

  @override
  List<Object?> get props => [];
}

class UserNotRegisteredException extends Equatable implements Exception {
  const UserNotRegisteredException();

  @override
  List<Object?> get props => [];
}

class InvalidRegisterPhraseException extends Equatable implements Exception {
  const InvalidRegisterPhraseException();

  @override
  List<Object?> get props => [];
}
