import 'package:flutter/material.dart';
import 'package:lab_android/json_list/json_data.dart';
class PageListPhoto extends StatelessWidget {
  const PageListPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json List Photo"),
      ),
      body: FutureBuilder<List<Photo>?>(
        future: getHTTPContent(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return const Center(
              child: Text("Loi khong tai duoc Album"),
            );
          }
          else{
            if(snapshot.hasData == false){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              List<Photo> list = snapshot.data!;
              return GridView.extent(
                maxCrossAxisExtent: 300,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                // childAspectRatio: 0.8, //lam phia duoi hinh co 1 hinh vi du nhu gia, mo ta mat hang
                children: List.generate(
                    list.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                      ),
                      child: Column(
                        children: [
                          Image.network(list[index].thumbnailUrl!, fit: BoxFit.cover),
                          SizedBox(height: 20,),
                          Text("San pham ${index + 1}"),
                        ],
                      ),
                    )
                ),
              );
            }
          }
        },
      ),
    );
  }
}
