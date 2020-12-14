import 'package:fewaclothing/widgets/newarrival_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class NewArrivalPage extends StatefulWidget {
  @override
  _NewArrivalPageState createState() => _NewArrivalPageState();
}

class _NewArrivalPageState extends State<NewArrivalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.pink),
          title: Text(
            'Fewa Clothing',
            style: GoogleFonts.greatVibes(
              textStyle: TextStyle(color: Colors.pink, fontSize: 35,fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, 'cart');
                  }),
            )
          ],
        ),
        body: StaggeredGridView.countBuilder(
          shrinkWrap: true,
            itemCount: 10,
            crossAxisCount: 4,
            itemBuilder: (context, index) => NewArrivalWidget(),
            staggeredTileBuilder: (index) => StaggeredTile.fit(2)));
  }
}
