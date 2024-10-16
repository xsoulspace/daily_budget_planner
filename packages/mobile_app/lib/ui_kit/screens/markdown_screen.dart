import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/common_imports.dart';

class MarkdownScreen extends StatefulWidget {
  const MarkdownScreen({
    required this.markdownUrlSource,
    super.key,
  });
  final String markdownUrlSource;

  @override
  State<MarkdownScreen> createState() => _MarkdownScreenState();
}

class _MarkdownScreenState extends State<MarkdownScreen> {
  bool _loading = true;
  String _markdownString = '';
  @override
  void initState() {
    super.initState();
    unawaited(_onLoad());
  }

  Future<void> _onLoad() async {
    final githubFetch = GithubFetch._();
    _markdownString = await githubFetch.fetchRaw(url: widget.markdownUrlSource);
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

class GithubFetch with HasLocalApis {
  GithubFetch._();

  static const _cachePrefix = 'github_fetch_';
  static const _cacheDuration = Duration(days: 1);

  Future<String> fetchRaw({required final String url}) async {
    final prefs = localDb;
    final cacheKey = '$_cachePrefix$url';
    await prefs.setString(key: cacheKey, value: '');
    final cachedData = await prefs.getString(key: cacheKey);
    final cachedTime = await prefs.getInt(key: '${cacheKey}_time');

    final cacheAge = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(cachedTime),
    );
    if (cachedData.isNotEmpty && cacheAge < _cacheDuration) {
      return cachedData;
    }

    final response = await http.get(Uri.parse(url));
    final fetchedData = response.body;

    await prefs.setString(key: cacheKey, value: fetchedData);
    await prefs.setInt(
      key: '${cacheKey}_time',
      value: DateTime.now().millisecondsSinceEpoch,
    );

    return fetchedData;
  }
}
