import 'package:abido/core/utilities/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:abido/core/layout/the_layout.dart';
import 'package:abido/core/shared_components/super_text/super_text.dart';
import 'package:abido/core/theme/colorz.dart';
import 'package:abido/core/theme/fonts.dart';
import 'package:abido/core/utilities/contextual.dart';

class UploadProjectScreen extends StatefulWidget {
  // --------------------------------------------------------------------------
  const UploadProjectScreen({super.key});
  // --------------------
  @override
  State<UploadProjectScreen> createState() => _UploadProjectScreenState();
  // --------------------------------------------------------------------------
}

class _UploadProjectScreenState extends State<UploadProjectScreen> {
  // --------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
  }
  // --------------------
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit && mounted) {
      _isInit = false; // good
      asyncInSync(() async {
        await _loadVideo();
      });
    }
    super.didChangeDependencies();
  }
  // --------------------
  void asyncInSync(Function? asynchronous) {
    if (asynchronous != null) {
      Future<void> _start() async {}

      _start().then((_) async {
        await asynchronous();
      });
    }
  }
  // --------------------
  @override
  void dispose() {
    super.dispose();
  }
  // --------------------------------------------------------------------------

  /// INITIAL LOADING

  // --------------------
  String? _loadingText = 'loading';
  bool _canBuild = false;
  // --------------------
  /// TESTED : WORKS PERFECT
  void setLoadingText(String? text) {
    if (mounted && _loadingText != text) {
      setState(() {
        _loadingText = text;
      });
    }
  }

  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _loadVideo() async {
    blog('_loadVideo(Start)');

    setLoadingText('Reading video info ..');

    if (mounted == true) {
      setState(() {
        /// BUILD
        _loadingText = null;
        _canBuild = true;
      });
    }

    blog('_loadVideo(End)');
  }
  // --------------------------------------------------------------------------

  /// BOTTOM DIALOG

  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> showTheBottomSheet({required List<Widget> tiles}) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (context) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: tiles,
            ),
          ),
        );
      },
    );
  }
  // --------------------------------------------------------------------------
  /// REFERENCE BUTTONS FOR BOTTOM DIALOG
  /*
  /// PICk QUALITY

  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _pickQuality() async {
    await showTheBottomSheet(
      tiles: <Widget>[
        ...List.generate(_videoSources.length, (int index) {
          final VideoSourceModel _source = _videoSources[index];

          return _qualityTile(
            source: _source,
            onTap: () async {
              blog('wiping');

              if (mounted) {
                setState(() {
                  _canBuild = false;
                  _selectedVideoSource = null;
                });
              }

              await Routing.goBack(context: context);

              if (mounted) {
                setState(() {
                  _canBuild = true;
                  _selectedVideoSource = _source;
                });
              }

              await _startPlayer();

              blog('starting');
            },
          );
        }),
      ],
    );
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Widget _qualityTile({
    required void Function() onTap,
    required VideoSourceModel source,
  }) {
    return RadioListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        source.quality,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${source.size.totalMegaBytes.toStringAsFixed(2)} MB',
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      value: source,
      groupValue: _selectedVideoSource,
      onChanged: (value) {
        onTap();
      },
    );
  }
   */
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return TheLayout(
      backgroundColor: Colorz.black255,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --------------------
            if (_canBuild == false)
              SuperText(
                boxWidth: context.screenWidth,
                text: _loadingText,
                textHeight: 30,
                margins: 10,
                font: InfinityFont.regular,
              ),
            // --------------------
            if (_canBuild == true)
              SuperText(
                boxWidth: context.screenWidth,
                text: '<Video Title>',
                textHeight: 30,
                margins: 10,
                font: InfinityFont.regular,
              ),
            // --------------------
          ],
        ),
      ),
    );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
