import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/add_2fa/domain/cubit/add2_fa_cubit.dart';
import 'package:top_app/modules/add_2fa/widgets/organisms/number_field_section.dart';
import 'package:top_app/modules/add_2fa/widgets/organisms/verification_code_field_section.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

@RoutePage()
class Add2faScreen extends StatelessWidget {
  const Add2faScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Add2FaCubit>(
      create: (BuildContext context) => getIt<Add2FaCubit>(),
      child: _Add2faScreenBody(),
    );
  }
}

class _Add2faScreenBody extends StatelessWidget {
  const _Add2faScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add 2FA', style: AppTextStyles.bold18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<Add2FaCubit, Add2FaState>(
          listener: (BuildContext context, Add2FaState state) {
            if (state is VerificationCodeSent) {
              CustomSnackBar.info(
                context,
                'Sending verification code, check your messages',
              );
            }

            if (state is PhoneNumberVerified) {
              CustomSnackBar.success(context, 'Phone number verified successfully!');
            }

            if (state is Error) {
              CustomSnackBar.error(context, state.message);
            }
          },
          builder: (BuildContext context, Add2FaState state) {
            if (state is VerificationCodeSent) {
              return const VerificationCodeFieldSection();
            }
            return const NumberFieldSection();
          },
        ),
      ),
    );
  }
}
