import 'package:flutter/material.dart';
import 'package:money_app/ui/screens/home/components/answer_container.dart';
import 'package:money_app/ui/screens/home/components/home_header.dart';
import 'package:money_app/ui/screens/home/components/info_container.dart';
import 'package:money_app/ui/screens/home/components/question_container.dart';
import 'package:money_app/utils/color_palettes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/utils/images_asset.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          //physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              //floating: true,
              delegate: CollapsedPersistentHeader(
                widget: HomeHeader(),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: PersistentHeader(
                widget: QuestionContainer(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 1,
                  childAspectRatio: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                  // Don't know what to do here
                  (context, index) {
                    if (index <= 9) {
                      return AnswerContainer();
                    }
                    return null;
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No more answers",
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Cairo'),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    ImageIcon(
                      AssetImage(ImagesAsset.heartsIcon),
                      color: ColorPalettes.appAccentColor,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      //height: 260.0,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        elevation: 2.0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 260;

  @override
  double get minExtent => 260;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class CollapsedPersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  CollapsedPersistentHeader({
    this.widget,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      //height: 260.0,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
