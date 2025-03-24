import 'package:bcc_review_app/core/exceptions/app_exception.dart';

class UserLocalServiceException extends AppException {
  UserLocalServiceException(super.message, [super.stackTrace]);
}

class UserNotFoundException extends AppException {
  UserNotFoundException(super.message, [super.stackTrace]);
}

class UserAlreadyExistsException extends AppException {
  UserAlreadyExistsException(super.message, [super.stackTrace]);
}
