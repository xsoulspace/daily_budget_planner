import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';

TabControllerListenerState useTabControllerListenerState({
  required final ValueChanged<int> onTabChanged,
}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'TabControllerListenerState',
        state: TabControllerListenerState(
          onTabChanged: onTabChanged,
        ),
      ),
    );

class TabControllerListenerState extends ContextfulLifeState {
  TabControllerListenerState({
    required this.onTabChanged,
  });
  final ValueChanged<int> onTabChanged;

  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) {
      if (mounted) {
        _tabController ??= DefaultTabController.of(getContext());
        _tabController?.addListener(_onChanged);
      }
    });
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    final tabController = _tabController;
    if (tabController == null) return;
    if (tabController.indexIsChanging) return;
    onTabChanged(tabController.index);
  }
}
