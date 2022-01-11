import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siddhi_infotech/Home%20Page/get_offerlis_tapi.dart';

import '../constants.dart';
import 'offer_list_model.dart';

class HomePageScreen extends StatefulWidget {
  final String token;
  final String uname;
  const HomePageScreen({Key? key, required this.token,required this.uname}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0.0,

        leading: const Center(),
        backgroundColor: kPrimary,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 17),),
            Text(widget.uname,style: const TextStyle(color: Colors.white,fontSize: 20),),
          ],
        ),

      ),
      
      
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          height: size.height,
          width: size.width,

          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(32)),
          ),

          child: Column(
            children: [
              buildSearchANDHeader(),
              Expanded(
                child: FutureBuilder<OfferListModel>(
                  future: GetOfferListAPI.getPage(token: widget.token),
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child:SizedBox(
                              height: 400,
                              child: Center(child: CircularProgressIndicator(),))
                      );
                    }
                    if(snapshot.hasData){
                      OfferListModel? data = snapshot.data;
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                          itemBuilder: (context,index){
                        return buildOfferCards(data!.data.message);
                      });
                    }else{
                      OfferListModel? data = snapshot.data;
                      return ListView.builder(
                          itemBuilder: (context,index){
                            return buildOfferCards("Unlimited");
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  buildOfferCards(data){
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: 200,
            width: size.width * 0.86,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0x0ff458e8).withOpacity(0.0),
            ),
          child: Stack(
            children: [
            Stack(
              children: [
                Container(
                height: 155,
                width: size.width * 0.9,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: const DecorationImage(
                    image: AssetImage("assets/landing image.png")
                  ),
                  color: const Color(0xFFEAE8E8).withOpacity(0.95),
                ),),
                Positioned(
                    top: 5,right: 5,
                    child:Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Colors.black26,
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: Center(child: Text(data,style: const TextStyle(color: Colors.white),)),
                      ),
                    )
                ),

                Positioned(
                  top: 5,left: 5,
                  child: ClipOval(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(65),

                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/landing image.png",height: 15,width: 15,)
                        )),
                  ),
                ),
              ],
            ),
              Positioned(
                bottom: 5,left: 5,
                child:buildShowOfferDetails(),
              ),


            ],
          ),
        ),
      ),
    );
  }
  buildShowOfferDetails(){
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        buildClipOvel(),
        Card(
          child: Container(
              height: 60,
              width: size.width * 0.6,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [

                    const Text(
                      "Pizza Club",
                      maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: true,
                      style: TextStyle(fontSize: 17,color: Colors.black),),

                    Row(
                      children: const [
                        Icon(Icons.local_offer_outlined,color: kPrimary,size: 20,),
                        Text(
                          "12% discount test unlimited",
                          maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: true,
                          style: TextStyle(fontSize: 15,color: kPrimary),),
                      ],
                    ),
                  ],
                ),
              )),
        ),

      ],
    );

  }

  buildClipOvel(){
    return ClipOval(

      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(65),
              border: Border.all(color:kPrimary,width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/landing image.png",height: 40,width: 40,)
          )),
    );
  }

  buildSearchANDHeader(){
    final size = MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: size.width * 0.98,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 40,
                width: size.width * 0.78,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xFFEAE8E8).withOpacity(0.95),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10,),
                      const Icon(Icons.search,color: Colors.grey,size: 28,),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: size.width * 0.55,
                        child: const Text(
                          "Search",
                          maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: true,
                          style: TextStyle(fontSize: 15,color: Colors.grey),),
                      ),

                      SizedBox(width: 25,height: 25,
                          child: Image.asset("assets/filter.png",color: kPrimary,)),
                    ],
                  ),
                )),
            Container(
                height: 40,width: 40,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xFFEAE8E8).withOpacity(0.95),
                ),
                child: const Icon(Icons.map_outlined,color: kPrimary,))
          ],
        ),
      ),
    );
  }
}
