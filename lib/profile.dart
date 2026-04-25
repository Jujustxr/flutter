// lib/pages/profile_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color redAccent = Color(0xFFE0001B);
  static const Color redDark   = Color(0xFF3D0000);
  static const Color redMid    = Color(0xFF1A0000);
  static const Color bgDark    = Color(0xFF0A0A0A);
  static const Color bgCard    = Color(0xFF111111);
  static const Color bgCard2   = Color(0xFF181818);
  static const Color border    = Color(0xFF222222);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildAvatarSection(),
                  _buildActionRow(),
                  _buildInterestSection(),
                  _buildInfoSection(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ── Header ──
  Widget _buildHeader(BuildContext context) {
    return Container(
      color: redDark,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              const Text(
                'Profil Saya',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => _showLogoutDialog(context),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.logout, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Avatar Section ──
  Widget _buildAvatarSection() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [redDark, redMid, bgDark],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
      child: Column(
        children: [
          Container(
            width: 94,
            height: 94,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: redAccent, width: 3),
              color: bgDark,
            ),
            child: const CircleAvatar(
              backgroundColor: redDark,
              child: Text(
                'JA',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              // Uncomment untuk pakai foto:
              // backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Juli Ayu Audia',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: redAccent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: redAccent.withOpacity(0.4)),
            ),
            child: const Text(
              'Mahasiswa • 19 Tahun',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFf4a0a0),
                letterSpacing: 0.3,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.email_outlined, color: Color(0xFF888888), size: 13),
              SizedBox(width: 5),
              Text(
                'juliayuaudia@gmail.com',
                style: TextStyle(fontSize: 12, color: Color(0xFF888888)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Action Row ──
  Widget _buildActionRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        decoration: BoxDecoration(
          color: bgCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border),
        ),
        child: Row(
          children: [
            _actionItem(Icons.access_time_outlined, '5 Min'),
            _vDivider(),
            _actionItem(Icons.chat_bubble_outline, 'Pesan'),
            _vDivider(),
            _actionItem(Icons.location_on_outlined, 'Lokasi'),
          ],
        ),
      ),
    );
  }

  Widget _actionItem(IconData icon, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          children: [
            Icon(icon, color: redAccent, size: 22),
            const SizedBox(height: 6),
            Text(label,
                style: const TextStyle(fontSize: 12, color: Color(0xFFCCCCCC))),
          ],
        ),
      ),
    );
  }

  Widget _vDivider() =>
      Container(width: 1, height: 40, color: border);

  // ── Interest Section ──
  Widget _buildInterestSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Interest'),
          const SizedBox(height: 10),
          Row(
            children: [
              _interestCard(
                icon: Icons.code_rounded,
                label: 'Coding',
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A0000), Color(0xFF3D0000)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderColor: const Color(0x44E0001B),
                iconColor: redAccent,
              ),
              const SizedBox(width: 10),
              _interestCard(
                icon: Icons.brush_outlined,
                label: 'Drawing',
                gradient: const LinearGradient(
                  colors: [Color(0xFF0A0A0A), Color(0xFF1E1E1E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderColor: const Color(0x33FFFFFF),
                iconColor: Colors.white,
              ),
              const SizedBox(width: 10),
              _interestCard(
                icon: Icons.sports_esports_outlined,
                label: 'Gaming',
                gradient: const LinearGradient(
                  colors: [Color(0xFF0A0F1A), Color(0xFF0F1F35)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderColor: const Color(0x443366AA),
                iconColor: const Color(0xFF4D8FCC),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _interestCard({
    required IconData icon,
    required String label,
    required LinearGradient gradient,
    required Color borderColor,
    required Color iconColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 36),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Info Section ──
  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Informasi Pribadi'),
          const SizedBox(height: 10),
          const _InfoCard(
            rows: [
              _InfoRowData(
                icon: Icons.person_outline,
                label: 'Nama Lengkap',
                value: 'Juli Ayu Audia',
              ),
              _InfoRowData(
                icon: Icons.cake_outlined,
                label: 'Umur',
                value: '19 Tahun',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _sectionTitle('Kontak'),
          const SizedBox(height: 10),
          const _InfoCard(
            rows: [
              _InfoRowData(
                icon: Icons.email_outlined,
                label: 'Email',
                value: 'juliayuaudia@gmail.com',
              ),
              _InfoRowData(
                icon: Icons.phone_outlined,
                label: 'Nomor Telepon',
                value: '0000',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: redAccent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: redAccent,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  // ── Bottom Nav ──
  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: bgDark,
        border: Border(top: BorderSide(color: Color(0xFF1A1A1A))),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.home_outlined, color: Color(0xFF555555), size: 24),
              const Icon(Icons.search_outlined, color: Color(0xFF555555), size: 24),
              const Icon(Icons.star_border_outlined, color: Color(0xFF555555), size: 24),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.person_outlined, color: redAccent, size: 24),
                  const SizedBox(height: 3),
                  Container(
                    width: 20,
                    height: 2,
                    decoration: BoxDecoration(
                      color: redAccent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.settings_outlined, color: Color(0xFF555555), size: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ── Logout Dialog ──
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF181818),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF2a2a2a)),
        ),
        title: const Text(
          'Keluar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        content: const Text(
          'Apakah kamu yakin ingin keluar?',
          style: TextStyle(color: Color(0xFF999999)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal',
                style: TextStyle(color: Color(0xFF999999))),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<AuthBloc>().add(AuthReset());
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false,
              );
            },
            child: const Text(
              'Keluar',
              style: TextStyle(
                  color: redAccent, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Info Row Data ──
class _InfoRowData {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRowData(
      {required this.icon, required this.label, required this.value});
}

// ── Info Card ──
class _InfoCard extends StatelessWidget {
  final List<_InfoRowData> rows;
  const _InfoCard({required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2a2a2a)),
      ),
      child: Column(
        children: rows.asMap().entries.map((entry) {
          final i = entry.key;
          final row = entry.value;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 13),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3D0000).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(row.icon,
                          color: const Color(0xFFE0001B), size: 18),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          row.label,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF666666),
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          row.value,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFFE0E0E0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (i < rows.length - 1)
                const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFF222222)),
            ],
          );
        }).toList(),
      ),
    );
  }
}