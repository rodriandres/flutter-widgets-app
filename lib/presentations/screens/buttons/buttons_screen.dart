
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';


  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_new_rounded ),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          // crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated button')),
            const ElevatedButton(onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon( Icons.access_alarm_rounded ),
              label: const Text('Alarm button')
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(onPressed: () {}, icon: const Icon( Icons.accessibility_new), label: const Text('Filled.icon')),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon( Icons.ac_unit_rounded ),
              label: const Text('Outlined.icon')
            ),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon( Icons.text_decrease ),
              label: const Text('Text.icon')
            ),

            IconButton(onPressed: () {}, icon: const Icon( Icons.add_home_work_rounded )),
            IconButton(
              onPressed: () {},
              icon: const Icon( Icons.kayaking_rounded ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll( colors.primary ),
              ),
            ),
            CustomButton(),

          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Customizable', style: TextStyle(color: Colors.white),)
          ),
        ),
      ),
    );
  }
}