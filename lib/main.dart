import 'lib.dart';
import 'global.dart';
import 'common/common.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter U-learning App',
          onGenerateRoute: AppPages.generateRouteSettings,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.primaryText),
              backgroundColor: AppColors.primaryBackground,
            ),
          ),
        ),
      ),
    );
  }
}
