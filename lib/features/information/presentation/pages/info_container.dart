import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/widgets.dart';
import 'package:studia/features/information/presentation/bloc/info_bloc.dart';
import 'package:studia/features/information/presentation/pages/info_domain_container.dart';
import 'package:studia/features/information/presentation/pages/info_level_container.dart';
import 'package:studia/features/information/presentation/pages/info_skill_container.dart';
import 'package:studia/features/information/presentation/pages/info_standard_container.dart';
import 'package:studia/main.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InfoBloc>();
    return BlocConsumer<InfoBloc, InfoState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return LoadingWidget();
        }

        String title = '';

        Widget? content;
        if (state.selected is Levels) {
          content = InfoLevelContainer(
            level: state.levelDetails!,
            infoBloc: bloc,
          );
          title = getIt.get<AppTextConstants>().levelDetails;
        } else if (state.selected is Skills) {
          content = InfoSkillContainer(
            skill: state.skillDetails!,
            infoBloc: bloc,
          );
          title = getIt.get<AppTextConstants>().skillDetails;
        } else if (state.selected is Domains) {
          content = InfoDomainContainer(
            domain: state.domainDetails!,
            infoBloc: bloc,
          );
          title = getIt.get<AppTextConstants>().domainDetails;
        } else if (state.selected is Standards) {
          content = InfoStandardContainer(
            standard: state.standardDetails!,
            infoBloc: bloc,
          );
          title = getIt.get<AppTextConstants>().standardDetails;
        } else {
          content = Container();
        }

        return Scaffold(
          appBar: CustomAppBarTitle.build(
            context,
            title,
            leading: CustomButton(
              onPressed: () => Navigator.pop(context),
              leading: CustomIcon(
                icon: Icons.arrow_back,
                color: AppColors.darkgray,
              ),
              type: AppButtonType.transparent,
            ),
          ),
          body: Container(padding: EdgeInsets.all(16), child: content),
        );
      },
    );
  }
}
