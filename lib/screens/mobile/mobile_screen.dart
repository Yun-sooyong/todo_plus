import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_plus/constants/colors.dart';
import 'package:todo_plus/services/data_service.dart';
import 'package:todo_plus/utils/dialog.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  late TextEditingController controller;
  int? selectedIndex;
  String? projectTitle;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // * App Bar * //
        appBar: AppBar(
          title:
              projectTitle != null ? Text(projectTitle!) : const Text('Notes'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: projectTitle == null ? null : () {},
            )
          ],
          // * Tab Bar * //
          bottom: const TabBar(
            indicator: BoxDecoration(
              color: Colorz.cMainLight,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            labelStyle: TextStyle(
              color: Colorz.cMain,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            labelColor: Colorz.cMain,
            unselectedLabelColor: Colorz.cMainLight,
            tabs: [
              Tab(
                text: '예정',
              ),
              Tab(
                text: '진행중',
              ),
              Tab(
                text: '완료',
              ),
            ],
          ),
        ),
        // * Drawer * //
        drawer: Drawer(
          backgroundColor: Colorz.cMain,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    // TODO_로고 추가
                    height: size.height * 0.06,
                  ),
                  Expanded(
                    child: streamProject(),
                  ),
                  const Divider(
                    color: Colors.white54,
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      addProjectDialog(context, controller);
                    },
                    child: SizedBox(
                      height: size.height * 0.065,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 28,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '새로운 프로젝트',
                            style: TextStyle(
                              color: Colorz.cMainLight,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // * Body * //
        body: Container(
          color: Colorz.cMainLight,
          child: StreamBuilder<Object>(
            stream: projectTitle != null
                ? DataService.getNotes(projectTitle!)
                : null,
            builder: (context, AsyncSnapshot snapshot) {
              // error 시 상황
              if (snapshot.hasError) {
                showExceptionDialog(
                  context: context,
                  title: '에러 발생!',
                  exception: snapshot.error.toString(),
                );
              }
              // loading 중
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // 앱 진입 직후 표시
              if (projectTitle == null) {
                return Container(
                    //color: Colorz.cMainLight,
                    );
              }
              // data가 없을 때
              if (!snapshot.hasData || snapshot.data!.docs.length == 0) {
                return Container(
                  child: const Center(
                    child: Text('No Data'),
                  ),
                );
              }

              return Container(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data!.docs[index].docId),
                        );
                      },
                    ),
                    Container(
                      color: Colorz.cMainLight,
                      child: const Center(
                        child: Text('진행중'),
                      ),
                    ),
                    Container(
                      color: Colorz.cMainLight,
                      child: const Center(
                        child: Text('완료'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> streamProject() {
    return StreamBuilder(
      stream: DataService.getProject(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          showExceptionDialog(
            context: context,
            title: '에러 발생!',
            exception: snapshot.error.toString(),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Colors.white54,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            String title = snapshot.data!.docs[index].id;
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    color: selectedIndex == index
                        ? Colors.amber
                        : Colorz.cMainLight,
                    fontWeight: selectedIndex == index ? FontWeight.bold : null,
                    fontSize: selectedIndex == index ? 18 : 16,
                  ),
                ),
                onTap: () {
                  setState(
                    () {
                      projectTitle = title;
                      selectedIndex = index;
                      print(title);
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
