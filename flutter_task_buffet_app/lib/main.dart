import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'services/task_service.dart';
import 'pages/home_page.dart';

void main() {
  runApp(TaskBuffetApp());
}

final ValueNotifier<String> _debugRouteName = ValueNotifier<String>('HomePage');

class DebugRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  void _update(Route<dynamic>? route) {
    final name = route?.settings.name;
    if (name != null && name.isNotEmpty) {
      _debugRouteName.value = name;
    } else {
      _debugRouteName.value = route?.runtimeType.toString() ?? 'Unknown';
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute) _update(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute is PageRoute) _update(previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute is PageRoute) _update(newRoute);
  }
}

final DebugRouteObserver _debugRouteObserver = DebugRouteObserver();

class TaskBuffetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskService(),
      child: MaterialApp(
        title: 'Task Buffet',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: 'HomePage',
        routes: {
          'HomePage': (_) => HomePage(),
        },
        navigatorObservers: kDebugMode ? [_debugRouteObserver] : const <NavigatorObserver>[],
        builder: (context, child) {
          if (!kDebugMode || child == null) return child ?? SizedBox.shrink();
          return Stack(
            children: [
              child,
              Positioned(
                right: 8,
                bottom: 8,
                child: IgnorePointer(
                  child: ValueListenableBuilder<String>(
                    valueListenable: _debugRouteName,
                    builder: (_, name, __) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          name,
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
