import 'lib.dart';
import '/common/common.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        // option: DefaultFirebaseOptions.currentPlatform
        );
    storageService = await StorageService().init();
  }
}
