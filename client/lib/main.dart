import 'package:client/common/const/app_colors.dart';
import 'package:client/screens/voting_detail_screen.dart';
import 'package:client/screens/poll_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/wishlist_product_provider.dart';
import 'providers/shared_preference_service.dart';
import 'screens/listview_vote.dart';
import 'screens/signup.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedPreferenceService = SharedPreferenceService();

    return FutureBuilder<bool>(
      future: sharedPreferenceService.hasToken(), // 토큰 확인 함수 사용
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // 로딩 중인 경우
        } else {
          bool hasToken = snapshot.data ?? false; // 토큰 존재 여부
          return MaterialApp(
            title: 'Coupick App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: hasToken
                // ? const PollDetailScreen(
                //     pollId: 'he',
                //   )
                ? const ListViewVote()
                : const UsernameCreationScreen(),
            routes: {
              '/vote': (context) => const ListViewVote(),
              '/create-username': (context) => const UsernameCreationScreen(),
            },
          );
        }
      },
    );
  }
}
