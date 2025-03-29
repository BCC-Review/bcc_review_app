import 'package:bcc_review_app/core/exceptions/app_exception.dart';

class ModuleLocalServiceException extends AppException {
  ModuleLocalServiceException(super.message, [super.stackTrace]);
}

//not found
class ModuleNotFoundException extends ModuleLocalServiceException {
  ModuleNotFoundException(super.message, [super.stackTrace]);
}