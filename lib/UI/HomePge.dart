// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marquee/marquee.dart';
import 'package:pro_besi_curen/UI/ViewPage_home.dart';
import 'package:pro_besi_curen/UI/ui_helper/theme_swicht.dart';
import 'package:pro_besi_curen/network/ResponseModel.dart';
import 'package:pro_besi_curen/provider/CryptoDataProvider.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Moldes/CryptoModel/CryptoData.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(initialPage: 0);
  var defaultChoiceIndex = 0;

  final List<String> _choiceList = ["topMarketcaps", "topGeiners", "topLosers"];
  // @override
  // void initState() {
  //   super.initState();

  //   final cryptoProvider=Provider.of<CryptoDataProvider>(context,listen: false);
  //   cryptoProvider.getTopMarketCapData();
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var cryptoProvider =
        Provider.of<CryptoDataProvider>(context, listen: false);
    cryptoProvider.getTopMarketCapData();

    var primaryColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          ThemeSwitch(),
        ],
        title: Center(child: Text("Currency App")),
        titleTextStyle: textTheme.titleLarge,
        backgroundColor: primaryColor,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // PageView
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ViewPageHome(controller: _pageViewController),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SmoothPageIndicator(
                            controller: _pageViewController,
                            count: 4,
                            effect: const ExpandingDotsEffect(
                                dotWidth: 10, dotHeight: 10),
                            onDotClicked: (index) =>
                                _pageViewController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                width: double.infinity,
                child: Marquee(
                  text: "this is place for new is application  ",
                  style: textTheme.bodySmall,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: EdgeInsets.all(20),
                        primary: Colors.green[700],
                      ),
                      onPressed: () {},
                      child: Text("buy"),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.all(20),
                          primary: Colors.red[700]),
                      onPressed: () {},
                      child: Text("sell"),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Wrap(
                            spacing: 8,
                            children:
                                List.generate(_choiceList.length, (index) {
                              return ChoiceChip(
                                label: Text(
                                  _choiceList[index],
                                  style: textTheme.titleSmall,
                                ),
                                selected: defaultChoiceIndex == index,
                                selectedColor: Colors.blue,
                                onSelected: (value) {
                                  setState(() {
                                    defaultChoiceIndex =
                                        value ? index : defaultChoiceIndex;
                                  });
                                },
                              );
                            }))
                      ],
                    )
                  ],
                ),
              ),
              //taqirat atelaat  dar ui dashteh bashim
              SizedBox(
                height: 500,
                child: Consumer<CryptoDataProvider>(
                  builder: (context, cryptoDataProvider, child) {
                    switch (cryptoDataProvider.state.status) {
                      case Status.LOADING:
                        return SizedBox(
                          height: 80,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.white,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 8, left: 8, bottom: 8),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 50,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 15,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: SizedBox(
                                        height: 40,
                                        width: 70,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 50,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 15,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      case Status.COMPLETED:
                        List<CryptoData>? model = cryptoDataProvider.dataFuture.data!.cryptoCurrencyList;

                        // print(model![0].symbol);
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              var number = index + 1;
                              var tokenId = model![index];
                              return SizedBox(
                                height: height * 0.075,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(number.toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10),
                                      child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          width: 32,
                                          height: 32,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          imageUrl:
                                              "https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenId.png"),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text(model[index].name!,style: textTheme.bodySmall,),
                                        Text(model[index].symbol!,style: textTheme.labelSmall,)
                                      ],))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container();
                            },
                            itemCount: 10);
                      case Status.ERROR:
                        return Text(cryptoDataProvider.state.message);
                      default:
                        return Container();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
