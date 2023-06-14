// ignore_for_file: public_member_api_docs, sort_constructors_first
class BaseError implements Exception {
  final String message;
  BaseError(this.message);

  @override
  String toString() {
    // TODO: implement toString
    return "Error Message=$message";
  }
}
