// lib/pages/profile_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color maroon = Color(0xFF6B0F1A);
  static const Color maroonDark = Color(0xFF3d0a10);
  static const Color maroonAccent = Color(0xFFc0392b);
  static const Color bgDark = Color(0xFF0d0d0d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark,
      body: Column(
        children: [
          // ── Header ──
          Container(
            color: maroon,
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
                      ),
                    ),
                    const Spacer(),
                    // Tombol Logout
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
          ),

          // ── Body ──
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Avatar section
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [maroon, maroonDark, bgDark],
                        stops: [0.0, 0.55, 1.0],
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
                    child: Column(
                      children: [
                        Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [maroonAccent, Color(0xFF8B0000)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(color: maroonAccent, width: 2.5),
                            boxShadow: [
                              BoxShadow(
                                color: maroonAccent.withOpacity(0.3),
                                blurRadius: 0,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'JA',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Juli Ayu Audia',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                          decoration: BoxDecoration(
                            color: maroonAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: maroonAccent.withOpacity(0.5)),
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
                      ],
                    ),
                  ),

                  // Info section
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SectionLabel(label: 'Informasi Pribadi'),
                        const SizedBox(height: 8),
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
                        const _SectionLabel(label: 'Kontak'),
                        const SizedBox(height: 8),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
            child: const Text('Batal', style: TextStyle(color: Color(0xFF999999))),
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
              style: TextStyle(color: Color(0xFFc0392b), fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section Label ──
class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          fontSize: 10,
          color: Color(0xFF6B0F1A),
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Info Row Data ──
class _InfoRowData {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRowData({required this.icon, required this.label, required this.value});
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B0F1A).withOpacity(0.25),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(row.icon, color: const Color(0xFFc0392b), size: 18),
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
                            color: Color(0xFFe0e0e0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (i < rows.length - 1)
                const Divider(height: 1, thickness: 1, color: Color(0xFF222222)),
            ],
          );
        }).toList(),
      ),
    );
  }
}