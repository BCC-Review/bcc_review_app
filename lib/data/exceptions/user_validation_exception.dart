import 'package:bcc_review_app/core/exceptions/app_exception.dart';

class UserValidationException extends AppException {
  UserValidationException(super.message, [super.stackTrace]);
}
