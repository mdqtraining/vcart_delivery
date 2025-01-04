import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Model/AcoountScreenModel/account_model.dart';

class OptionTile extends StatefulWidget {

  final accountModel account;

  const OptionTile({super.key,required this.account});

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // Background color of the tile
      elevation: 4, // Adds shadow to the tile
      borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
      child: Container(
        //width: ,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 8), // Inner padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Leading widget
            if (widget.account.leading != null) widget.account.leading!,
            // Title
            Expanded(
              child: Text(
                widget.account.title ?? "",
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis, // Handle long text
              ),
            ),
            // Trailing icon
            SvgPicture.asset(
              "assets/svg_icons/account_svg/arrow_right.svg_icons",
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}