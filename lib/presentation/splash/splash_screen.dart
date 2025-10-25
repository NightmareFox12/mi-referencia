import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mi_referencia/presentation/home/home_screen.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //states
    late final opacity = useState<double>(0);

    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    late final Animation<AlignmentGeometry> animation =
        Tween<AlignmentGeometry>(
          begin: Alignment.topCenter,
          end: Alignment.center,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.decelerate),
        );

    useEffect(() {
      controller.forward();

      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          opacity.value = 1;
        }
      });
      return null;
    }, []);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    AlignTransition(
                      alignment: animation,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ],
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: AnimatedOpacity(
                      opacity: opacity.value,
                      duration: const Duration(seconds: 1),
                      onEnd: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      ),
                      child: Text(
                        'Mi Referencia',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
