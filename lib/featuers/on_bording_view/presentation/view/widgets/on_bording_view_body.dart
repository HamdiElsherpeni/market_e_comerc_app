import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/login_vew.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/coustem_indecator.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/screan_one.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/screan_three.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/screan_two.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  final PageController _controller = PageController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: _controller,
              children: [ScreanOne(), ScreanTwo(), ScreanThree()],
            ),
          ),

          CoustemElvetedBoutten(
            text: index >= 2 ? "Get Started" : 'Next',
            onPressed: () {
              if (index >= 2) {
                GoRouter.of(context).push(AppRouter.KlogIn);
                setState(() {});
              } else {
                _controller.animateToPage(
                  index + 1,
                
                  duration: Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              }
            },
          ),
          SizedBox(height: 11),
        ],
      ),
    );
  }
}
