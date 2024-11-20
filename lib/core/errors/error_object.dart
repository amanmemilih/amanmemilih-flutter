///
/// error_object.dart
/// lib/core/errors
///
/// Created by Indra Mahesa https://github.com/zinct
///

import 'package:equatable/equatable.dart';
import 'package:localization/localization.dart';

import '../localization/localization_text.dart';
import 'errors.dart';

class ErrorObject extends Equatable {
  const ErrorObject({
    required this.title,
    required this.message,
    required this.shortMessage,
    required this.failure,
    this.isDevelopment = false,
  });

  final String title;
  final String message;
  final String shortMessage;
  final Failure failure;
  final bool isDevelopment;

  @override
  List<Object?> get props => [title, message, isDevelopment];

  static ErrorObject mapFailureToErrorObject(Failure failure) {
    return failure.when(
      apiFailure: (code, message) => ErrorObject(
        title: LocalizationText.titleFailureMessage,
        failure: failure,
        message: message ?? LocalizationText.unexpectedFailure,
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      requestCancelledFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.requestCancelledFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      unauthorisedRequestFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.unauthorisedRequestFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      badRequestFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.badCertificateFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      notFoundFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.notFoundFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      methodNotAllowedFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.methodNotAllowedFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      notAcceptableFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.notAcceptableFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      requestTimeoutFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.requestTimeoutFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      sendTimeoutFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.sendTimeoutFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      conflictFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.conflictFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      internalServerErrorFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.internalServerErrorFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      notImplementedFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.notImplementedFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      serviceUnavailableFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.serviceUnavailableFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      noInternetConnectionFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.noInternetConnectionFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      formatFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.formatFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      unableToProcessFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.unableToProcessFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      otherErrorFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.otherErrorFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      unexpectedFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.unexpectedFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      forbiddenErrorFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.forbiddenErrorFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      badCertificateFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.badCertificateFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      dataNotFoundFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.dataNotFoundFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      developmentFailure: (failure, runtimeType, message, stackTrace) =>
          ErrorObject(
        title: 'Error Type: ${runtimeType.toString()}',
        failure: failure,
        message: 'Message: $message\n\nStackTrace: ${stackTrace.toString()}',
        shortMessage:
            'Message: $message\n\nStackTrace: ${stackTrace.toString()}',
        isDevelopment: true,
      ),
      tooManyAttemptRequestFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.tooManyAttemptRequestFailure.i18n(),
        shortMessage: LocalizationText.shortMessageFailure.i18n(),
      ),
      unableToOpenGoogleMaps: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.unableToOpenGoogleMapsFailure.i18n(),
        shortMessage: LocalizationText.unableToOpenGoogleMapsFailure.i18n(),
      ),
      invalidGiveDataFailure: (message, data) => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: message ?? LocalizationText.invalidGivenDataFailure.i18n(),
        shortMessage: LocalizationText.invalidGivenDataFailure.i18n(),
      ),
      voucherInvalidFailure: (message) => ErrorObject(
        title: message,
        failure: failure,
        message: message,
        shortMessage: message,
      ),
      locationDisabledFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.locationDisabledFailure.i18n(),
        shortMessage: LocalizationText.locationDisabledFailure.i18n(),
      ),
      locationPermissionDeniedFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.locationPermissionDeniedFailure.i18n(),
        shortMessage: LocalizationText.locationPermissionDeniedFailure.i18n(),
      ),
      locationPermissionDeniedPermanentFailure: () => ErrorObject(
        title: LocalizationText.titleFailureMessage.i18n(),
        failure: failure,
        message: LocalizationText.locationPermissionDeniedFailure.i18n(),
        shortMessage: LocalizationText.locationPermissionDeniedFailure.i18n(),
      ),
    );
  }
}
