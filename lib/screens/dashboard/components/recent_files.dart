import 'package:admin/models/RecentFile.dart';
import 'package:admin/screens/dashboard/components/Controllers.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

import '../../../constants.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentFiles> createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
   NotesController notesController = NotesController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: FutureBuilder<List>(
        future: notesController.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map data = snapshot.data![index];
                DateTime date = DateTime.parse(data['date']);
                return Card(
                  margin: EdgeInsets.all(
                    8.0,
                  ),
                  elevation: 5.0,
                  shadowColor: Colors.grey,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          scrollable: true,
                          content: Text(
                            data['name'],
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      );
                    },

                    onLongPress: () {
                      // update
                      // Navigator.of(context)
                      //     .push(
                      //   MaterialPageRoute(
                      //     builder: (context) => NoteEditor(
                      //       edit: true,
                      //       id: data['id'],
                      //       note: data['note'],
                      //     ),
                      //   ),
                      // )
                      //     .whenComplete(() {
                      //   setState(() {});
                      // });
                    },

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    title: Text(
                      "${data['name']}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //
                    subtitle: Text(
                      
                      
                      DateFormat("\nyyyy-MM-dd kk:mm a",)
                          .format(date)
                          .toString(),
                      style: TextStyle(
                        color: Colors.white ,
                        fontSize: 16.0,
                      ),
                    ),
                    //
                    // trailing: IconButton(
                    //   onPressed: () async {
                    //     await notesController.deleteNote(data['donation_id']);
                    //     setState(() {});
                    //   },
                    //   icon: Icon(
                    //     LineIcons.trash,
                    //     color: Colors.red,
                    //   ),
                    // ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                "Fetching your notes..",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

// DataRow recentFileDataRow(RecentFile fileInfo) {
//   return DataRow(
//     cells: [
//       DataCell(
//         Row(
//           children: [
//             SvgPicture.asset(
//               fileInfo.icon!,
//               height: 30,
//               width: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Text(fileInfo.title!),
//             ),
//           ],
//         ),
//       ),
//       DataCell(Text(fileInfo.date!)),
//       DataCell(Text(fileInfo.size!)),
//     ],
//   );
// }
