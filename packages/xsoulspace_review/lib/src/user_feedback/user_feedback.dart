import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

typedef UserFeedbackWiredashDto = ({
  String projectId,
  String secret,
  FutureOr<CustomizableWiredashMetaData> Function(
    CustomizableWiredashMetaData metaData,
  )? collectMetaData,
  WiredashFeedbackOptions? feedbackOptions,
  PsOptions? psOptions,
  WiredashThemeData? theme,
  WiredashOptionsData? options,
  EdgeInsets? padding,
});

class UserFeedback extends StatelessWidget {
  const UserFeedback.wiredash({
    required this.child,
    required final UserFeedbackWiredashDto dto,
    super.key,
  }) : wiredashDto = dto;
  final Widget child;
  final UserFeedbackWiredashDto wiredashDto;
  static void show(final BuildContext context) => Wiredash.of(context).show();

  @override
  Widget build(final BuildContext context) => Wiredash(
        projectId: wiredashDto.projectId,
        secret: wiredashDto.secret,
        collectMetaData: wiredashDto.collectMetaData,
        feedbackOptions: wiredashDto.feedbackOptions,
        psOptions: wiredashDto.psOptions,
        theme: wiredashDto.theme,
        options: wiredashDto.options,
        padding: wiredashDto.padding,
        child: child,
      );
}
