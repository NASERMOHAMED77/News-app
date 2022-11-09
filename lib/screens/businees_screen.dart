import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newsapp/services/article-model.dart';
import 'package:newsapp/services/get_api.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  late Future<List<Article>> article;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    article = Api().getdata('business');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: article,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: 20,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                            height: 120,
                            width: 180,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'images/x.png',
                              image: snapshot.data![index].image == null
                                  ? 'https://upload.wikimedia.org/wikipedia/en/0/04/ZamalekSC.png'
                                  : snapshot.data![index].image.toString(),
                              fit: BoxFit.fill,
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  snapshot.data![index].title.toString(),
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                Text(
                                  snapshot.data![index].description.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 11),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
                ;
              }),
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: .5,
                    color: Colors.black,
                    width: double.infinity,
                  ),
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        },
      ),
    );
  }
}
