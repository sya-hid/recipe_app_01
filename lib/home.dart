import 'package:flutter/material.dart';
import 'package:recipe_app/constant.dart';
import 'package:recipe_app/detail.dart';
import 'package:recipe_app/models/categories.dart';
import 'package:recipe_app/models/product.dart';
import 'package:recipe_app/models/users.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menus = ['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Cheat Menu'];
  String selectedMenu = 'Breakfast';
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_rounded,
    Icons.bar_chart_rounded,
    Icons.favorite_outline_rounded,
    Icons.person_outline_rounded,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      users[1].name,
                      style: roboto.copyWith(
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      'What do you wan to eat today ?',
                      style: roboto.copyWith(
                          fontSize: 12, color: black.withOpacity(0.5)),
                    ),
                  ],
                ),
                const Spacer(),
                Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(users[1].image),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: green),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: grey.shade200),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: roboto),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Popular Menu',
                  style: roboto.copyWith(
                      color: black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'See all',
                  style: roboto.copyWith(
                      color: green,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  menus.length,
                  (index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(left: 20, right: 10)
                            : index == menus.length - 1
                                ? const EdgeInsets.only(right: 20)
                                : const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMenu = menus[index];
                            });
                          },
                          child: MenuItem(
                            selectedMenu: selectedMenu,
                            menu: menus[index],
                          ),
                        ),
                      )),
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  products.length,
                  (index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(left: 20, right: 10)
                            : index == products.length - 1
                                ? const EdgeInsets.only(right: 20)
                                : const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(product: products[index])));
                          },
                          child: ProductItem(
                            product: products[index],
                          ),
                        ),
                      )),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Categories',
                  style: roboto.copyWith(
                      color: black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'See all',
                  style: roboto.copyWith(
                      color: green,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  categories.length,
                  (index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(left: 20, right: 20)
                            : const EdgeInsets.only(right: 20),
                        child: CategoryItem(
                          category: categories[index],
                        ),
                      )),
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                users.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: UserItem(
                    user: users[index],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                icons.length,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPage = index;
                        });
                      },
                      child: SizedBox(
                        height: 40,
                        width: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              icons[index],
                              color: index == selectedPage ? green : grey,
                              size: 28,
                            ),
                            index == selectedPage
                                ? Container(
                                    height: 3,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: green),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ))),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final User user;
  const UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 40,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: white),
      child: Row(
        children: [
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(user.image), fit: BoxFit.cover))),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: roboto.copyWith(
                    fontWeight: FontWeight.bold, color: black, fontSize: 14),
              ),
              Text(
                '12 Recipes Shared',
                style: roboto.copyWith(
                    color: black.withOpacity(0.5), fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: category.color,
          ),
          child: Image.asset(category.image),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(category.name,
            style: roboto.copyWith(
                color: black, fontSize: 12, fontWeight: FontWeight.bold))
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String menu, selectedMenu;

  const MenuItem({
    Key? key,
    required this.menu,
    required this.selectedMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: menu == selectedMenu ? green : white),
        child: Text(
          menu,
          style: roboto.copyWith(color: menu == selectedMenu ? white : black),
        ));
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width / 2 - 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(product.image), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: product.fav ? red : black.withOpacity(0.6)),
            child: const Icon(
              Icons.favorite_border_rounded,
              color: white,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: black.withOpacity(0.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 1,
                        style: roboto.copyWith(
                            fontWeight: FontWeight.bold, color: white),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: orange,
                          size: 18,
                        ),
                        Text(
                          '${product.rate}',
                          style: roboto.copyWith(color: white),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  '1 Bowl (${product.weight}) g',
                  style: roboto.copyWith(color: white),
                ),
                const SizedBox(height: 3),
                Text(
                  '${product.calorie} Kkal | 25% AKG',
                  style: roboto.copyWith(color: white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
