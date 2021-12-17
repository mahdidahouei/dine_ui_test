import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DineSelectionButtons<T extends Object> extends StatefulWidget {
  static const height = 30.0;

  final List<DineSelectionButtonData<T>> items;
  final void Function(List<T> selectedItems)? onSelectionsChanged;

  const DineSelectionButtons({
    Key? key,
    required this.items,
    this.onSelectionsChanged,
  }) : super(key: key);

  @override
  DineSelectionButtonsState<T> createState() => DineSelectionButtonsState<T>();
}

class DineSelectionButtonsState<T extends Object>
    extends State<DineSelectionButtons<T>> {
  static const duration = Duration(milliseconds: 250);
  static const curve = Curves.easeOut;

  List<T> selectedValues = [];
  final _selectedIndexes = <int>[];
  late List<GlobalKey<_DineSelectionButtonState>> _toggleButtonsKeys;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _toggleButtonsKeys = List.generate(
      widget.items.length,
      (index) => GlobalKey<_DineSelectionButtonState>(),
    );
    _scrollController = ScrollController();
  }

  void clear({
    bool triggerOnChanged = true,
    bool animateToStart = true,
  }) {
    if (_selectedIndexes.isNotEmpty) {
      for (var indexOfSelectedItem in _selectedIndexes) {
        _toggleButtonsKeys[indexOfSelectedItem].currentState?.unselect();
      }
      _selectedIndexes.clear();
      selectedValues.clear();
      if (triggerOnChanged && widget.onSelectionsChanged != null) {
        widget.onSelectionsChanged?.call([]);
      }
      if (animateToStart) this.animateToStart();
    }
  }

  void animateToStart() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: duration,
      curve: curve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 10.0,
          ),
          for (var i = 0; i < widget.items.length; i++)
            _DineToggleButton(
              key: _toggleButtonsKeys[i],
              text: widget.items[i].title,
              onChanged: (isSelected) {
                clear(
                  triggerOnChanged: false,
                  animateToStart: false,
                );
                _toggleButtonsKeys[i].currentState?.select();
                selectedValues.add(widget.items[i].value);
                _selectedIndexes.add(i);
                widget.onSelectionsChanged?.call(selectedValues);
                setState(() {});
              },
              onLongPress: (isSelected) {
                if (isSelected) {
                  selectedValues.add(widget.items[i].value);
                  _selectedIndexes.add(i);
                } else {
                  selectedValues.remove(widget.items[i].value);
                  _selectedIndexes.remove(i);
                }
                widget.onSelectionsChanged?.call(selectedValues);
                setState(() {});
              },
            ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _DineToggleButton extends StatefulWidget {
  final void Function(bool isSelected) onChanged;
  final String text;
  final void Function(bool isSelected) onLongPress;

  const _DineToggleButton({
    Key? key,
    required this.onChanged,
    required this.text,
    required this.onLongPress,
  }) : super(key: key);

  @override
  _DineSelectionButtonState createState() => _DineSelectionButtonState();
}

class _DineSelectionButtonState extends State<_DineToggleButton>
    with AutomaticKeepAliveClientMixin {
  bool isSelected = false;

  void _onTap() {
    setState(() {
      isSelected = !isSelected;
      widget.onChanged(isSelected);
    });
  }

  void _onLongPress() {
    setState(() {
      isSelected = !isSelected;
      widget.onLongPress(isSelected);
    });
  }

  /// This does not trigger onChanged callback
  void unselect() {
    setState(() {
      isSelected = false;
    });
  }

  void select() {
    setState(() {
      isSelected = true;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const borderRadius = BorderRadius.all(Radius.circular(24.0));
    final themeData = Theme.of(context);
    // final selectedColor = themeData.primaryColor;
    // final unselectedColor = Colors.transparent;
    // final color = isSelected ? selectedColor : unselectedColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Material(
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        child: InkWell(
          onTap: _onTap,
          onLongPress: _onLongPress,
          highlightColor: Colors.transparent,
          splashColor:
              (isSelected ? Colors.black : themeData.primaryColor)
                  .withOpacity(0.12),
          child: Ink(
            height: 60.0,
            width: 70.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: isSelected ? themeData.primaryColor : Colors.transparent,
              border: Border.all(
                width: 1.0,
                color: themeData.primaryColor,
              ),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: themeData.textTheme.button!.apply(
                  color: isSelected ? Colors.white : themeData.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DineSelectionButtonData<T extends Object> extends Equatable {
  final String title;
  final T value;

  const DineSelectionButtonData({
    required this.title,
    required this.value,
  });

  @override
  List<Object> get props => [
        title,
        value,
      ];
}
