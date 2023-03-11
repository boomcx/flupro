import 'package:event_bus/event_bus.dart';

import '../app.dart';

final eventBusProvider = Provider<EventBus>((ref) {
  return EventBus();
});
