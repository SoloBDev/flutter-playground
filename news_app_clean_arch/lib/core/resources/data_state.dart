import 'package:dio/dio.dart';

// this abstract class communicate with the network calls
abstract class DataState<T> {
  final T ? data;
  final DioException ? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}