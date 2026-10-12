import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String category;
  final String badge;
  final String price;
  final Color placeholderColor;
  final String imageUrl;
  final String filterSection;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.badge,
    required this.price,
    required this.placeholderColor,
    required this.imageUrl,
    required this.filterSection,
  });
}

const List<Product> mockProducts = [
  Product(
    id: 'vestido_lino',
    title: 'Vestido Lino Bruma',
    category: 'CONFECCIÓN LOCAL',
    badge: '100% Lino',
    price: '89€',
    placeholderColor: Color(0xFFD9CDB8),
    imageUrl: 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?auto=format&fit=crop&w=600&q=80',
    filterSection: 'Lino Europeo',
  ),
  Product(
    id: 'camisa_cruda',
    title: 'Camisa Cruda...',
    category: 'GOTS CERTIFICADO',
    badge: 'Bio Cotton',
    price: '64€',
    placeholderColor: Color(0xFFE7DFD3),
    imageUrl: 'https://images.unsplash.com/photo-1598033129183-c4f50c736f10?auto=format&fit=crop&w=600&q=80',
    filterSection: 'Algodón Orgánico',
  ),
  Product(
    id: 'pantalon_oliva',
    title: 'Pantalón Oliva Duna',
    category: 'CORTE FLUIDO',
    badge: 'Lino & Canvas',
    price: '78€',
    placeholderColor: Color(0xFFB7B69E),
    imageUrl: 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?auto=format&fit=crop&w=600&q=80',
    filterSection: 'Lino Europeo',
  ),
  Product(
    id: 'kimono_arcilla',
    title: 'Kimono Arcilla Viva',
    category: 'EDICIÓN LIMITADA',
    badge: 'Tinte Botánico',
    price: '95€',
    placeholderColor: Color(0xFFC57B57),
    imageUrl: 'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?auto=format&fit=crop&w=600&q=80',
    filterSection: 'Tinte Botánico',
  ),
];
