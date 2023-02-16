import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/CartModel.dart';
import 'models/CategoriesModel.dart';
import 'models/FoodCategoriesModel.dart';
import 'models/FoodModel.dart';


class MyProvider extends ChangeNotifier{
List<CategoriesModle> burgerList=[];
 late CategoriesModle burgerModle;

Future<void> getBurgerCategory() async{

List<CategoriesModle> newBurgerList=[];
QuerySnapshot querySnapshot= await FirebaseFirestore.instance
  .collection('categories')
  .doc('z528sgqoF8z8MQm7xYub')
  .collection('Burger')
  .get();
   querySnapshot.docs.forEach((element) {
        burgerModle= CategoriesModle(
        name:element.get('name'),
        image:element.get('image'),
        );
       print( burgerModle.name);
       newBurgerList.add(burgerModle);
       burgerList = newBurgerList;
  });
 }
 
  get throwBurgerList {
    return burgerList;
  }
  
  // 2nd category
  List<CategoriesModle> recipeList=[];
 late CategoriesModle recipeModle;

Future<void> getRecipeCategory() async{
List<CategoriesModle> newRecipeList=[];
QuerySnapshot querySnapshot= await FirebaseFirestore.instance
  .collection('categories')
  .doc('z528sgqoF8z8MQm7xYub')
  .collection('Recipe')
  .get();
    querySnapshot.docs.forEach((element) {
        recipeModle= CategoriesModle(
        name:element.get('name'),
        image: element.get('image'),
     );
       print( recipeModle.name);
       newRecipeList.add(recipeModle);
       recipeList = newRecipeList;
  });
 }
  get throwRecipeList {
    return recipeList;
  }

 // 3rd category
  List<CategoriesModle> drinksList=[];
 late CategoriesModle drinksModle;

Future<void> getDrinksCategory() async{
List<CategoriesModle> newDrinksList=[];
QuerySnapshot querySnapshot= await FirebaseFirestore.instance
  .collection('categories')
  .doc('z528sgqoF8z8MQm7xYub')
  .collection('Drinks')
  .get();
    querySnapshot.docs.forEach((element) {
        drinksModle= CategoriesModle(
        name:element.get('name'),
        image: element.get('image'),
     );
       print( drinksModle.name);
       newDrinksList.add(drinksModle);
       drinksList = newDrinksList;
  });
 }
  get throwDrinksList {
    return drinksList;
  }

  //4th category
   List<CategoriesModle> pizzaList=[];
 late CategoriesModle pizzaModle;

Future<void> getPizzaCategory() async{
List<CategoriesModle> newPizzaList=[];
QuerySnapshot querySnapshot= await FirebaseFirestore.instance
  .collection('categories')
  .doc('z528sgqoF8z8MQm7xYub')
  .collection('Pizza')
  .get();
    querySnapshot.docs.forEach((element) {
       pizzaModle= CategoriesModle(
        name:element.get('name'),
        image: element.get('image'),
     );
       print( pizzaModle.name);
       newPizzaList.add(pizzaModle);
       pizzaList = newPizzaList;
  });
 }
  get throwPizzaList {
    return pizzaList;
  }
// Single Food Item
List<FoodModle> foodModleList=[];
 late FoodModle foodModle;


Future<void> getFoodList() async{

  List<FoodModle> newSingleFoodList=[];
  QuerySnapshot querySnapshot=
   await FirebaseFirestore.instance
  .collection('Foods')
  .get();
   querySnapshot.docs.forEach((element) {
       foodModle= FoodModle(
        image:element.get('image'),
       name:element.get('name'),
       price: element.get('price'),
       );
  
   newSingleFoodList.add(foodModle);
   }); 

   foodModleList=newSingleFoodList;
   notifyListeners();
}
get throwFoodModleList{
  return foodModleList;
}

 List<FoodCategoriesModle> burgerCategoriesList=[];
 late FoodCategoriesModle burgerCategoriesModle;
 Future<void> getBurgerCategoriesList()async{
  List<FoodCategoriesModle> newBurgerCategoriesList=[];
  QuerySnapshot querySnapshot=await FirebaseFirestore.instance
  .collection('foodcategories')
  .doc('ih1iqD1hXVq2qUln6MpN')
  .collection('burger')
  .get();
  querySnapshot.docs.forEach((element) {
    burgerCategoriesModle=FoodCategoriesModle(
      image: element.get('image'), 
      name: element.get('name'), 
      price: element.get('price'),
      );
     newBurgerCategoriesList.add(burgerCategoriesModle);
     burgerCategoriesList=newBurgerCategoriesList;
  });
 }
  
  get throwBurgerCategoriesList{
    return burgerCategoriesList;
  }
  
  ///////////////Recipe categories list//////////
  List<FoodCategoriesModle> recipeCategoriesList = [];
  late FoodCategoriesModle recipeCategoriesModle;
  Future<void> getrecipeCategoriesList() async {
    List<FoodCategoriesModle> newrecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeCategoriesModle = FoodCategoriesModle(
        image: element.get('image'),
        name: element.get('name'),
        price: element.get('price'),
      );
      newrecipeCategoriesList.add(recipeCategoriesModle);
      recipeCategoriesList = newrecipeCategoriesList;
    });
  }

  get throwRecipeCategoriesList {
    return recipeCategoriesList;
  }

  ///////////////Pizza categories list//////////
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  late FoodCategoriesModle pizzaCategoriesModle;
  Future<void> getPizzaCategoriesList() async {
    List<FoodCategoriesModle> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModle = FoodCategoriesModle(
        image: element.get('image'),
        name: element.get('name'),
        price: element.get('price'),
      );
      newPizzaCategoriesList.add(pizzaCategoriesModle);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }

  ///////////////Drink categories list//////////
  List<FoodCategoriesModle> drinkCategoriesList = [];
  late FoodCategoriesModle drinkCategoriesModle;
  Future<void> getDrinkCategoriesList() async {
        List<FoodCategoriesModle> newDrinkCategoriesList = [];
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('drink')
        .get();
        querySnapshot.docs.forEach((element) {
        drinkCategoriesModle = FoodCategoriesModle(
        image: element.get('image'),
        name: element.get('name'),
        price: element.get('price'),
      );
      newDrinkCategoriesList.add(drinkCategoriesModle);
      drinkCategoriesList = newDrinkCategoriesList;
    });
  }
  get throwDrinkCategoriesList {
    return drinkCategoriesList;
  }

 /////////////add to cart ////////////
  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];
  late CartModle cartModle;
  void addToCart({
    required String image,
    required String name,
    required int price,
    required int quantity,
  }) {
    cartModle = CartModle(
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    newCartList.add(cartModle);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalprice() {
    int total = 0;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }
 late int deleteIndex;
 void getDeleteIndex(int index){
     deleteIndex=index;
 }

 void delete(){
   cartList.removeAt(deleteIndex);
  //  notifyListeners();
 }
 
}
