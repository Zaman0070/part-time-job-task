import 'package:flutter/cupertino.dart';
import 'package:jorden_job_task/commons/common_imports/common_libs.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: context.primary,
      ),
    );
  }
}
