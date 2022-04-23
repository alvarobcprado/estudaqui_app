import 'package:faeng_courses/app/presentation/common/utils/functions.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/widgets/youtube_content_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseContentView extends StatelessWidget {
  const CourseContentView({
    Key? key,
    required this.content,
  }) : super(key: key);

  final String content;

  bool isYoutubeUrl(String url) {
    return url.contains(
      RegExp('''^(https?://)?((www.)?youtube.com|youtu.be)/.+\$'''),
    );
  }

  void _launchUrl(String? url) async {
    final Uri uri = Uri.parse(url ?? '');
    if (!await launchUrl(uri)) {}
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Html(
        data: content,
        shrinkWrap: true,
        style: {
          "p": Style(
            fontSize: FontSize.large,
            lineHeight: const LineHeight(24 / 16),
          ),
        },
        onLinkTap: (url, _, __, ___) => _launchUrl(url),
        customRender: {
          "video": (RenderContext ctx, Widget widget) {
            final element = ctx.tree as VideoContentElement;

            if (isYoutubeUrl(element.src.first ?? '')) {
              final videoId = convertUrlToId(
                element.src.first!,
              );
              return YoutubeContentPlayer(videoId: videoId ?? '');
            }
            return null;
          },
        },
      ),
    );
  }
}
