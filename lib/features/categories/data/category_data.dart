import 'package:jorden_job_task/models/category_model.dart';
import 'package:jorden_job_task/utils/constants/assets_manager.dart';

List<CategoryModel> categoryData = [
  CategoryModel(
    id: '0001',
    title: 'Food',
    iconPath: AppAssets.burgerSvgIcon,
    numberOfMerchants: ['2', '3', '4', '5'],
    subcategories: ['1010', '1011', '1012', '1013'],
    popularityIndicator: true,
  ),
  CategoryModel(
    id: '0002',
    title: 'Toys & Games',
    iconPath: AppAssets.toySvgIcon,
    numberOfMerchants: ['6', '7', '8'],
    subcategories: ['1014', '1015', '1016'],
    popularityIndicator: true,
  ),
  CategoryModel(
    id: '0003',
    title: 'Sports',
    iconPath: AppAssets.sportSvgIcon,
    numberOfMerchants: ['9', '10'],
    subcategories: ['1017', '1018', '1019', '1020', '1021'],
    popularityIndicator: true,
  ),
  CategoryModel(
    id: '0004',
    title: 'Gym',
    iconPath: AppAssets.gymSvgIcon,
    numberOfMerchants: ['11', '12', '13', '14', '15'],
    subcategories: ['1022', '1023'],
    popularityIndicator: false,
  ),
  CategoryModel(
    id: '0005',
    title: 'Electrician',
    iconPath: AppAssets.electronicSvgIcon,
    numberOfMerchants: ['16', '17', '18', '19'],
    subcategories: ['1024', '1025', '1026'],
    popularityIndicator: false,
  ),
  CategoryModel(
    id: '0006',
    title: 'Hotels',
    iconPath: AppAssets.hotalSvgIcon,
    numberOfMerchants: ['20'],
    subcategories: ['1027'],
    popularityIndicator: false,
  ),
  CategoryModel(
    id: '0007',
    title: 'Car Services',
    iconPath: AppAssets.carSvgIcon,
    numberOfMerchants: ['21', '22'],
    subcategories: ['1028', '1029'],
    popularityIndicator: false,
  ),
  CategoryModel(
    id: '0008',
    title: 'Beauty',
    iconPath: AppAssets.beautySvgIcon,
    numberOfMerchants: ['23', '24', '25', '26', '27'],
    subcategories: ['1030', '1031', '1032'],
    popularityIndicator: false,
  ),
  CategoryModel(
    id: '0009',
    title: 'Clothing',
    iconPath: AppAssets.clothingSvgIcon,
    numberOfMerchants: ['28', '29', '30', '31'],
    subcategories: ['1033', '1034', '1035', '1036', '1037', '1038'],
    popularityIndicator: false,
  ),
];
