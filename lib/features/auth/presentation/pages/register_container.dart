import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/register_bloc.dart';

class RegisterContainer extends StatelessWidget {
  const RegisterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        
        
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.snow,
          body: SafeArea(
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(top: 62.0),
                  child: Row(
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: InkWell(
                          onTap: () {
                            
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              'assets/images/splash_logo.svg', 
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                AppColors.darkgray,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: Text('Setup', style: AppTextStyles.h1),
                        ),
                      ),

                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: AppColors.divider,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: Text(
                                  '1',
                                  style: AppTextStyles.subheading.copyWith(
                                    color: AppColors.darkgray,
                                  ),
                                ),
                              ),
                              const Text(
                                '/',
                                style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF262626),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: Text(
                                  '2',
                                  style: AppTextStyles.subheading.copyWith(
                                    color: AppColors.darkgray,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('First Name', style: AppTextStyles.h2),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.coolgray,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Input your first name',
                                  hintStyle: AppTextStyles.body.copyWith(
                                    color: AppColors.darkgray.withOpacity(0.5),
                                  ),
                                ),
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.darkgray,
                                ),
                                
                                onChanged: (value) {
                                  
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Last Name', style: AppTextStyles.h2),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.coolgray,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Input your last name',
                                  hintStyle: AppTextStyles.body.copyWith(
                                    color: AppColors.darkgray.withOpacity(0.5),
                                  ),
                                ),
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.darkgray,
                                ),
                                
                                onChanged: (value) {
                                  
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gender', style: AppTextStyles.h2),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFFFFCDA9,
                                      ), 
                                      border: Border.all(
                                        color: AppColors.powerorange,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Male',
                                        style: AppTextStyles.body.copyWith(
                                          color: AppColors.powerorange,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.snow,
                                      border: Border.all(
                                        color: AppColors.divider,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Female',
                                        style: AppTextStyles.body.copyWith(
                                          color: AppColors.darkgray,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.snow,
                                      border: Border.all(
                                        color: AppColors.divider,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Other',
                                        style: AppTextStyles.body.copyWith(
                                          color: AppColors.darkgray,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Year of birth', style: AppTextStyles.h2),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.coolgray,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '1990',
                                      style: AppTextStyles.body.copyWith(
                                        color: AppColors.darkgray,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey[800],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current school level',
                              style: AppTextStyles.h2,
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: () {
                                
                                
                                _showGradePicker(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.coolgray,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      state.selectedGrade ?? 'Grade 1',
                                      style: AppTextStyles.body.copyWith(
                                        color: AppColors.darkgray,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.grey[800],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightorange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Continue',
                      style: AppTextStyles.body.copyWith(color: AppColors.snow),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showGradePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true, 
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: const BoxDecoration(
            color: AppColors.snow,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  children: [
                    _buildGradeItem(context, 'Grade 1', true),
                    _buildGradeItem(context, 'Grade 2', false),
                    _buildGradeItem(context, 'Grade 3', false),
                    _buildGradeItem(context, 'Grade 4', false),
                    _buildGradeItem(context, 'Grade 5', false),
                    _buildGradeItem(context, 'Grade 6', false),
                    _buildGradeItem(context, 'Grade 7', false),
                    _buildGradeItem(context, 'Grade 8', false),
                    _buildGradeItem(context, 'Grade 9', false),
                    _buildGradeItem(
                      context,
                      'High School: Number and Quantity',
                      false,
                    ),
                    _buildGradeItem(context, 'High School: Algebra', false),
                    _buildGradeItem(context, 'High School: Functions', false),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGradeItem(BuildContext context, String grade, bool isSelected) {
    return InkWell(
      onTap: () {
        
        Navigator.pop(context); 
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFCDA9) : AppColors.snow,
          border: Border.all(
            color: isSelected ? AppColors.powerorange : AppColors.divider,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          grade,
          style: AppTextStyles.body.copyWith(
            color: isSelected ? AppColors.powerorange : AppColors.darkgray,
          ),
        ),
      ),
    );
  }
}
