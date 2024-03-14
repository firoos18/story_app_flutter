import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:story_app_flutter/core/common/common.dart';
import 'package:story_app_flutter/features/stories/presentation/bloc/story_bloc.dart';
import 'package:story_app_flutter/features/stories/presentation/widgets/story_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<StoryBloc>().add(GetStories());
  }

  void onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll) {
      context.read<StoryBloc>().add(GetStories());
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(onScroll);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stories"),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed("settings");
            },
            icon: const Icon(Ionicons.settings),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.goNamed("add");
        },
        label: Row(
          children: [
            const Icon(Ionicons.add),
            Text(
              AppLocalizations.of(context)!.addStoryButton,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
        child: BlocConsumer<StoryBloc, StoryState>(
          listener: (context, state) {
            if (state is StoryError) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message!)),
              );
            }
          },
          builder: (context, state) {
            if (state is StoryLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            if (state is StoriesLoaded) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.noMoreData!
                    ? state.storiesList!.length
                    : state.storiesList!.length + 1,
                itemBuilder: (context, index) =>
                    (index < state.storiesList!.length)
                        ? StoryCard(story: state.storiesList![index])
                        : const Center(child: CupertinoActivityIndicator()),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
