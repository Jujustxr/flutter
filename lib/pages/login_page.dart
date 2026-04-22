import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _showForm = false;
  bool _obscure = true;

  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  static const maroon = Color(0xFF6B0F1A);
  static const maroonAccent = Color(0xFFc0392b);
  static const cream = Color(0xFFFFF8F8);

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.of(context).pushReplacementNamed('/profile');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: maroonAccent,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: cream,
        body: Stack(
          children: [
            // ── Decorative blobs ──
            Positioned(
              top: -60,
              right: -60,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: maroon.withOpacity(0.07),
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 30,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: maroon.withOpacity(0.06),
                ),
              ),
            ),
            Positioned(
              bottom: -40,
              left: -40,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: maroon.withOpacity(0.04),
                ),
              ),
            ),

            SafeArea(
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 48),

                          // ── Header ──
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: maroon.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _showForm ? 'MASUK AKUN' : 'HALO, SELAMAT DATANG',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: maroon,
                                letterSpacing: 1.8,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),

                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _showForm
                                ? _buildHeading(
                                    key: const ValueKey('h-form'),
                                    title: 'Masuk\nke Akunmu',
                                    subtitle:
                                        'Selamat datang kembali!',
                                  )
                                : _buildHeading(
                                    key: const ValueKey('h-init'),
                                    title: 'Hei,\nKamu Kembali!',
                                    subtitle:
                                        'Login untuk melanjutkan perjalananmu.',
                                  ),
                          ),

                          const SizedBox(height: 36),

                          // ── Ilustrasi ──
                          Center(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 400),
                              child: _showForm
                                  ? _IllustrationHide(
                                      key: const ValueKey('hide'))
                                  : _IllustrationHi(key: const ValueKey('hi')),
                            ),
                          ),

                          const SizedBox(height: 32),

                          // ── Form atau tombol awal ──
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _showForm
                                ? _buildForm(context)
                                : _buildInitialButtons(context),
                          ),

                          const SizedBox(height: 28),

                          // ── Terms ──
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Dengan melanjutkan, kamu menyetujui',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.brown.shade300),
                                ),
                                const Text(
                                  'Syarat & Kebijakan Privasi',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: maroon,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeading({
    required Key key,
    required String title,
    required String subtitle,
  }) {
    return SizedBox(
      key: key,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: maroon,
              height: 1.1,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              color: Colors.brown.shade400,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialButtons(BuildContext context) {
    return Column(
      key: const ValueKey('initial'),
      children: [
        // ── Login with Email button ──
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => setState(() => _showForm = true),
            icon: const Icon(Icons.email_outlined,
                size: 16, color: Colors.white),
            label: const Text(
              'MASUK DENGAN EMAIL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: maroon,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // ── Divider ──
        Row(
          children: [
            Expanded(child: Divider(color: Colors.brown.shade100)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('atau',
                  style: TextStyle(
                      fontSize: 11, color: Colors.brown.shade300)),
            ),
            Expanded(child: Divider(color: Colors.brown.shade100)),
          ],
        ),
        const SizedBox(height: 16),

        // ── Sign up ──
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Belum punya akun? ',
                style: TextStyle(
                    fontSize: 13, color: Colors.brown.shade400),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<AuthBloc>(),
                      child: const RegisterPage(),
                    ),
                  ),
                ),
                child: const Text(
                  'Daftar',
                  style: TextStyle(
                    fontSize: 13,
                    color: maroon,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      key: const ValueKey('form'),
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: maroon.withOpacity(0.07),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Email ──
              _buildLabel('Email'),
              const SizedBox(height: 6),
              TextField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    fontSize: 13, color: Color(0xFF2d1010)),
                decoration: _inputDecoration(
                  hint: 'email@gmail.com',
                  icon: Icons.email_outlined,
                ),
              ),
              const SizedBox(height: 16),

              // ── Password ──
              _buildLabel('Password'),
              const SizedBox(height: 6),
              TextField(
                controller: _passCtrl,
                obscureText: _obscure,
                style: const TextStyle(
                    fontSize: 13, color: Color(0xFF2d1010)),
                decoration: _inputDecoration(
                  hint: '••••••••',
                  icon: Icons.lock_outline,
                  suffix: GestureDetector(
                    onTap: () =>
                        setState(() => _obscure = !_obscure),
                    child: Icon(
                      _obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.brown.shade300,
                      size: 18,
                    ),
                  ),
                ),
              ),

              // ── Forgot password ──
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text.rich(
                    TextSpan(
                      text: 'Lupa Password? ',
                      style: TextStyle(
                          fontSize: 11, color: Colors.brown.shade300),
                      children: const [
                        TextSpan(
                          text: 'Klik di sini',
                          style: TextStyle(
                            color: maroon,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Login button ──
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          context.read<AuthBloc>().add(LoginSubmitted(
                                email: _emailCtrl.text.trim(),
                                password: _passCtrl.text.trim(),
                              ));
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maroon,
                    disabledBackgroundColor: maroon.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2.5),
                        )
                      : const Text(
                          'MASUK SEKARANG',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 14),

              // ── Back ──
              Center(
                child: GestureDetector(
                  onTap: () => setState(() => _showForm = false),
                  child: Text(
                    '← Kembali',
                    style: TextStyle(
                        fontSize: 12, color: Colors.brown.shade400),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.brown.shade600,
        letterSpacing: 0.3,
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle:
          TextStyle(color: Colors.brown.shade200, fontSize: 13),
      prefixIcon:
          Icon(icon, color: maroon.withOpacity(0.5), size: 18),
      suffixIcon: suffix,
      filled: true,
      fillColor: const Color(0xFFFFF8F8),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.brown.shade100),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: maroon, width: 1.5),
      ),
    );
  }
}

// ── Ilustrasi Hi ──
class _IllustrationHi extends StatelessWidget {
  const _IllustrationHi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFFFEEEE),
        shape: BoxShape.circle,
        border: Border.all(
            color: const Color(0xFF6B0F1A).withOpacity(0.15), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6B0F1A).withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.waving_hand_outlined,
              size: 52, color: Color(0xFF6B0F1A)),
          Positioned(
            top: 16,
            right: 10,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: const Text('Hei!',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF6B0F1A))),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Ilustrasi Hide (form aktif) ──
class _IllustrationHide extends StatelessWidget {
  const _IllustrationHide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFFFEEEE),
        shape: BoxShape.circle,
        border: Border.all(
            color: const Color(0xFF6B0F1A).withOpacity(0.15), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6B0F1A).withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Icon(Icons.lock_person_outlined,
          size: 52, color: Color(0xFF6B0F1A)),
    );
  }
}