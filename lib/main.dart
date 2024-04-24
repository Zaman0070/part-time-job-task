import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';
import 'package:jorden_job_task/features/categories/view/category_screen.dart';
import 'package:jorden_job_task/routes/route_manager.dart';
import 'package:jorden_job_task/utils/constants/app_constants.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //screenUtil package to make design responsive
    return ScreenUtilInit(
      designSize:
          const Size(AppConstants.screenWidget, AppConstants.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(
                  // ignore: deprecated_member_use
                  textScaleFactor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? 0.9
                          : 1),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Task',
          onGenerateRoute: AppRoutes.onGenerateRoute,
          home: const CategoryScreen()
        );
      },
    );
  }
}
