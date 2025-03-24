import 'package:bcc_review_app/core/exceptions/app_exception.dart';

class SubjectLocalServiceException extends AppException {
  SubjectLocalServiceException(super.message, [super.stackTrace]);
}

//not found
class SubjectNotFoundException extends SubjectLocalServiceException {
  SubjectNotFoundException(super.message, [super.stackTrace]);
}
