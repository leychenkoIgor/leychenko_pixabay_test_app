import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leychenko_pixabay_test_app/widgets/widgets.dart';
import '../block/home_bloc.dart';
import 'widgets/card_photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          controller: homeBloc.scrollController,
          slivers: <Widget>[
            const AppBarWdg(
              title: "PIXABAY IMAGES",
            ),
            SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: BlocBuilder<HomeBloc, HomeState>(
                    bloc: homeBloc,
                    builder: (context, state) {
                      if (state is HomeLoadingPhotos) {
                        return const SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()));
                      } else {
                        return SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300.0,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 0.7,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int i) {
                              return  CardPhoto(
                                  index: i,
                                  photoModel: homeBloc.listPhotos[i],
                                  callLoadedPhoto: () => homeBloc.loadedImg(i));
                            },
                            childCount: homeBloc.listPhotos.length,
                          ),
                        );
                      }
                    }))
          ]),
    );
  }
}