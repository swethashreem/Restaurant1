import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BottomContainer.dart';
import 'Categories.dart';
import 'DetailPage.dart';
import 'MyProvider.dart';
import 'models/CategoriesModel.dart';
import 'models/FoodCategoriesModel.dart';
import 'models/FoodModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1st
  List<CategoriesModle> burgerList = [];

  ///2nd
  List<CategoriesModle> recipeList = [];
  //3rd
  List<CategoriesModle> pizzaList = [];
  //4th
  List<CategoriesModle> drinksList = [];

  List<FoodModle> singleFoodList = [];

  List<FoodCategoriesModle> burgerCategoriesList = [];
  List<FoodCategoriesModle> recipeCategoriesList = [];
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  List<FoodCategoriesModle> drinkCategoriesList = [];

  Widget categoriesContainer(
      {
      required Function onTap,
      required String image,
      required String name}) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget drawerItem({
    required String name, 
    required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  ////1st
  Widget burger() {
    return Row(
      children: burgerList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: burgerCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

////2nd
  Widget recipe() {
    return Row(
      children: recipeList
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: recipeCategoriesList),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  //3rd
  Widget pizza() {
    return Row(
      children: pizzaList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(list: pizzaCategoriesList),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }

  /////4th
  Widget drinks() {
    return Row(
      children: drinksList
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.name,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: drinkCategoriesList),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    // 1st
    provider.getBurgerCategory();
    burgerList = provider.throwBurgerList;
    //2nd
    provider.getRecipeCategory();
    recipeList = provider.throwRecipeList;
    //3rd
    provider.getDrinksCategory();
    drinksList = provider.throwDrinksList;
    // 4th
    provider.getPizzaCategory();
    pizzaList = provider.throwPizzaList;
    //////////////single food list/////////
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;

    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBurgerCategoriesList;

    provider.getrecipeCategoriesList();
    recipeCategoriesList = provider.throwRecipeCategoriesList;

    provider.getPizzaCategoriesList();
    pizzaCategoriesList = provider.throwPizzaCategoriesList;

    provider.getDrinkCategoriesList();
    drinkCategoriesList = provider.throwDrinkCategoriesList;
    
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/bg.jpg'),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/dp.jpg'),
                  ),
                  accountName: Text("Swetha"),
                  accountEmail: Text('swethashreem@gmail.com'),
                ),
                drawerItem(name: "Profile", icon: Icons.person),
                drawerItem(name: "Cart", icon: Icons.add_shopping_cart),
                drawerItem(name: "Order", icon: Icons.shop),
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                ListTile(
                    leading: Text(
                  "Communicate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
                drawerItem(name: "Cart", icon: Icons.lock),
                drawerItem(name: "Log Out", icon: Icons.exit_to_app),
              ],
            )),
          ),
        ),
        appBar: AppBar(
          elevation: 0.0,
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage('images/instagram.png'),
            )
          ],
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Food",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Color(0xff3a3e3e),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                burger(), 
                recipe(), 
                drinks(), 
                pizza()
                
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 510,
            child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: singleFoodList.map(
                          (e) => BottomContainer(
                            onTap: () {
                              print('clicked');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                               
                                      image: e.image,
                                      name: e.name,
                                      price: e.price,
                                    ),
                                
                                    

                                  ));
                            },
                            image: e.image,
                            price: e.price,
                            name: e.name, 
                          ),
                        )
                        .toList()

                ),
          )
        ],
      ),
    );
  }
}
