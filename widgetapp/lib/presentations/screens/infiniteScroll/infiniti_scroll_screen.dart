import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class InfiniteScrollScreen extends StatefulWidget {

  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  final ScrollController scrollController = ScrollController();
  List<int> imagesIds = [ 1, 2, 3, 4, 5 ];
  bool isLoading = false;
  bool isMonted = true;
  

  void addFiveImages () {
    final lastId = imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((e) => e + lastId));

  }

  void moveScrollToBottom(){
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 150, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  Future loadNextPage () async {
    if(isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    if(!isMonted) return;
    setState(() {});
    moveScrollToBottom();
  }

  Future onRefresh() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    if(!isMonted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add( lastId + 1);
    addFiveImages();
    isLoading = false;
    setState(() { });
    moveScrollToBottom();
  }





  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent ){
        loadNextPage();
      }
    });
  }
 
  @override
  void dispose() {
    scrollController.dispose();
    isMonted = false;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.black,
    body: MediaQuery.removePadding( // quita el padding del notch
      context: context,
      removeTop: true,
      removeBottom: true,
      child: RefreshIndicator(
        edgeOffset: 10,
        strokeWidth: 5,
        onRefresh: onRefresh,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const  EdgeInsets.only(bottom: 2),
              child: FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
              ),
            );
          }, 
        ),
      ),
    ),

    floatingActionButton: FloatingActionButton(
      onPressed: () => context.pop(),
      // child: ,
      child: isLoading 
        ? const CircularProgressIndicator()
        : const Icon(Icons.arrow_back_ios_new)
    ),
   );
  }
}