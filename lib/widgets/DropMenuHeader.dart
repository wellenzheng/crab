import 'package:crab/widgets/DropMenuBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:realank_flutter_bloc/realank_flutter_bloc.dart';

typedef FilterBarCallback = void Function(bool isSelected);

class DropMenuHeader extends StatefulWidget implements PreferredSizeWidget {
  DropMenuHeader({
    @required this.height,
    this.items,
  });

  double height;
  final List<ButtonModel> items;

  Size get preferredSize => Size.fromHeight(height);

  @override
  DropMenuHeaderState createState() {
    // TODO: implement createState
    return new DropMenuHeaderState();
  }
}

class ButtonModel {
  final String text;
  final Color normalColor;
  final Color selectedColor;
  String imageName;
  bool dataSelected;
  FilterBarCallback onTap;

  ButtonModel(
      {this.text,
      this.normalColor,
      this.selectedColor,
      this.imageName =
          "resources/dropMenu_images/mmc_dropMenu_up_normal@2x.png",
      this.dataSelected = false,
      this.onTap});
}

class DropMenuHeaderState extends State<DropMenuHeader> {
  int selectedIndex = 999;

  button(ButtonModel buttonModel) {
    int index = widget.items.indexOf(buttonModel);

    return RLKBLoCBuilder(
        builder: (BuildContext context, Map data, RLKBaseBLoC bloc) {
      DropMenuHeaderBLoC bloc2 = bloc as DropMenuHeaderBLoC;
      if (data["selectedIndex"] == 999) {
        selectedIndex = 999;
      }

      if (buttonModel.text == "筛选") {
        buttonModel.dataSelected = data["filterData"];
      }
      return Container(
          color: Colors.white,
          padding: EdgeInsets.all(0),
          height: 44,
          child: GestureDetector(
            onTap: () {
              if (selectedIndex == index) {
                selectedIndex = 999;
              } else {
                selectedIndex = index;
              }
              bloc2.headerUnSelect(0);
              buttonModel.onTap(index == selectedIndex);
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          buttonModel.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: buttonModel.dataSelected
                                ? buttonModel.selectedColor ?? Color(0xFFF12E49)
                                : buttonModel.normalColor ?? Color(0xFF333333),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage((index == selectedIndex)
                            ? 'resources/dropMenu_images/mmc_dropMenu_down_normal@2x.png'
                            : 'resources/dropMenu_images/mmc_dropMenu_up_normal@2x.png'),
                        width: 10,
                        height: 10,
                        color: buttonModel.dataSelected
                            ? buttonModel.selectedColor ?? Color(0xFFF12E49)
                            : buttonModel.normalColor ?? Color(0xFF333333),
                      ),
                      index == widget.items.length - 1
                          ? Container()
                          : Container(
                              height: widget.height,
                              color: Color(0xFFE5E5E5),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }

  double screenWidth;
  int menuCount;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    MediaQueryData mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    menuCount = widget.items.length;

    return Container(
      height: widget.height,
      child: GridView.count(
        crossAxisCount: menuCount,
        //子Widget宽高比例
        childAspectRatio: (screenWidth / menuCount) / widget.height,
        children: widget.items.map<Widget>((item) {
          return button(item);
        }).toList(),
      ),
    );
  }
}
