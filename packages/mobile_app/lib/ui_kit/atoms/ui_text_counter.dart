import 'package:mobile_app/common_imports.dart';

class UiTextCounter extends StatefulWidget {
  const UiTextCounter({
    required this.value,
    this.delay = Duration.zero,
    this.textAlign = TextAlign.start,
    super.key,
    this.style,
    this.prefix = '',
    this.suffix = '',
  });
  final TextAlign textAlign;
  final int value;
  final TextStyle? style;
  final String prefix;
  final String suffix;
  final Duration delay;

  @override
  State<UiTextCounter> createState() => _UiTextCounterState();
}

class _UiTextCounterState extends State<UiTextCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  Animation<Color?>? _colorAnimation;
  late int _oldValue;
  bool _isFirstBuild = true;

  @override
  void initState() {
    super.initState();
    _oldValue = widget.value;
    _controller = AnimationController(duration: 450.milliseconds, vsync: this);
    _setupAnimation();
  }

  void _setupAnimation() {
    _animation = IntTween(begin: _oldValue, end: widget.value).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, _controller.forward);
    }
  }

  void _setupColorAnimation() {
    final decrementColor = widget.style?.color; // context.colorScheme.error
    final incrementColor =
        widget.style?.color; // const Color.fromARGB(255, 35, 124, 79)
    _colorAnimation = ColorTween(
      begin: _oldValue > widget.value ? decrementColor : incrementColor,
      end: widget.style?.color,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(final UiTextCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _oldValue = oldWidget.value;
      _controller.reset();
      _setupAnimation();
      _setupColorAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    if (_isFirstBuild) {
      _setupColorAnimation();
      _isFirstBuild = false;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (final context, final child) {
        final displayValue = _animation.value;
        final displayColor = _colorAnimation?.value ?? widget.style?.color;
        return Text(
          '${widget.prefix}$displayValue${widget.suffix}',
          style: widget.style?.copyWith(color: displayColor),
          textAlign: widget.textAlign,
        );
      },
    );
  }
}
