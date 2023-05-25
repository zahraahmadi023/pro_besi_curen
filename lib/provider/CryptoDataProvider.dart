// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:pro_besi_curen/Moldes/CryptoModel/AllCryptoModel.dart';
import 'package:pro_besi_curen/network/ApiProvider.dart';
import 'package:pro_besi_curen/network/ResponseModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CryptoDataProvider extends ChangeNotifier{
ApiProvider apiProvider = ApiProvider();

  late AllCryptoModel dataFuture;
  late ResponseModel state;
  var response;

  var defaultChoiceIndex = 0;

  // CryptoDataProvider(){
  //   getTopMarketCapData();
  // }

  getTopMarketCapData() async {

    //defaultChoiceIndex = 0;
    state = ResponseModel.loading("is Loading...");

    try{
      response = await apiProvider.getTopMarketCapData();
      if(response.statusCode == 200){
        dataFuture = AllCryptoModel.fromJson(response.data);
        state=ResponseModel.complicated(dataFuture);
      }else{
        state = ResponseModel.error("something wrong...");
      }
      notifyListeners();
    }catch(e){
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }
  }