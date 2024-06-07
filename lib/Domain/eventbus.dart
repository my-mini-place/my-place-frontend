import 'package:event_bus/event_bus.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class EventBusManager {
  final EventBus eventBus = EventBus();
}
