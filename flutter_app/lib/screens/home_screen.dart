import 'package:flutter/material.dart';
import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomTab = 0;
  String _selectedFilter = 'Todo';
  final Set<String> _favorites = {'vestido_lino'};
  String _searchQuery = '';

  final List<String> _filters = [
    'Todo',
    'Lino Europeo',
    'Algodón Orgánico',
    'Tinte Botánico',
    'Cáñamo'
  ];

  @override
  Widget build(BuildContext context) {
    final filteredList = mockProducts.where((p) {
      final matchesFilter = _selectedFilter == 'Todo' ||
          p.filterSection == _selectedFilter;
      final matchesSearch = _searchQuery.isEmpty ||
          p.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.badge.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Barra superior
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3EFE6),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFE7E3DA)),
                    ),
                    child: const Icon(
                      Icons.eco_outlined,
                      size: 17,
                      color: Color(0xFF1D3B2A),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Lino Organic',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17231C),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Inicio',
                      style: TextStyle(color: Color(0xFF686E68), fontSize: 13),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Color(0xFF17231C),
                      size: 21,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Bolsa de compras: 1 prenda reservada'),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xFFDCC7B4),
                      child: Icon(Icons.person, size: 18, color: Color(0xFF17231C)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 2. Saludo + Insignia 100% TRAZABLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hola, Alex 👋',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF17231C),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Prendas conscientes hechas a mano',
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Color(0xFF686E68),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3EFE6),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.eco, size: 14, color: Color(0xFF1D3B2A)),
                        SizedBox(width: 5),
                        Text(
                          '100% TRAZABLE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF214A34),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 3. Buscador + Botón Escáner Cámara
              Container(
                padding:
                    const EdgeInsets.only(left: 14, right: 6, top: 6, bottom: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2EFE9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFF686E68), size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (val) => setState(() => _searchQuery = val),
                        decoration: const InputDecoration(
                          hintText: 'Escanear prenda o buscar tejido...',
                          hintStyle: TextStyle(
                            color: Color(0xFF8C8F89),
                            fontSize: 13,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _showArScannerDialog(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D3B2A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Color(0xFFD67452),
                          size: 19,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 4. Tarjeta Hero BÚSQUEDA VISUAL AR
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1B3A2A), Color(0xFF284A38)],
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF8DFD4),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.center_focus_weak,
                                size: 14,
                                color: Color(0xFF7A4B2A),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'BÚSQUEDA VISUAL AR',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                                color: Color(0xFFF8DFD4),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.14),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Nuevo',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Encuentra por textura o etiqueta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Apunta con la cámara para reconocer lino puro, algodón salvaje o trazar el origen del ovillo.',
                      style: TextStyle(
                        color: Color(0xFF9EB5A5),
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => _showArScannerDialog(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.center_focus_weak,
                                  size: 16,
                                  color: Color(0xFFD67452),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Abrir cámara',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.5,
                                    color: Color(0xFF17231C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Demora ~1s',
                          style: TextStyle(
                            color: Color(0xFF9EB5A5),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 5. TEJIDOS Y SECCIONES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TEJIDOS Y SECCIONES',
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF686E68),
                    ),
                  ),
                  Text(
                    '${filteredList.length} prendas',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF214A34),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _filters.map((filter) {
                    final selected = _selectedFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedFilter = filter),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xFF1D3B2A)
                                : const Color(0xFFF1EEE7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              if (filter == 'Todo') ...[
                                Icon(
                                  Icons.eco,
                                  size: 14,
                                  color: selected
                                      ? Colors.white
                                      : const Color(0xFF1D3B2A),
                                ),
                                const SizedBox(width: 5),
                              ],
                              Text(
                                filter,
                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : const Color(0xFF17231C),
                                  fontWeight: selected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),

              // 6. Encabezado Colección Esencial
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Colección Esencial',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF17231C),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Fibras vírgenes, tintes botánicos y confección justa',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF686E68),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Ver\ncatálogo',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7A4B2A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // 7. Grid 2x2 de Productos
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final p = filteredList[index];
                  final isFav = _favorites.contains(p.id);

                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFE7E3DA)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(color: p.placeholderColor),
                                Image.network(
                                  p.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Center(
                                    child: Icon(
                                      Icons.checkroom,
                                      size: 38,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isFav) {
                                          _favorites.remove(p.id);
                                        } else {
                                          _favorites.add(p.id);
                                        }
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        isFav
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 15,
                                        color: isFav
                                            ? const Color(0xFFD67452)
                                            : const Color(0xFF686E68),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.92),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      p.badge,
                                      style: const TextStyle(
                                        fontSize: 9.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          p.category,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF886B54),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          p.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              p.price,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${p.title} añadido a la bolsa'),
                                  ),
                                );
                              },
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF4F1EB),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.add, size: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),

              // 8. Banner Ciclo Circular
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F1EB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFDCEBE0),
                      child: Icon(
                        Icons.all_inclusive,
                        color: Color(0xFF214A34),
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ciclo Circular & Cero Residuos',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFF17231C),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Cada fibra proviene de cooperativas regenerativas en Galicia y Portugal.',
                            style: TextStyle(
                              fontSize: 11.5,
                              color: Color(0xFF686E68),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _bottomTab,
        backgroundColor: Colors.white,
        onDestinationSelected: (index) {
          setState(() => _bottomTab = index);
          if (index == 1) {
            _showArScannerDialog(context);
          } else if (index == 3) {
            Navigator.pushNamed(context, '/login');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Escanear',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  void _showArScannerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF123120),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.center_focus_weak, color: Color(0xFFD67452)),
                SizedBox(width: 8),
                Text(
                  'BÚSQUEDA VISUAL AR',
                  style: TextStyle(
                    color: Color(0xFFF8DFD4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Escáner de Textura y Origen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Reconociendo fibra: Lino europeo 100% cultivado en Allariz...',
              style: TextStyle(color: Color(0xFFA5C0AE), fontSize: 13),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF17231C),
                ),
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cerrar escáner'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
