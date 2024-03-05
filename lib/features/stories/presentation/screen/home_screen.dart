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
  @override
  void initState() {
    context.read<StoryBloc>().add(GetStories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocConsumer<StoryBloc, StoryState>(
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
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
              itemCount: state.storiesList?.length,
              itemBuilder: (context, index) => StoryCard(
                story: state.storiesList![index],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
