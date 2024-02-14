import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.accepted, {});
    return response?.fold((l) => l, (r) => r);
  }

  donePrepare(String ordersid,String userid,String ordertype) async {
    var response = await crud.postData(AppLink.prepare, {"ordersid": ordersid,'usersid':userid,'ordertype':ordertype});
    return response?.fold((l) => l, (r) => r);
  }
}