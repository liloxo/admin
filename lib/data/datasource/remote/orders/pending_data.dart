import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.view,{});
    return response?.fold((l) => l, (r) => r);
  }
  approveOrder(String userid,String ordersid) async {
    var response = await crud.postData(AppLink.approveorder,{'usersid':userid,'ordersid':ordersid});
    return response?.fold((l) => l, (r) => r);
  }
}