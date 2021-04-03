import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

class WinnersBoard extends StatelessWidget {
  static String routeName = '/winnersBoard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //       ImagesAsset.celebrationBg,
          //     ),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          decoration:
              BoxDecoration(gradient: ColorPalettes.primaryGradientColor),
          child: Column(
            children: [
              Expanded(
                //fit: FlexFit.loose,
                child: Container(
                  padding:
                      const EdgeInsets.only(right: 15.0, left: 15.0, top: 50.0),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      _itemCard(),
                      _itemCard(),
                      _itemCard(),
                      _itemCard(),
                      _itemCard(),
                      _itemCard(),
                    ],
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.black.withOpacity(0.1),
              //     borderRadius: BorderRadius.only(
              //       topRight: Radius.circular(8),
              //       topLeft: Radius.circular(8),
              //     ),
              //   ),
              //   height: 120,
              //   width: double.infinity,
              //   child: Image.asset(
              //     ImagesAsset.bottomBg,
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemCard() {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      child: new Card(
        color: Colors.transparent,
        elevation: 3.0,
        child: Column(
          children: <Widget>[
            new Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
              child: new FadeInImage.assetNetwork(
                placeholder: ImagesAsset.cupIcon,
                image: ImagesAsset.cupIcon,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 100.0,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Car Mercedes Benz C180",
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: ColorPalettes.appBorderColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Text(
                          "20-12-31",
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 14,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Reward Price : 3000\$",
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      "Maher Ahmad EL-Amary",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class _buildWinnerItem extends StatelessWidget {
//   const _buildWinnerItem({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         children: [
//           Container(
//             height: 150,
//             width: 150,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.2),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(8),
//               ),
//             ),
//             child: Image.asset(
//               ImagesAsset.cupIcon,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Column(
//             children: [
//               Text(
//                 "Car Mercedes Benz C180",
//                 style: TextStyle(
//                   fontFamily: 'Cairo',
//                   fontWeight: FontWeight.w300,
//                   fontSize: 15.0,
//                   color: Colors.white70,
//                 ),
//               ),
//               Text(
//                 "Reward Price : 3000\$",
//                 style: TextStyle(
//                   fontFamily: 'Cairo',
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.w300,
//                   color: Colors.white70,
//                 ),
//               ),
//               Text(
//                 "Maher Ahmad EL-Amary",
//                 style: TextStyle(
//                   fontFamily: 'Cairo',
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.w300,
//                   color: Colors.white70,
//                 ),
//               ),
//               Text(
//                 "20-12-31",
//                 style: TextStyle(
//                   fontFamily: 'Cairo',
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.w300,
//                   color: Colors.white70,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
