import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 1000);
EventTransformer<E> throttleDroppable<E>({
  Duration duration = throttleDuration,
}) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

const debounceDuration = Duration(microseconds: 300);
EventTransformer<E> debounceDroppable<E>({
  Duration duration = debounceDuration,
}) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}
