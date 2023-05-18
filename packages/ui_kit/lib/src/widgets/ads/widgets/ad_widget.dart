import 'package:core/core.dart';
import 'package:provider/provider.dart';

import '../../../../ui_kit.dart';
import '../models/models.dart';
import '../states/states.dart';

abstract class AdWidget extends StatelessWidget {
  const AdWidget({required super.key});
  String getAdUnitId(
    final AdPermissions permissions,
    final WidthFormFactor screenWidth,
  );
  bool isAdAllowed(final AdPermissions permissions);
  Widget builder(final BuildContext context, final String adUnitId);
  Widget debugBuilder(final BuildContext context);
  @override
  Widget build(final BuildContext context) {
    final adManager = context.read<AdManager>();
    final permissions = adManager.permissions;
    if (permissions.adsNotAllowed) return const SizedBox();
    if (!isAdAllowed(permissions)) return const SizedBox();

    final uiTheme = UiTheme.of(context);
    final screenWidth = uiTheme.persistentFormFactors.width;

    if (Envs.instance.isDebugAds) return debugBuilder(context);

    final adUnitId = getAdUnitId(permissions, screenWidth);
    if (adUnitId.isEmpty) return const SizedBox();

    return builder(context, adUnitId);
  }
}
