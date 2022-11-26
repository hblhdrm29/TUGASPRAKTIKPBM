void main() {
  var mahasiswa = {
    'Habillah Darma': 3.6,
    'Harvian Arga Putra': 3.2 ,
    
  };

  mahasiswa.forEach((namamhsw,ipk) {
    if (ipk >= 3.5) {
      print(namamhsw);
      //cumlaude karena ipknya diatas 3.5
      print('cumlaude\n');
    } else {
      print(namamhsw);
      //tidak cumlaude karena ipknya dibawah 3.5
      print('tidak cumlaude\n');
    }
  });
}