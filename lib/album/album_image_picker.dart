import 'package:album_image/src/controller/gallery_provider.dart';
import 'package:album_image/src/widgets/app_bar_album.dart';
import 'package:album_image/src/widgets/gallery_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'album_types.dart';

typedef IconWidgetBuilder = Widget Function(
  BuildContext context,
  bool selected,
  int index,
);

class AlbumImagePick extends StatefulWidget {
  /// maximum images allowed (default 1)
  final int maxSelection;

  /// return all selected images
  final Function(List<AssetEntity>) onSelected;

  /// preSelected images
  final List<AssetEntity>? selected;

  /// The album type when requesting paths.
  ///
  ///  * [all] - Request paths that return images and videos.
  ///  * [image] - Request paths that only return images.
  ///  * [video] - Request paths that only return videos.
  final AlbumType type;

  /// image quality thumbnail
  final int thumbnailQuality;

  /// On reach max
  final VoidCallback? onSelectedMax;

  /// thumbnail box fit
  final BoxFit thumbnailBoxFix;

  /// gridview crossAxisCount
  final int crossAxisCount;

  /// gallery gridview aspect ratio
  final double childAspectRatio;

  /// gridView Padding
  final EdgeInsets gridPadding;

  /// gridView physics
  final ScrollPhysics? scrollPhysics;

  /// gridView controller
  final ScrollController? scrollController;

  /// gridView background color
  final Color listBackgroundColor;

  /// grid image backGround color
  final Color itemBackgroundColor;

  /// grid selected image backGround color
  final Color selectedItemBackgroundColor;

  /// dropdown appbar color
  final Color appBarColor;

  ///Icon widget builder
  ///index = -1, not selected yet
  final IconWidgetBuilder? iconSelectionBuilder;

  ///Close widget
  final Widget? closeWidget;

  ///appBar actions widgets
  final List<Widget>? appBarActionWidgets;

  /// album header text color
  final TextStyle albumHeaderTextStyle;

  /// album text color
  final TextStyle albumTextStyle;

  /// album sub text color
  final TextStyle albumSubTextStyle;

  /// album text color
  final double appBarHeight;

  /// album background color
  final Color albumBackGroundColor;

  /// album divider color
  final Color albumDividerColor;

  const AlbumImagePick({
    Key? key,
    this.maxSelection = 1,
    required this.onSelected,
    this.selected,
    this.type = AlbumType.image,
    this.thumbnailBoxFix = BoxFit.cover,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.0,
    this.thumbnailQuality = 200,
    this.gridPadding = EdgeInsets.zero,
    this.listBackgroundColor = Colors.white,
    this.itemBackgroundColor = Colors.grey,
    this.selectedItemBackgroundColor = Colors.grey,
    this.appBarColor = Colors.redAccent,
    this.albumTextStyle = const TextStyle(color: Colors.white, fontSize: 18),
    this.albumHeaderTextStyle =
        const TextStyle(color: Colors.white, fontSize: 18),
    this.albumSubTextStyle = const TextStyle(color: Colors.white, fontSize: 14),
    this.appBarHeight = 45,
    this.albumBackGroundColor = const Color(0xFF333333),
    this.albumDividerColor = const Color(0xFF484848),
    this.appBarActionWidgets,
    this.closeWidget,
    this.iconSelectionBuilder,
    this.scrollPhysics,
    this.scrollController,
    this.onSelectedMax,
  }) : super(key: key);

  @override
  _AlbumImagePickState createState() => _AlbumImagePickState();
}

