// import 'package:flutter/animation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:mobileapplication/screens/upcomming_list_view.dart';
// import 'package:provider/provider.dart';

// class TripsScreen extends StatefulWidget {
//   final AnimationController animationController;

//   const TripsScreen({Key? key, required this.animationController})
//       : super(key: key);

//   @override
//   State<TripsScreen> createState() => _TripsScreenState();
// }

// class _TripsScreenState extends State<TripsScreen> {
//   with TickerProviderStateMixin{
//     late AnimationController tabAnimationController;
//     Widget indexView = Container();
//     TopBarType topBarType =  TopBarType.Upcomming ;

//     @override
//    void initState(){
//     tabAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400))
//    indexView =UpcommingListView(animationController: tabAnimationController);
//    tabAnimationController.forward();
//    widget.animationController.forward();
//    super.initState();

//    }
//   }
//    Future <bool> getData() async{
//     await Future.delayed(Duration(milliseconds: 200));
//     return true;
//    }
  
   

//   @override
//   Widget build(BuildContext context) {
//     return BottomTopMoveAnimationView(
//       animationController: widget.animationController,
//       child: Consumer<ThemeProvider>(
//         builder:((context, provider, child) =>Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
//             child: Container(child: _getAppBar())
//           ],
//         ) ) ,
//       )

//     );
//   }
//   _getAppBar(){
//     return Padding(padding: EdgeInsets.only(left: 24, top: 28, right: 24),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(AppLocalizations(context)).of("My_Trips"),
//         style: TextStyle(context).getBoldStyle().copyWith(fontSize:22),
//       ],
//     )
//     ),

//   }
// }


// enum TopBarType {Upcomming , Finished , Favorite}