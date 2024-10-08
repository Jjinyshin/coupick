import 'dart:math';
import 'package:client/providers/pollsprovider.dart';
import 'package:client/screens/like_reaction_screen.dart';
import 'package:client/screens/widgets/poll_detail_card.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/dislike_reaction_screen.dart';
import 'package:provider/provider.dart';
import 'package:client/services/like_service.dart'; // LikeService import

class NewPollDetailScreen extends StatefulWidget {
  final String pollId;

  const NewPollDetailScreen({
    super.key,
    required this.pollId,
  });

  @override
  State<NewPollDetailScreen> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<NewPollDetailScreen> {
  final CardSwiperController controller = CardSwiperController();
  final LikeService likeService = LikeService(); // LikeService 인스턴스 생성

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: true,
        body: Consumer<PollsProvider>(
          builder: (context, pollsProvider, child) {
            final poll = pollsProvider.getPollById(widget.pollId);

            if (poll == null) {
              return const Center(
                child: Text('Poll not found'),
              );
            }

            final polls = pollsProvider.polls;
            final pollIndex =
                polls.indexWhere((poll) => poll.id == widget.pollId);
            if (pollIndex == -1) {
              return const Center(
                child: Text('Poll not found'),
              );
            }

            final mainPoll = polls[pollIndex];
            polls.removeAt(pollIndex);
            polls.shuffle(Random());
            polls.insert(0, mainPoll);

            final cards = polls.map(PollDetailCard.new).toList();
            return SafeArea(
              child: Column(
                children: [
                  Flexible(
                    child: CardSwiper(
                      controller: controller,
                      cardsCount: cards.length,
                      onSwipe: _onSwipe,
                      numberOfCardsDisplayed: 3,
                      backCardOffset: const Offset(40, 40),
                      padding: const EdgeInsets.all(24.0),
                      cardBuilder: (
                        context,
                        index,
                        horizontalThresholdPercentage,
                        verticalThresholdPercentage,
                      ) =>
                          cards[index],
                      isLoop: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          heroTag: 'thumb_down',
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisLikeReactionScreen(
                                  pollId: poll.id,
                                ),
                              ),
                            );

                            if (result == true) {
                              controller.swipe(CardSwiperDirection.left);
                            }
                          },
                          child: const Icon(Icons.thumb_down),
                        ),
                        FloatingActionButton(
                          heroTag: 'arrow_up',
                          onPressed: () =>
                              controller.swipe(CardSwiperDirection.top),
                          child: const Icon(Icons.keyboard_arrow_up),
                        ),
                        FloatingActionButton(
                          heroTag: 'thumb_up',
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LikeReactionScreen(pollId: poll.id),
                              ),
                            );

                            if (result == true) {
                              controller.swipe(CardSwiperDirection.right);
                            }
                          },
                          child: const Icon(Icons.thumb_up),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.index}. Now the card $currentIndex is on top',
    );

    if (direction == CardSwiperDirection.left) {
      // Dislike 처리
      _submitReaction(false);
    } else if (direction == CardSwiperDirection.right) {
      // Like 처리
      _submitReaction(true);
    }
    return true;
  }

  Future<void> _submitReaction(bool isLike) async {
    try {
      await likeService.submitLike(widget.pollId, isLike);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}
