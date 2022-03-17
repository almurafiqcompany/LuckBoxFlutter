

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backGro = const Color(0xFFB71C1C) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGro,
        title:  const Center(
          child: Text('LuckBox' ,  style: TextStyle(
            color: Colors.white,
            fontSize: 29,
          ),),
        ),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 1,
        itemCount: 10,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(top: 4 ) ,
           child: Card(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
             elevation: 5.0,
             child: Container(
               height: 50,
              // padding: const EdgeInsets.all(4),
               margin: const EdgeInsets.all(4),
               child: Row(
                 children: [
                   Container(
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       image: const DecorationImage(
                         image: NetworkImage(  'https://media.istockphoto.com/photos/businesswoman-using-computer-in-dark-office-picture-id557608443?k=6&m=557608443&s=612x612&w=0&h=fWWESl6nk7T6ufo4sRjRBSeSiaiVYAzVrY-CLlfMptM=' ,
                         ),
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                   const SizedBox(width: 8),
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: const [
                           Text(
                             'Product One',
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontStyle: FontStyle.italic),
                             maxLines: 1,
                             overflow: TextOverflow.ellipsis,
                           ),
                           /*
                          Expanded(
                            child: Text(
                              'hello '
                                  .toString()
                                  .toString()
                                  ,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),

                           */
                           /*
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                " Welcome",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              const Text(
                                "25",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: const [
                                  Text(
                                    " go",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  )
                                ],
                              )
                            ],
                          )

                           */
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
          );
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
      ),
    );
  }
}
