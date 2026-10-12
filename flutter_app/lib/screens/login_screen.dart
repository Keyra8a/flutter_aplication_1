import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController(text: '••••••••••••');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              // Logo circular Sow & Sew
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F2EC),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE7E3DA)),
                ),
                child: const Icon(
                  Icons.eco_outlined,
                  size: 40,
                  color: Color(0xFF1D3B2A),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Sow & Sew',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17231C),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'MODA CONSCIENTE Y NATURAL',
                style: TextStyle(
                  fontSize: 10.5,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF214A34),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Bienvenido de nuevo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17231C),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Ingresa a tu cuenta para continuar tu viaje sostenible',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Color(0xFF686E68)),
              ),
              const SizedBox(height: 24),

              // Campo de Correo Electrónico
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Correo electrónico',
                  style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'ejemplo@correo.com',
                  prefixIcon: const Icon(Icons.email_outlined, size: 20),
                  filled: true,
                  fillColor: const Color(0xFFF2EFE9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Campo de Contraseña
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Contraseña',
                    style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Enlace de recuperación enviado'),
                        ),
                      );
                    },
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7A4B2A),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: _obscurePassword,
                controller: _passwordController,
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
              const SizedBox(height: 24),

              // Botón Iniciar sesión -> Navega a /home
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D3B2A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/home'),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iniciar sesión',
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
              const SizedBox(height: 24),

              // Separador O CONTINÚA CON
              const Row(
                children: [
                  Expanded(child: Divider(color: Color(0xFFEAE6DD))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'O CONTINÚA CON',
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
              const SizedBox(height: 18),

              // Botones de inicio social
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
                        Icons.apple,
                        color: Color(0xFF17231C),
                        size: 20,
                      ),
                      label: const Text(
                        'Apple',
                        style: TextStyle(
                          color: Color(0xFF17231C),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Banner Confección 100% Trazable
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
                            'Confección 100% Trazable',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFF17231C),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Cada prenda cultiva un futuro más limpio',
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
              const SizedBox(height: 18),

              // Enlace para ir a la Pantalla de Registro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿No tienes una cuenta? ',
                    style: TextStyle(color: Color(0xFF686E68)),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      'Regístrate aquí',
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


