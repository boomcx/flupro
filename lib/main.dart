import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'base/extensions/custom_scroll_extension.dart';
import 'base/widgets/toast.dart';
import 'config.dart';
import 'providers.dart';
import 'router.dart';
import 'support_files/theme.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('app');

  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      overrides: [
        // appConfigProvider.overrideWithValue(testConfig),
        appConfigProvider.overrideWithValue(betaConfig),
      ],
      child: const FluproApp(),
    ),
  );
}

class FluproApp extends ConsumerWidget {
  const FluproApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProivder);

    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      scrollBehavior: CustomScrollBehavior(),
      supportedLocales: const [Locale('zh')],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      builder: (context, child) {
        var rChild = child!;
        rChild = Toast.init(context, rChild);
        return rChild;
      },
    );
  }
}
