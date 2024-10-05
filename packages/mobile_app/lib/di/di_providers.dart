import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/core.dart';
import 'package:mobile_app/data_local_api/user_local_api.dart';
import 'package:provider/provider.dart';
import 'package:ui_locale/ui_locale.dart';

class RootDiProviders extends StatelessWidget {
  const RootDiProviders({
    required this.providers,
    required this.builder,
    super.key,
  });
  final RootProvidersModel providers;
  final WidgetBuilder builder;

  @override
  Widget build(final BuildContext context) => MultiProvider(
        providers: [
          Provider(create: providers.analyticsService),
          Provider(create: providers.localApiServices),
          Provider(create: providers.remoteApiServices),
          Provider(create: (final context) => context.read<UserLocalApi>()),
          Provider(create: providers.repositories),
          Provider(create: (final context) => L10nScope()),
        ],
        builder: (final context, final child) => builder(context),
      );
}

class BlocDiProviders extends StatelessWidget {
  const BlocDiProviders({
    required this.providers,
    required this.builder,
    super.key,
  });

  final BlocProvidersModel providers;
  final WidgetBuilder builder;

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: providers.userCubit),
          BlocProvider(create: providers.authCubit),
        ],
        child: Builder(builder: builder),
      );
}
