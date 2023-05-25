import 'package:pro_besi_curen/Moldes/CryptoModel/Status.dart';

class ResponseModel<T>{
  late Status status;///statud __>object
  late T data;
  late String message;
  ResponseModel.loading(this.message):status=Status.LOADING;
  ResponseModel.complicated(this.data):status=Status.COMPLETED;
  ResponseModel.error(this.message):status=Status.ERROR;

}
@override
String toString(){
  return "status : data :message";
}
enum Status{LOADING, COMPLETED,ERROR}
