// part of 'spinner_filter.dart';

// class TimePickerBtn extends StatefulWidget {
//   const TimePickerBtn({
//     super.key,
//     this.minHolder = '开始时间',
//     this.maxHolder = '结束时间',
//     required this.onChanged,
//     required this.data,
//   });

//   final String minHolder;
//   final String maxHolder;
//   final Map data;
//   final Function(String min, String max) onChanged;

//   @override
//   State<TimePickerBtn> createState() => _TimePickerBtnState();
// }

// class _TimePickerBtnState extends State<TimePickerBtn> {
//   late String _min;
//   late String _max;

//   @override
//   void initState() {
//     _min = widget.data['start'] ?? '';
//     _max = widget.data['end'] ?? '';
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }

//   @override
//   void didUpdateWidget(covariant TimePickerBtn oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     if (oldWidget.data != widget.data) {
//       setState(() {
//         _min = widget.data['start'] ?? '';
//         _max = widget.data['end'] ?? '';
//       });
//     }
//   } 

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       width: 220,
//       height: 30,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         color: const Color(0xfff7f7f7),
//       ),
//       child: Row(
//         children: [
//           _btn(
//             context,
//             _min.isEmpty ? widget.minHolder : _min,
//             _min.isNotEmpty,
//             onPressed: (time) {
//               setState(() {
//                 _min = time;
//               });
//               widget.onChanged(_min, _max);
//             },
//           ),
//           Container(
//             width: 12,
//             height: 1,
//             color: const Color(0xffdedede),
//           ),
//           _btn(
//             context,

//             _max.isEmpty ? widget.maxHolder : _max,
//             _max.isNotEmpty,
//             onPressed: (time) {
//               setState(() {
//                 _max = time;
//               });
//               widget.onChanged(_min, _max);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _btn(
//     BuildContext context,
//     String name,
//     bool isChanged, {
//     required ValueChanged<String> onPressed,
//   }) {
//     return Expanded(
//       child: GestureDetector(
//           onTap: () {
//             CommonWidget.datePicker(
//               context: context,
//               onConfirm: (dateTime) {
//                 onPressed(
//                   DateUtil.formatDate(dateTime, format: DateFormats.y_mo_d),
//                 );
//               },
//             );
//           },
//           child: Text(
//             name,
//             style: isChanged ? style20263A_13 : style9B9EAC_13,
//             textAlign: TextAlign.center,
//           )),
//     );
//   }
// }
