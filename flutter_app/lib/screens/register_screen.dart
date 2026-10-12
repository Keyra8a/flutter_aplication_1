import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _acceptedTerms = true;
  bool _obscurePassword = true;
  final TextEditingController _nameController =
      TextEditingController(text: 'Elena Rostova');
  final TextEditingController _emailController =
      TextEditingController(text: 'elena@sowandsew.org');
  final TextEditingController _passwordController =
      TextEditingController(text: '••••••••••••');
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: '••••••••••••');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // Logo con insignia de hoja en la esquina
              Stack(
                children: [
                  Container(
                    width: 86,
                    height: 86,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F2EC),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFE7E3DA)),
                    ),
                    child: const Icon(
                      Icons.eco_outlined,
                      size: 38,
                      color: Color(0xFF1D3B2A),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCEBE0),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFFAF8F3),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.eco,
                        size: 14,
                        color: Color(0xFF123120),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Chip de categoría
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3EFE6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  '• MODA CONSCIENTE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF214A34),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Crea tu cuenta',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17231C),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Únete a nuestra comunidad de moda sostenible y prendas con propósito.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Color(0xFF686E68)),
              ),
              const SizedBox(height: 18),

              // Card Blanca con el formulario
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nombre completo',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.person_outline, size: 20),
                        filled: true,
                        fillColor: const Color(0xFFF2EFE9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    const Text(
                      'Correo electrónico',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.email_outlined, size: 20),
                        filled: true,
                        fillColor: const Color(0xFFF2EFE9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Contraseña + Requisito
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Contraseña',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Requisito mínimo 8 caracteres',
                          style: TextStyle(
                            fontSize: 10.5,
                            color: Color(0xFF886B54),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline, size: 20),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() => _obscurePassword = !_obscurePassword);
                          },
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF2EFE9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Barra indicadora de fortaleza (4 segmentos)
                    Row(
                      children: List.generate(
                        4,
                        (index) => Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: index < 3 ? 6 : 0),
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD5CFC4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Confirmar contraseña
                    const Text(
                      'Confirmar contraseña',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.verified_user_outlined, size: 20),
                        filled: true,
                        fillColor: const Color(0xFFF2EFE9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Casilla de Términos
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F1EB),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: CheckboxListTile(
                        value: _acceptedTerms,
                        onChanged: (v) =>
                            setState(() => _acceptedTerms = v ?? true),
                        activeColor: const Color(0xFF1D3B2A),
                        title: const Text(
                          'Acepto los Términos de moda ética, confección libre de pesticidas y la política de trazabilidad natural.',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF686E68),
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Botón Crear cuenta -> Navega a /home
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF123120),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, '/home'),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Crear cuenta',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Separador O REGÍSTRATE CON
              const Row(
                children: [
                  Expanded(child: Divider(color: Color(0xFFEAE6DD))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'O REGÍSTRATE CON',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8C8F89),
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xFFEAE6DD))),
                ],
              ),
              const SizedBox(height: 16),

              // Botones de registro social
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFF4F1EB),
                        side: const BorderSide(color: Color(0xFFE7E3DA)),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/home'),
                      icon: const Icon(
                        Icons.apple,
                        color: Color(0xFF17231C),
                        size: 20,
                      ),
                      label: const Text(
                        'Apple ID',
                        style: TextStyle(
                          color: Color(0xFF17231C),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFF4F1EB),
                        side: const BorderSide(color: Color(0xFFE7E3DA)),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/home'),
                      icon: const Icon(
                        Icons.g_mobiledata,
                        color: Color(0xFF4285F4),
                        size: 22,
                      ),
                      label: const Text(
                        'Google',
                        style: TextStyle(
                          color: Color(0xFF17231C),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Banner Cero químicos, 100% trazable
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
                        Icons.eco_outlined,
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
                            'Cero químicos, 100% trazable',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFF17231C),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Cada prenda sembrada respeta a los artesanos y la tierra.',
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
              const SizedBox(height: 16),

              // Enlace de vuelta a Iniciar sesión
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿Ya tienes una cuenta? ',
                    style: TextStyle(color: Color(0xFF686E68)),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: const Text(
                      'Inicia sesión',
                      style: TextStyle(
                        color: Color(0xFF7A4B2A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
