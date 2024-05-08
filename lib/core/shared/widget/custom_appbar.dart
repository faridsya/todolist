import 'package:flutter/material.dart';
import 'package:simple_todo_app/core/config/extensions.dart';



class CustomAppBar extends AppBar {
  CustomAppBar(BuildContext context,
      {Key? key,
      double? toolbarHeight,
      Color? backgroundColor,
      bool autoImplyLeading = true,
      bool implyLeadingDark = false,
        bool back=true,
      String? title,
      Widget? titleWidget,
      List<Widget>? actions,
      PreferredSizeWidget? bottom,
      Widget? flexibleSpace,
      ShapeBorder? shape,
      VoidCallback? onWillPop})
      : super(
          key: key,
          toolbarHeight: toolbarHeight ?? context.dp(68),
          elevation: 0,
          leadingWidth: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: SizedBox(
            height: toolbarHeight ?? context.dp(68),
            child: Stack(
              children: [
                if(back)Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: onWillPop ?? () => Navigator.pop(context),
                    child: Container(
                      width: context.dp(44),
                      height: context.dp(44),
                      margin: EdgeInsets.only(
                          top: context.dp(20),
                          left: context.dp(24),
                          right: context.dp(8)),
                      padding: EdgeInsets.all(context.dp(1)),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: context.hintColor)),
                      child: const Icon(Icons.chevron_left_rounded),
                    ),
                  ),
                ),
                if (title != null || titleWidget != null)
                  Align(
                    alignment: (titleWidget != null)
                        ? Alignment.bottomCenter
                        : Alignment.center,
                    child: Container(
                      width: context.dw - context.dp(100),
                      margin: EdgeInsets.only(left: context.dp(58)),
                      height: (title != null) ? double.infinity : null,
                      alignment:
                          (title != null) ? Alignment.bottomCenter : null,
                      padding: (title != null)
                          ? EdgeInsets.only(
                              bottom: context.dp(8), right: context.dp(14))
                          : null,
                      child: titleWidget ??
                          Text(
                            title!,
                            style: context.text.headlineMedium?.copyWith(
                                fontSize: 20, color: context.onBackground),
                          ),
                    ),
                  ),
              ],
            ),
          ),
          actions: actions,
          backgroundColor: backgroundColor ?? Colors.transparent,
          surfaceTintColor: backgroundColor ?? Colors.transparent,
          scrolledUnderElevation: 0,
          shadowColor: Colors.transparent,
          bottom: bottom,
          flexibleSpace: flexibleSpace,
          shape: shape,
          titleTextStyle: context.text.titleLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.onBackground,
          ),
        );
}
