import 'package:flupro/app.dart';
import 'package:flupro/events/events.dart';
import 'package:flupro/providers.dart';

enum TabbarType { home, mine }

class TabbarScaffold extends StatefulHookConsumerWidget {
  const TabbarScaffold({
    super.key,
    required this.body,
    this.type = TabbarType.home,
  });

  final Widget body;
  final TabbarType type;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabbarPageState();
}

class _TabbarPageState extends ConsumerState<TabbarScaffold> {
  int _index = -1;
  List<Widget> _children = [];

  void _updateChildren() {
    if (widget.type.index != _index) {
      _index = widget.type.index;
      _children[_index] = widget.body;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _children = [
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
    _updateChildren();
  }

  @override
  void didUpdateWidget(covariant TabbarScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) {
      _updateChildren();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('data'),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _index,
              children: _children,
            ),
          ),
          _TabBar(index: _index),
        ],
      ),
    );
  }
}

class _TabBar extends ConsumerWidget {
  const _TabBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;

    final data = [
      {
        'title': '首页',
        'icon': 'home',
        'onTap': (BuildContext context) {
          context.go('/home');
        },
      },
      {
        'title': '我的',
        'icon': 'home',
        'onTap': (BuildContext context) {
          // if (!ref.read(isLoggedProvider)) {
          //   context.push('/login');
          // } else {
          context.go('/mine');
          // }
        },
      },
    ];

    List<Widget> children = [];

    for (int i = 0; i < data.length; i++) {
      children.add(
        Expanded(
          child: GestureDetector(
            onTap: () => (data[i]['onTap'] as Function).call(context),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/ic_${data[i]['icon']}_${i == index ? 'slt' : 'nor'}.png',
                  width: 26,
                  height: 26,
                ),
                const SizedBox(height: 3),
                Text(
                  data[i]['title'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: i == index ? colors.primary : colors.text4,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return _AppEventlistener(
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Container(
          padding: const EdgeInsets.only(right: 80),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ],
          ),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                // const ExtensivePlayer(),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: children,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppEventlistener extends HookConsumerWidget {
  const _AppEventlistener({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final needLoginSub =
          ref.read(eventBusProvider).on<AppNeedToLogin>().listen((event) {
        if (GoRouter.of(context).location != '/login') {
          ref.read(authNotifierProvider.notifier).logout();
          context
            ..go('/')
            ..push('/login');
        }
      });
      return () {
        needLoginSub.cancel();
      };
    });
    return child;
  }
}
