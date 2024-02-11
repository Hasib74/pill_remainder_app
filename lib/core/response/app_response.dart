sealed class AppResponse<T> {}

class Success<T> extends AppResponse<T> {
  final T data;

  Success(this.data);
}

class Loading<T> extends AppResponse<T> {
  String? message;

  Loading(this.message);
}

class Error<T> extends AppResponse<T> {
  final String message;

  Error(this.message);
}
