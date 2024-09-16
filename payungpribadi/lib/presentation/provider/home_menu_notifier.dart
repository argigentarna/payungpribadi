import 'package:flutter/material.dart';
import 'package:payungpribadi/common/const.dart';
import 'package:payungpribadi/data/models/item_menu.dart';

class HomeMenuNotifier extends ChangeNotifier {
  final List<ItemMenu> _items = [
    ItemMenu(
      label: 'Urun',
      svgPath: svgNotifications,
      category: 'Produk Keuangan',
    ),
    ItemMenu(
      label: 'Pembiayaan Porsi Haji',
      svgPath: svgNotifications,
      category: 'Produk Keuangan',
    ),
    ItemMenu(
      label: 'Financial Checkup',
      svgPath: svgNotifications,
      category: 'Produk Keuangan',
    ),
    ItemMenu(
      label: 'Urun',
      svgPath: svgNotifications,
      category: 'Produk Keuangan',
    ),
    ItemMenu(
      label: 'Urun',
      svgPath: svgNotifications,
      category: 'Produk Keuangan',
    ),
    ItemMenu(
      label: 'Hobi',
      svgPath: svgNotifications,
      category: 'Kategori Pilihan',
    ),
    ItemMenu(
      label: 'Merchandise',
      svgPath: svgNotifications,
      category: 'Kategori Pilihan',
    ),
    ItemMenu(
      label: 'Gaya Hidup Sehat',
      svgPath: svgNotifications,
      category: 'Kategori Pilihan',
    ),
    ItemMenu(
      label: 'Konseling & Rohani',
      svgPath: svgNotifications,
      category: 'Kategori Pilihan',
    ),
    ItemMenu(
      label: 'Self Development',
      svgPath: svgNotifications,
      category: 'Kategori Pilihan',
    ),
    ItemMenu(
      label: 'Perancangan Keuangan',
      svgPath: svgNotifications,
      category: 'Kategori Pilihan',
    ),
    ItemMenu(
      label: 'Konsultasi Medis',
      svgPath: svgNotifications,
      category: 'Kategori Pilihan',
    ),
  ];

  List<ItemMenu> get items => _items;
}
