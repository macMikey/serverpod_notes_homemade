import 'dart:io';

import 'package:serverpod_notes_homemade_server/src/web/widgets/default_page_widget.dart';
import 'package:serverpod/serverpod.dart';

class RouteRoot extends WidgetRoute {
  @override
  Future<Widget> build(Session session, HttpRequest request) async {
    return DefaultPageWidget();
  }
}
