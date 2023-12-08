import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(leading: Container(), title: Text('Tarefas')),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: Duration(microseconds: 5000),
          child: ListView(
            children: [
              Task(
                  'Tarefa 1',
                  'https://images.squarespace-cdn.com/content/v1/5a832f4ad0e62892b8e61f61/d04b7839-e580-4031-bba2-0e8fcd8af6e4/11.png?format=1500w',
                  1),
              Task(
                  'Tarefa 2',
                  'https://images.squarespace-cdn.com/content/v1/5a832f4ad0e62892b8e61f61/8dbf7793-852a-44b2-97fb-b79d1d5d71d5/18.png?format=1500w',
                  5),
              Task(
                  'Tarefa 3',
                  'https://images.squarespace-cdn.com/content/v1/5a832f4ad0e62892b8e61f61/fa2528eb-9865-447a-9a35-cce1aed53f83/1.png?format=1500w',
                  3),
              Task(
                  'Tarefa 4',
                  'https://images.squarespace-cdn.com/content/v1/5a832f4ad0e62892b8e61f61/07aa9b81-bda0-4136-9854-b24c135222e3/12.png?format=1500w',
                  4),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });

          },
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.blue),
              height: 140,
            ),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(4)),
                            width: 72,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: TextStyle(fontSize: 24),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    size: 15,
                                    color: Colors.blue[
                                        widget.dificuldade >= 1 ? 0 : 100]),
                                Icon(Icons.star,
                                    size: 15,
                                    color: Colors.blue[
                                        widget.dificuldade >= 2 ? 0 : 100]),
                                Icon(Icons.star,
                                    size: 15,
                                    color: Colors.blue[
                                        widget.dificuldade >= 3 ? 0 : 100]),
                                Icon(Icons.star,
                                    size: 15,
                                    color: Colors.blue[
                                        widget.dificuldade >= 4 ? 0 : 100]),
                                Icon(Icons.star,
                                    size: 15,
                                    color: Colors.blue[
                                        widget.dificuldade >= 5 ? 0 : 100]),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 32,
                          width: 32,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  nivel++;
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_drop_up),
                                  Text('UP', style: TextStyle(fontSize: 12))
                                ],
                              )),
                        )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: LinearProgressIndicator(
                            color: Colors.white,
                            value: (widget.dificuldade > 0
                                ? ((nivel / widget.dificuldade) / 10)
                                : 1)),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text('Nivel: $nivel',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
