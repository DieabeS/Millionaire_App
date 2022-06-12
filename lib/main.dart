import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart';
import 'package:millionaire_app/helpers/local_provider.dart';
import 'package:millionaire_app/route/auto_route.gr.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  LocaleProvider.createInstance(
    locale: await findSystemLocale(),
  );
  runApp(EasyLocalization(
    child: App(),
    supportedLocales: const [Locale('en'), Locale('ar')],
    useOnlyLangCode: false,
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
  ));
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      title: "Millionaire",
      // theme: ThemeData(fontFamily: 'PTSans  '),
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        defaultScale: true,
        maxWidth: 1200,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
      ),
    );
  }
}
