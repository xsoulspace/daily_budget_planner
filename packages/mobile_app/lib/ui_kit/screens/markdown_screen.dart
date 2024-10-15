import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/common_imports.dart';

class MdScreen extends StatefulWidget {
  const MdScreen({
    required this.markdownUrlSource,
    super.key,
  });
  final String markdownUrlSource;

  @override
  State<MdScreen> createState() => _MdScreenState();
}

class _MdScreenState extends State<MdScreen> {
  bool _loading = true;
  String _markdownString = '';
  @override
  void initState() {
    super.initState();
    unawaited(_onLoad());
  }

  Future<void> _onLoad() async {
    _markdownString = await GithubFetch.fetchRaw(url: widget.markdownUrlSource);

    setState(() => _loading = false);
  }

  @override
  Widget build(final BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: _loading
              ? const UiCircularProgress()
              : Markdown(
                  data: _markdownString,
                  padding: const EdgeInsets.all(24),
                ),
        ),
      );
}

// TODO(arenukvern): cache for one day
// TODO(arenukvern): replace to Github API
class GithubFetch {
  GithubFetch._();
  static Future<String> fetchRaw({
    required final String url,
  }) async {
    final response = await http.get(Uri.parse(url));
    return response.body;
  }
}
