import 'package:mobile_app/ui_root/ui_root.dart';

Future<void> runMobileApp([final AppBootstrapDto? dto]) async =>
    bootstrapMain(builder: DBPApp.new, dto: dto);
