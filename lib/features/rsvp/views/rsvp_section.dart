import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../shared/animations/entrance_animations.dart';
import '../../../shared/widgets/section_header.dart';
import '../viewmodels/rsvp_viewmodel.dart';

class RsvpSection extends ConsumerStatefulWidget {
  const RsvpSection({super.key});

  @override
  ConsumerState<RsvpSection> createState() => _RsvpSectionState();
}

class _RsvpSectionState extends ConsumerState<RsvpSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  int _numberOfGuests = 1;
  bool _willAttend = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final success = await ref.read(rsvpViewModelProvider.notifier).submitRsvp(
            guestName: _nameController.text.trim(),
            mobileNumber: _phoneController.text.trim(),
            numberOfGuests: _numberOfGuests,
            willAttend: _willAttend,
            personalMessage: _messageController.text.trim().isEmpty
                ? null
                : _messageController.text.trim(),
          );

      if (success) {
        _nameController.clear();
        _phoneController.clear();
        _messageController.clear();
        setState(() {
          _numberOfGuests = 1;
          _willAttend = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final rsvpState = ref.watch(rsvpViewModelProvider);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.horizontalPadding(context),
        vertical: 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            children: [
              const SectionHeader(
                title: 'KINDLY RSVP',
                subtitle: 'Please grace us with your response by January 25, 2027',
              ),
              FadeSlideEntrance(
                child: LuxuryCardFrame(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(isMobile ? 22 : 36),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (rsvpState.status == RsvpStatus.success &&
                            rsvpState.successMessage != null) ...[
                          Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.green.shade400, width: 1.2),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.green, size: 28),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    rsvpState.successMessage!,
                                    style: GoogleFonts.cormorantGaramond(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green.shade900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (rsvpState.status == RsvpStatus.error &&
                            rsvpState.errorMessage != null) ...[
                          Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.red.shade400, width: 1.2),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.error_outline, color: Colors.red, size: 28),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    rsvpState.errorMessage!,
                                    style: GoogleFonts.cormorantGaramond(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red.shade900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        Text(
                          'Full Name *',
                          style: GoogleFonts.cinzel(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryMaroon,
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter your full name',
                            prefixIcon: Icon(Icons.person_outline, color: AppColors.antiqueGold),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your name';
                            }
                            if (value.trim().length < 2) {
                              return 'Name must be at least 2 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Mobile Number *',
                          style: GoogleFonts.cinzel(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryMaroon,
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'e.g., +91 9876543210',
                            prefixIcon: Icon(Icons.phone_outlined, color: AppColors.antiqueGold),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            final clean = value.replaceAll(RegExp(r'[\s\-()]'), '');
                            if (clean.length < 10) {
                              return 'Please enter a valid 10-digit mobile number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Will you attend? *',
                          style: GoogleFonts.cinzel(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryMaroon,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() => _willAttend = true),
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  decoration: BoxDecoration(
                                    color: _willAttend
                                        ? AppColors.primaryMaroon
                                        : AppColors.surfaceCream,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: _willAttend
                                          ? AppColors.antiqueGold
                                          : AppColors.borderGold,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'YES, WITH JOY',
                                      style: GoogleFonts.cinzel(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: _willAttend
                                            ? Colors.white
                                            : AppColors.textDarkBrown,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() => _willAttend = false),
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  decoration: BoxDecoration(
                                    color: !_willAttend
                                        ? AppColors.primaryMaroon
                                        : AppColors.surfaceCream,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: !_willAttend
                                          ? AppColors.antiqueGold
                                          : AppColors.borderGold,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'REGRETFULLY NO',
                                      style: GoogleFonts.cinzel(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: !_willAttend
                                            ? Colors.white
                                            : AppColors.textDarkBrown,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (_willAttend) ...[
                          Text(
                            'Number of Guests (including yourself)',
                            style: GoogleFonts.cinzel(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryMaroon,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [1, 2, 3, 4, 5].map((count) {
                              final isSelected = _numberOfGuests == count;
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: () => setState(() => _numberOfGuests = count),
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors.antiqueGold
                                          : AppColors.surfaceCream,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: AppColors.antiqueGoldDark,
                                        width: isSelected ? 2 : 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$count',
                                        style: GoogleFonts.cinzel(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? Colors.white
                                              : AppColors.primaryMaroon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                        ],
                        Text(
                          'Personal Message / Wishes (Optional)',
                          style: GoogleFonts.cinzel(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryMaroon,
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: _messageController,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: 'Write your blessings or special wishes for Sanjay & Benita...',
                          ),
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: rsvpState.status == RsvpStatus.loading
                                ? null
                                : _handleSubmit,
                            child: rsvpState.status == RsvpStatus.loading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    'CONFIRM RSVP',
                                    style: GoogleFonts.cinzel(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
