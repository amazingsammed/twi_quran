// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter/material.dart';
//
// class Testing extends StatefulWidget {
//   const Testing({super.key});
//
//   @override
//   State<Testing> createState() => _TestingState();
// }
//
// class _TestingState extends State<Testing> {
//   int topIndex = 0;
//   List<NavigationPaneItem> items = [
//     PaneItem(
//       icon: const Icon(FluentIcons.home),
//       title: const Text('Home'),
//       body: Container(),
//     ),
//     PaneItemSeparator(),
//     PaneItem(
//       icon: const Icon(FluentIcons.issue_tracking),
//       title: const Text('Track orders'),
//       infoBadge: const InfoBadge(source: Text('8')),
//       body: const _NavigationBodyItem(
//         header: 'Badging',
//         content: Text(
//           'Badging is a non-intrusive and intuitive way to display '
//           'notifications or bring focus to an area within an app - '
//           'whether that be for notifications, indicating new content, '
//           'or showing an alert. An InfoBadge is a small piece of UI '
//           'that can be added into an app and customized to display a '
//           'number, icon, or a simple dot.',
//         ),
//       ),
//     ),
//     PaneItem(
//       icon: const Icon(FluentIcons.disable_updates),
//       title: const Text('Disabled Item'),
//       body: const _NavigationBodyItem(),
//       enabled: false,
//     ),
//     PaneItemExpander(
//       icon: const Icon(FluentIcons.account_management),
//       title: const Text('Account'),
//       body: const _NavigationBodyItem(
//         header: 'PaneItemExpander',
//         content: Text(
//           'Some apps may have a more complex hierarchical structure '
//           'that requires more than just a flat list of navigation '
//           'items. You may want to use top-level navigation items to '
//           'display categories of pages, with children items displaying '
//           'specific pages. It is also useful if you have hub-style '
//           'pages that only link to other pages. For these kinds of '
//           'cases, you should create a hierarchical NavigationView.',
//         ),
//       ),
//       items: [
//         PaneItemHeader(header: const Text('Apps')),
//         PaneItem(
//           icon: const Icon(FluentIcons.mail),
//           title: const Text('Mail'),
//           body: const _NavigationBodyItem(),
//         ),
//         PaneItem(
//           icon: const Icon(FluentIcons.calendar),
//           title: const Text('Calendar'),
//           body: const _NavigationBodyItem(),
//         ),
//       ],
//     ),
//     PaneItemWidgetAdapter(
//       child: Builder(builder: (context) {
//         // Build the widget depending on the current display mode.
//         //
//         // This already returns the resolved auto display mode.
//         if (NavigationView.of(context).displayMode == PaneDisplayMode.compact) {
//           return const FlutterLogo();
//         }
//         return ConstrainedBox(
//           // Constraints are required for top display mode, otherwise the Row will
//           // expand to the available space.
//           constraints: const BoxConstraints(maxWidth: 200.0),
//           child: const Row(children: [
//             FlutterLogo(),
//             SizedBox(width: 6.0),
//             Text('This is a custom widget'),
//           ]),
//         );
//       }),
//     ),
//   ];
//
//   PaneDisplayMode displayMode = PaneDisplayMode.compact;
//
//   @override
//   Widget build(BuildContext context) {
//     return FluentApp(
//         home: NavigationView(
//       appBar: const NavigationAppBar(
//         title: Text('NavigationView'),
//       ),
//       pane: NavigationPane(
//         selected: 0,
//         onItemPressed: (index) {
//           if (index == topIndex) {
//             if (displayMode == PaneDisplayMode.open) {
//               setState(() => this.displayMode = PaneDisplayMode.compact);
//             } else if (displayMode == PaneDisplayMode.compact) {
//               setState(() => this.displayMode = PaneDisplayMode.open);
//             }
//           }
//         },
//         onChanged: (index) => setState(() => topIndex = index),
//         items: items,
//         footerItems: [
//           PaneItem(
//             icon: const Icon(FluentIcons.settings),
//             title: const Text('Settings'),
//             body: const _NavigationBodyItem(header: '',),
//           ),
//           PaneItemAction(
//             icon: const Icon(FluentIcons.add),
//             title: const Text('Add New Item'),
//             onTap: () {
//               // Your Logic to Add New `NavigationPaneItem`
//               items.add(
//                 PaneItem(
//                   icon: const Icon(FluentIcons.new_folder),
//                   title: const Text('New Item'),
//                   body: const Center(
//                     child: Text(
//                       'This is a newly added Item',
//                     ),
//                   ),
//                 ),
//               );
//               setState(() {});
//             },
//           ),
//         ],
//       ),
//     ));
//   }
// }
//
//
//
// class _NavigationBodyItem extends StatelessWidget {
//   final String? header;
//   final Widget? content;
//   const _NavigationBodyItem({super.key, this.header, this.content  });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(),
//     body: Container()
//     );
//   }
// }