class _AlbumImagePickState extends State<AlbumImagePick>
    with AutomaticKeepAliveClientMixin {
  late PickerDataProvider provider;

  static Map<int?, AssetEntity?> _createMap() {
    return {};
  }

  @override
  void initState() {
    _initProvider();
    _getPermission();
    super.initState();

    var type = RequestType.image;

    PhotoManager.getAssetPathList(type: type).then((pathList) {
      provider.resetPathList(pathList);

      var cacheMap = _createMap();
      for (var i = 0; i < pathList.length; i++) {
        print(pathList[i].name);
        // print(pathList[i].lastModified!.hour);

        // print(cacheMap[i]!.createDateTime);
        // var asset = cacheMap[i]!.createDateTime;
      }
    });
  }

  PickerDataProvider cameraList() {
    if (provider.max == 0) {
      return provider;
    }
    //写真の撮影された時間を取得する

    for (var i = 0; i < 3; i++) {
      // provider.map((title) => [])
      // PhotoManager.getAssetPathList(type: type).then((pathList) {
      //   setState(() {
      //     provider.resetPathList(pathList);
      //   });

      print(provider.pathList.length);
    }
    //24時間以内に撮影されたものだけを取得する
    return provider;
  }

  @override
  void didUpdateWidget(covariant AlbumImagePick oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.maxSelection != widget.maxSelection) {
      provider.max = widget.maxSelection;
    }
    if (oldWidget.type != widget.type) {
      _refreshPathList();
    }
  }

  void _initProvider() {
    provider = PickerDataProvider(
        picked: widget.selected ?? [], maxSelectionCount: widget.maxSelection);
    provider.onPickMax.addListener(onPickMax);
  }

  void _getPermission() async {
    var result = await PhotoManager.requestPermissionExtend(
      requestOption: const PermisstionRequestOption(
        iosAccessLevel: IosAccessLevel.readWrite,
      ),
    );
    if (result.isAuth) {
      PhotoManager.startChangeNotify();
      PhotoManager.addChangeCallback((value) {
        _refreshPathList();
      });
      if (provider.pathList.isEmpty) {
        _refreshPathList();
      }
    } else {
      PhotoManager.openSetting();
    }
  }

  void _refreshPathList() {
    late RequestType type;
    switch (widget.type) {
      case AlbumType.all:
        type = RequestType.common;
        break;
      case AlbumType.image:
        type = RequestType.image;
        break;
      case AlbumType.video:
        type = RequestType.video;
        break;
    }
    PhotoManager.getAssetPathList(type: type).then((pathList) {
      setState(() {
        provider.resetPathList(pathList);
      });
    });
  }

  void onPickMax() {
    widget.onSelectedMax?.call();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        AppBarAlbum(
          provider: provider,
          albumDividerColor: widget.albumDividerColor,
          albumBackGroundColor: widget.albumBackGroundColor,
          appBarColor: widget.appBarColor,
          albumTextStyle: widget.albumTextStyle,
          albumHeaderTextStyle: widget.albumHeaderTextStyle,
          albumSubTextStyle: widget.albumSubTextStyle,
          height: widget.appBarHeight,
          appBarLeadingWidget: widget.closeWidget ?? _defaultCloseWidget(),
          appBarActionWidgets: widget.appBarActionWidgets,
        ),
        Expanded(
          child: ValueListenableBuilder<AssetPathEntity?>(
            valueListenable: provider.currentPathNotifier,
            builder: (context, currentPath, child) {
              var current = "";
              return currentPath != null
                  ? GalleryGridView(
                      path: currentPath,
                      thumbnailQuality: widget.thumbnailQuality,
                      provider: provider,
                      padding: widget.gridPadding,
                      childAspectRatio: widget.childAspectRatio,
                      crossAxisCount: widget.crossAxisCount,
                      gridViewBackgroundColor: widget.listBackgroundColor,
                      gridViewController: widget.scrollController,
                      gridViewPhysics: widget.scrollPhysics,
                      imageBackgroundColor: widget.itemBackgroundColor,
                      selectedBackgroundColor:
                          widget.selectedItemBackgroundColor,
                      iconSelectionBuilder: widget.iconSelectionBuilder,
                      thumbnailBoxFix: widget.thumbnailBoxFix,
                      selectedCheckBackgroundColor:
                          widget.selectedItemBackgroundColor,
                      onAssetItemClick: (ctx, asset, index) async {
                        provider.pickEntity(asset);
                        widget.onSelected(provider.picked);
                      },
                    )
                  : Container();
            },
          ),
        )
      ],
    );
  }

  Widget _defaultCloseWidget() {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Text('Cancel'));
  }

  @override
  bool get wantKeepAlive => true;
}
