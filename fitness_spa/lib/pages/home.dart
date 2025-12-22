import 'package:fitness_spa/models/category_model.dart';
import 'package:fitness_spa/models/diet_model.dart';
import 'package:fitness_spa/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];
  

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getPopularDiets() {
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }



  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return  Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _searchField(),
          SizedBox(height: 40,),
          _categoriesSection(),
          SizedBox(height: 40,),
          _dietsSection(),
          SizedBox(height: 40,),
          _popularDietsSection(),
        ]
      )
    );
  }


// Formatting helper methods below

  Column _popularDietsSection() {
    return Column(
          crossAxisAlignment: .start,
          children: [
            //Popular section
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Popular',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            SizedBox(height: 15,),
            ListView.separated(
              itemCount: popularDiets.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 25,),
              padding: EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: popularDiets[index].boxIsSelected ? Colors.grey.withOpacity(0.3) : Colors.grey.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 0.0,
                      )
                    ],
                    
                  ),
                  
                  child: Row(
                    mainAxisAlignment: .spaceBetween,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SvgPicture.asset(
                          popularDiets[index].iconPath,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            popularDiets[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                            style: TextStyle(
                              color: Color(0xFF786f72),
                              fontSize: 13,
                            )
                          )
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                            ),
                            borderRadius: .circular(50)
                            ),
                            //? transform the to flip the icon
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Transform.rotate(
                                angle: 3.14,
                                child: SvgPicture.asset(
                                  'assets/icons/Arrow - Left 2.svg',
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            
                        ),
                      ),
                        
                    ],
                  )
                );
              },

            ),

            SizedBox(height: 40,)
          ],
        );
  }

  Column _dietsSection() {
    return Column(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Recommedations\nfor Diet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: .bold,
                )
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: diets.length,
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                padding: EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: Color(int.parse(categories[index].boxColor)).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          diets[index].iconPath,
                        ),
                        Column(
                          children: [
                            Text(
                              diets[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            
                            Text(
                              '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                              style: TextStyle(
                                color: Color(0xFF786f72),
                                fontSize: 13,
                              )
                            ),
                          ],
                        ),

                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected ? Color(0xFF9DcEFF) : Colors.transparent,
                                diets[index].viewIsSelected ? Color(0xFF92A3FD) : Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: diets[index].viewIsSelected ? Colors.white : Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )
                            ),
                          ),
                        )

                      ],
                    ),
              
                  );
                }
              ),
            ),
          
          ],
          
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: .start,
          children: [
            // Categories Sectionr
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: .bold,
                )
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 120,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(int.parse(categories[index].boxColor)).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset('${categories[index].iconPath}'),
                          )
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFF1d1417).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,

              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search Pancakes',
              hintStyle: TextStyle(
                color: Color(0xFFDDDADA),
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              border: OutlineInputBorder(
                borderRadius: .circular(15),
                borderSide: .none,
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: .end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
        );
  }
}


AppBar appBar() {
        return AppBar(
        title: Text(
          'Breakfast',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {

          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFF7F8F8),
              borderRadius:  BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/Arrow - Left 2.svg',
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {

            },
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFF7F8F8),
                borderRadius:  BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
              ),
            ),
          ),
        ],
      );
}