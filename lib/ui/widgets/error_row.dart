import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

Row buildErrorRow({String err}) => Row(
      children: [
        ImageIcon(
          AssetImage(
            ImagesAsset.errorIcon,
          ),
          size: 10.0,
          color: ColorPalettes.primaryColor,
        ),
        SizedBox(
          width: 6.0,
        ),
        Text(
          err,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.red,
          ),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    );
