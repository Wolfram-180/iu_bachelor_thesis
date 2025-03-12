abstract class RemoteResource<T> {
  const RemoteResource._();

  const factory RemoteResource.loading() = LoadingRemoteResource;
  const factory RemoteResource.error(String errorMessage) = ErrorRemoteResource;
  const factory RemoteResource.finished(T value) = FinishedRemoteResource;

  RemoteResource<T> mapIfFinished(T Function(T) mapper) {
    if (this is FinishedRemoteResource) {
      return RemoteResource.finished(mapper(asFinished().value));
    }
    return this;
  }

  FinishedRemoteResource<T> asFinished() {
    return this as FinishedRemoteResource<T>;
  }

  ErrorRemoteResource<T> asError() {
    return this as ErrorRemoteResource<T>;
  }

  R when<R>({
    required R Function(T) finished,
    required R Function(String errorMessage) error,
    required R Function() loading,
  }) {
    if (this is FinishedRemoteResource<T>) return finished(asFinished().value);
    if (this is ErrorRemoteResource<T>) return error(asError().errorMessage);
    if (this is LoadingRemoteResource<T>) return loading();
    throw UnimplementedError();
  }
}

class ErrorRemoteResource<T> extends RemoteResource<T> {
  final String errorMessage;

  const ErrorRemoteResource(this.errorMessage) : super._();
}

class LoadingRemoteResource<T> extends RemoteResource<T> {
  const LoadingRemoteResource() : super._();
}

class FinishedRemoteResource<T> extends RemoteResource<T> {
  final T value;
  const FinishedRemoteResource(this.value) : super._();
}
