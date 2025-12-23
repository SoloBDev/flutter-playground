class CategoryModel {
  final String name;
  final String iconPath;
  final String boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });


  static List<CategoryModel> getCategories() {

    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/plate.svg',
        boxColor: '0xFF92A3FD',
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: '0xFFC58BF2',
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: '0xFF92A3FD',
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Smoothie',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: '0xFFC58BF2',
      ),
    );

    return categories;
  }
}