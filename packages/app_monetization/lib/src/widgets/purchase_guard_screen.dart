import 'package:flutter/material.dart';

/// {@template purchase_guard_screen}
/// A widget that acts as a guard for premium features,
/// prompting the user to make a purchase if necessary.
/// {@endtemplate}
class PurchaseGuardScreen extends StatefulWidget {
  /// {@macro purchase_guard_screen}
  const PurchaseGuardScreen({
    required this.child,
    required this.hasAccess,
    required this.onPurchase,
    super.key,
  });

  /// The child widget to display if the user has access.
  final Widget child;

  /// Callback to check if the user has access to the premium feature.
  final Future<bool> Function() hasAccess;

  /// Callback to initiate the purchase process.
  final Future<void> Function() onPurchase;

  @override
  _PurchaseGuardScreenState createState() => _PurchaseGuardScreenState();
}

class _PurchaseGuardScreenState extends State<PurchaseGuardScreen> {
  late Future<bool> _accessFuture;

  @override
  void initState() {
    super.initState();
    // ignore: discarded_futures
    _accessFuture = _checkAccess();
  }

  Future<bool> _checkAccess() async => widget.hasAccess();

  @override
  Widget build(final BuildContext context) => FutureBuilder<bool>(
        future: _accessFuture,
        builder: (final context, final snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final hasAccess = snapshot.data ?? false;

          if (hasAccess) {
            return widget.child;
          }

          return Center(
            child: ElevatedButton(
              onPressed: () async {
                await widget.onPurchase();
                setState(() {
                  _accessFuture = _checkAccess();
                });
              },
              child: const Text('Purchase to Access'),
            ),
          );
        },
      );
}
