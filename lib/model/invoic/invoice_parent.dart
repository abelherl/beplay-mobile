

class Invoice_parents{
  bool success;
  String message;
  List<Data_Invoice> dataInvoice;
  Invoice_parents.fromJsonMap(Map<String,dynamic> map):
      success=map["success"],
      message=map["message"],
      dataInvoice=List<Data_Invoice>.from(map["data"].map((it)=>Data_Invoice.fromJsonMap(it))).toList();

  Map<String,dynamic> toJsonMap(){
    final Map<String,dynamic> data=new Map<String,dynamic>();
    data['success']=success;
    data['message']=message;
    data['data']=dataInvoice!=null?this.dataInvoice.map((e) => e.toJsonMap()).toList():null;
  }


}
class Data_Invoice{
  int nominal;
  int customer_id;
  int code;
  int status;
  String update_at;
  String created_at;
  int id;
  List<int> classModelId=[];
  Data_Invoice({this.nominal,this.classModelId});
  Data_Invoice.fromJsonMap(Map<String,dynamic>map):
      nominal=map["nominal"],
      customer_id=map["customer_id"],
      code=map["code"],
      status=map["status"],
      update_at=map["update_at"],
      created_at=map["created_at"],
      id=map["id"];

  Map<String,dynamic> toJsonMap(){
    Map<String,dynamic> data=new Map<String,dynamic>();
    data['nominal']=nominal;
    data['customer_id']=customer_id;
    data['code']=code;
    data['status']=status;
    data['update_at']=update_at;
    data['created_at']=created_at;
    data['id']=id;
    return data;
  }
}