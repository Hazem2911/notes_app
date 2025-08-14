import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: CircleAvatar(radius: 32, backgroundColor: color),
          ),
        )
        : Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(radius: 32, backgroundColor: color),
        );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xffffcd7a),
    Color(0xffe7e896),
    Color(0xff76d6ee),
    Color(0xffd49eda),
    Color(0xffffcd7a),
    Color(0xffe7e896),
    Color(0xffba1200),
    Color(0xff031927),
    Color(0xff9dd1f1),
    Color(0xff508aa8),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            currentIndex = index;

            BlocProvider.of<AddNoteCubit>(context).color = colors[index];

            setState(() {});
          },
          child: ColorItem(
            isActive: currentIndex == index,
            color: colors[index],
          ),
        );
      },
    );
  }
}
