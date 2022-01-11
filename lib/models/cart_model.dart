import 'package:action_figure_shopping/models/catalog.dart';
import 'dart:convert';

class CartModel{

  static final CartModel _cartModel = CartModel._internal();

  factory CartModel() {
    return _cartModel;
  }

  CartModel._internal() {
    // initialization logic
  }

  late CatalogModel _catalog;

  final List<int> _itemIds= [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items{
    return _itemIds.map((id) => _catalog.getByID(id)).toList();
  }

  num get totalPrice{
    return items.fold(0, (total, current) => total + current.price);
  }


  void add(Item item){
    _itemIds.add(int.parse(item.id));
  }

   void remove(Item item){
    _itemIds.remove(item.id);
  }


}