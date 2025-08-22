import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/featuers/login_and_sinup/presentation/view/login_vew.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/coustem_indecator.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/screan_one.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/screan_three.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/screan_two.dart';

class OnBordingViewBody extends StatefulWidget {
  OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  PageController _controller = PageController();

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
              children: [ScreanOne(), ScreanTwo(), ScreanThree(), LoginVew()],
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                _controller.animateToPage(
                  index + 1,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
                setState(() {});
              },
              child: Text('Next', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: KprimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          SizedBox(height: 11),
        ],
      ),
    );
  }
}
