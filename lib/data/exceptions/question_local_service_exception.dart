import 'package:bcc_review_app/core/exceptions/app_exception.dart';

class QuestionLocalServiceException extends AppException {
  QuestionLocalServiceException(super.message, [super.stackTrace]);
}

//not found
class QuestionNotFoundException extends QuestionLocalServiceException {
  QuestionNotFoundException(super.message, [super.stackTrace]);
}
