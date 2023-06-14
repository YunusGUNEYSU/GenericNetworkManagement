enum DioType {
  post('POST'),
  get('GET');

  const DioType(this.dioType);
  final String dioType;
  @override
  String toString() => dioType;
}
