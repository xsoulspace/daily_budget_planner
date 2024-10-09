import 'package:mobile_app/ui_root/ui_root.dart';

Future<void> runMobileApp() async => bootstrapMain(
      builder: DBPApp.new,
    );
