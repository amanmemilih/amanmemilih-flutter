///
/// catch_error.dart
/// lib/core/errors
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'dart:io';

import 'package:dio/dio.dart';

import 'errors.dart';

// Handle All Custom Error Here...
class CustomCatchError {
  static Failure? getFailure(err, stackTrace) {
    if (err is DataNotFoundException) {
      return const DataNotFoundFailure();
    } else if (err is UnableToOpenGoogleMapsException) {
      return const UnableToOpenGoogleMapsFailure();
    } else if (err is VoucherInvalidException) {
      return VoucherInvalidFailure(err.message);
    } else if (err is LocationPermissionDeniedException) {
      return const LocationPermissionDeniedFailure();
    } else if (err is VoucherInvalidException) {
      return const LocationPermissionDisabledFailure();
    } else if (err is LocationPermissionDeniedPermanentException) {
      return const LocationPermissionDeniedPermanentFailure();
    } else if (err is InvalidGivenDataFailure) {
      return InvalidGivenDataFailure(err.message, err.data);
    } else if (err is InvalidLoginCredentialException) {
      return InvalidLoginCredentialsFailure();
    } else if (err is UserNotRegisteredException) {
      return UserNotRegisteredFailure();
    } else if (err is InvalidRegisterPhraseException) {
      return InvalidRegisterPhraseFailure();
    }

    return null;
  }
}

class CatchError {
  // Catch all posible errors
  static Failure getFailure(err, stackTrace) {
    Failure? failure;
    bool isCustomError = false;

    // Handle Custom Exception
    final Failure? customFailure = CustomCatchError.getFailure(err, stackTrace);

    if (customFailure != null) {
      failure = customFailure;
      isCustomError = true;
    }

    // Handle DioException
    if (err is DioException) {
      final Failure? dioFailure = DioCatchError.getFailure(err);

      if (dioFailure != null) failure = dioFailure;
    }

    // Handle FormatException
    if (err is FormatException) {
      failure = const FormatFailure();
    }

    // Handle ApiException
    if (err is ApiException) {
      failure = ApiCatchError.getFailure(err);
    }

    // Handle UnableToProccessException
    if (err.toString().contains("is not a subtype of")) {
      failure = const UnableToProcessFailure();
    }

    failure ??= const UnexpectedFailure();

    if (isCustomError) {
      return failure;
    }

    // Check if application on development
    return DevelopmentCatchError.getFailure(err, stackTrace, failure);
    // if (FlavorConfig.isDevelopment() && !isCustomError) {
    // } else {
    //   return failure;
    // }
  }
}

class DevelopmentCatchError {
  static Failure getFailure(err, stackTrace, failure) {
    return DevelopmentFailure(
      failure: failure,
      runtimeType: err.runtimeType,
      message: err.toString(),
      stackTrace: stackTrace,
    );
  }
}

class ApiCatchError {
  static Failure getFailure(err) {
    if (err.code == 400) {
      return InvalidGivenDataFailure(err.message, null);
    } else if (err.code == 401) {
      return const UnauthorizedRequestFailure();
    }

    return ApiFailure(code: err.code, message: err.message);
  }
}

class DioCatchError {
  static Failure? getFailure(err) {
    switch (err.type) {
      case DioExceptionType.cancel:
        return const RequestCancelledFailure();
      case DioExceptionType.connectionTimeout:
        return const RequestTimeoutFailure();
      case DioExceptionType.unknown:
        if (err.error is SocketException) {
          return const NoInternetConnectionFailure();
        } else {
          return const OtherErrorFailure();
        }
      case DioExceptionType.receiveTimeout:
        return const SendTimeoutFailure();
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            return const BadRequestFailure();
          case 401:
            return const UnauthorizedRequestFailure();
          case 403:
            return const ForbiddenErrorFailure();
          case 404:
            return const NotFoundFailure();
          case 409:
            return const ConflictFailure();
          case 408:
            return const RequestTimeoutFailure();
          case 500:
            return const InternalServerErrorFailure();
          case 503:
            return const ServiceUnavailableFailure();
          case 429:
            return const TooManyAttemptRequestFailure();
          default:
            return const OtherErrorFailure();
        }
      case DioExceptionType.sendTimeout:
        return const SendTimeoutFailure();
      case DioExceptionType.badCertificate:
        return const BadCertificateFailure();
      case DioExceptionType.connectionError:
        return const SendTimeoutFailure();
      default:
        return null;
    }
  }
}
