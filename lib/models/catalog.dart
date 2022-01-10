class Item{

  final String id;
  final String name;
  final String desc;
  final num price;
  final String imageUrl;


  Item({required this.id,required this.name, required this.desc, required this.price, required this.imageUrl});

  factory Item.fromMap(Map<dynamic,dynamic> map){
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        imageUrl: map['imageUrl'],

    );
  }

  toMap() => {
    "id":id,
    "name":name,
    "desc":desc,
    "price": price,
    "imageUrl": imageUrl,

  };

}


class CatalogModel{




   static List<Item> items = [];


  Item getByID(int id) => items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}
