import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/chat/presentation/bloc/chat_bloc.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatBloc>();
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBarTitle.build(context, 'Chat'),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
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
    return Column(
      children:
          bloc.state.messageHistory
              .map((message) => Text(message.content))
              .toList(),
    );
  }

  _ChatBar(BuildContext context, ChatBloc bloc) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // _ChipBar(context, ['Chat', 'Chat', 'Chat'], (String item) {
          //   bloc.add(ChatEvent.clickChip(item));
          // }),
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
                    hintText: 'Search',
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

  _ChipBar(
    BuildContext context,
    List<String> items,
    void Function(String) onPressed,
  ) {
    return Row(
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
    );
  }
}
