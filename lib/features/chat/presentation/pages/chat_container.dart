import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/chat/domain/entities/message.dart';
import 'package:studia/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:studia/main.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatBloc>();
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBarTitle.build(
            context,
            getIt.get<AppTextConstants>().chat,
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: bloc.scrollController,
                  physics: BouncingScrollPhysics(),
                  child: _ChatContainer(context, bloc),
                ),
              ),
              _ChatBar(context, bloc),
            ],
          ),
        );
      },
    );
  }

  _ChatContainer(BuildContext context, ChatBloc bloc) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 8,
        children: [
          SvgPicture.asset('assets/images/studia_logo_color.svg', height: 100),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${getIt.get<AppTextConstants>().hello},",
                style: AppTextStyles.h3.copyWith(color: AppColors.darkgray),
              ),
              SizedBox(width: 8),
              Text(
                bloc.userName,
                style: AppTextStyles.h3.copyWith(color: AppColors.orange),
              ),
            ],
          ),
          SizedBox(height: 32),
          ...bloc.state.messageHistory
              .map((message) => _ChatMessage(message))
              .toList(),
        ],
      ),
    );
  }

  _ChatBar(BuildContext context, ChatBloc bloc) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _ChipBar(context, bloc.state.messageChips, (String item) {
            bloc.add(ChatEvent.clickChip(item));
          }),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (String value) {
                    bloc.add(ChatEvent.textChanged(value));
                  },
                  controller: bloc.controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(color: AppColors.coolgray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(color: AppColors.coolgray),
                    ),
                    hintText: getIt.get<AppTextConstants>().chatPlaceholder,
                    hintStyle: AppTextStyles.body.copyWith(
                      color: AppColors.darkgray.withOpacity(0.5),
                    ),
                    fillColor: AppColors.coolgray,
                  ),
                  style: AppTextStyles.body.copyWith(color: AppColors.darkgray),
                ),
              ),
              SizedBox(width: 12),
              CustomButton(
                onPressed: () {
                  bloc.add(ChatEvent.sendMessage(bloc.controller.text));
                },
                leading: CustomIcon(
                  icon: Icons.arrow_upward,
                  color: AppColors.snow,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ChipBar(
    BuildContext context,
    List<String> items,
    void Function(String) onPressed,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          ...List.generate(
            items.length,
            (index) => CustomIconChip(
              text: items[index],
              chipColor: CustomChipColor.orange,
              onPressed: () => onPressed(items[index]),
              chipSize: CustomChipSize.small,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ChatMessage(Message message) {
    final isUser = message.isUser;
    Color backgroundColor;
    Color textColor;
    MainAxisAlignment alignment;

    switch (isUser) {
      case true:
        backgroundColor = AppColors.coolgray;
        textColor = AppColors.darkgray;
        alignment = MainAxisAlignment.end;
        break;
      case false:
        backgroundColor = AppColors.orange;
        textColor = AppColors.snow;
        alignment = MainAxisAlignment.start;
        break;
    }

    return Row(
      mainAxisAlignment: alignment,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 240),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Text(
            message.content,
            style: AppTextStyles.body.copyWith(color: textColor),
          ),
        ),
      ],
    );
  }
}
