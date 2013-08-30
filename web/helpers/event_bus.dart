part of auctions;

class EventBus {
  final _map = {};

  Stream stream(String eventType){
    _map.putIfAbsent(eventType, () => new StreamController());
    return _map[eventType].stream;
  }

  EventSink sink(String eventType){
    _map.putIfAbsent(eventType, () => new StreamController());
    return _map[eventType].sink;
  }

  StreamSubscription listen(String eventType, callback) =>
  stream(eventType).listen(callback);

  fire(String eventType, event) =>
  sink(eventType).add(event);
}
