import 'package:flutter/material.dart';

/// Background for each ContextMenu
typedef Widget ContextMenuCardBuilder(
    BuildContext context, List<Widget> children);

class ContextMenuCard extends StatelessWidget {
  const ContextMenuCard(
      {Key? key,
      required this.children,
      this.borderRadius,
      this.bgColor,
      this.border,
      this.shadows,
      this.padding})
      : super(key: key);
  final List<Widget> children;
  final Border? border;
  final BorderRadius? borderRadius;
  final Color? bgColor;
  final List<BoxShadow>? shadows;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    Color shadowColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    BorderRadius radius = borderRadius ?? BorderRadius.circular(4);
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: 250,
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          maxHeight: MediaQuery.of(context).size.height * 0.8),
      child: ClipRRect(
        borderRadius: radius,
        child: SingleChildScrollView(
          child: Container(
              padding: padding ?? EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
                border: border ?? Border.all(color: Colors.grey.shade300),
                borderRadius: radius,
                boxShadow: shadows ??
                    [
                      BoxShadow(
                          color: shadowColor.withOpacity(.05),
                          blurRadius: 4,
                          offset: Offset(2, 2)),
                      BoxShadow(
                          color: shadowColor.withOpacity(.02),
                          blurRadius: 2,
                          offset: Offset(2, 2)),
                    ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              )),
        ),
      ),
    );
  }
}
