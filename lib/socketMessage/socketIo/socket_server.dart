import 'package:socket_io/socket_io.dart';

void main(){
  var io = Server();
  var nsp = io.of('/some');

  nsp.on('connection', (client) {
    client.on('msg', (data) {
      print('data from /some => $data');
      client.emit('fromServer', 'ok');
    });
  });

  // io.on('connection', (client) {
  //   print('connection default namespace');
  //   client.on('msg',(data) {
  //     print('data from default => $data');
  //     client.emit('fromServer', 'ok');
  //   });
  // });
  io.listen(3500);
}