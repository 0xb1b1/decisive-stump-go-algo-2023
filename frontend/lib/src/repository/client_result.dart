typedef EmptyResult = ClientResult<void>;

class ClientResult<T> {
  final T? _value;
  final Object? _error;
  final StackTrace? _stackTrace;
  final bool succeed;

  // ignore: avoid_positional_boolean_parameters
  ClientResult(this._value, this._error, this.succeed, [this._stackTrace]);

  ClientResult.succeed(this._value)
      : succeed = true,
        _error = null,
        _stackTrace = null;

  ClientResult.failed(this._error, [this._stackTrace])
      : succeed = false,
        _value = null;

  // ignore: void_checks
  static EmptyResult empty() => ClientResult.succeed(() {});

  T? get value => _value;

  Object? get error => _error;

  StackTrace? get stackTrace => _stackTrace;
}
