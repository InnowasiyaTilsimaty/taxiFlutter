enum Status { loading, loaded, error }

class ApiResponse<T> {
  Status? status;

  T? data;

  String? message;

  ApiResponse(
    this.status,
    this.data,
    this.message,
  );

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.loaded(this.data) : status = Status.loaded;

  ApiResponse.error(this.message) : status = Status.error;
}
