class OfferListModel {
  OfferListModel({
    required this.responseTime,
    required this.data,
  });
  late final double responseTime;
  late final Data data;

  OfferListModel.fromJson(Map<String, dynamic> json){
    responseTime = json['response_time'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['response_time'] = responseTime;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.status,
    required this.message,
    required this.offers,
  });
  late final int status;
  late final String message;
  late final Offers offers;

  Data.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    offers = Offers.fromJson(json['offers']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['offers'] = offers.toJson();
    return _data;
  }
}

class Offers {
  Offers({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final List<Data> data;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;
  late final Null nextPageUrl;
  late final String path;
  late final int perPage;
  late final Null prevPageUrl;
  late final int to;
  late final int total;

  Offers.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = null;
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}