import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leychenko_pixabay_test_app/widgets/widgets.dart';
import '../block/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
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
              padding: const EdgeInsets.all(5),
              sliver: BlocBuilder<HomeBloc, HomeState>(
                bloc: homeBloc,
                builder: (context, state) {
                  if (state is HomeLoadingPhotos) {
                    return const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    ));
                  } else {
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300.0,
                        mainAxisSpacing: 3.0,
                        crossAxisSpacing: 3.0,
                        childAspectRatio: 2.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return state.listPhotoVw[index].wg;
                        },
                        childCount: state.listPhotoVw.length,
                      ),
                    );
                  }
                },
              )),
        ]));
  }
}
