import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/constant.dart';

import '../utlis/app_router.dart';

class CoustemSearchContaner extends StatelessWidget {
  const CoustemSearchContaner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.KSearchView);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.search,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "What are you looking for ?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.format_list_bulleted_sharp,
                              color: KprimaryColor,
                            ),
                          ],
                        ),
                      ),
                    );
  }
}