import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  String kaynak = "İngilizce";
  String cevirilecekMetin = "";
  String cevirilenMetin = "";
  String hedef = "Türkçe";

  Color renk;

  void degistir() {
    String bos = "";
    bos = kaynak;
    kaynak = hedef;
    hedef = bos;
  }

  void cevirmeIslemi() async {
    final cevirici = GoogleTranslator();
    var translation = await cevirici.translate(cevirilecekMetin,
        from: kaynak == "İngilizce" ? 'en' : 'tr',
        to: hedef == "Türkçe" ? 'tr' : 'en');
    print("*********************\n\n\n$translation\n\n\n********************");
    setState(() {
      cevirilenMetin = translation.text;
    });
    print(
        "*********************\n\n\n$cevirilenMetin\n\n\n********************");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            cevirmeIslemi();
          });
        },
        child: Icon(
          Icons.translate,
          color: Colors.black,
        ),
        backgroundColor: Colors.blue.shade200,
        elevation: 20,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("İngilizce Sözlük"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                //BUTON VE DİL DEĞİŞTİRME
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      kaynak,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          degistir();
                        });
                      },
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                      fillColor: Colors.blue.shade300,
                      elevation: 30,
                      highlightColor: Colors.red,
                    ),
                    /*IconButton(
                      icon: Icon(Icons.replay),
                      onPressed: () {
                        setState(() {
                          degistir();
                        });
                      },
                      highlightColor: Colors.red,
                    ),*/
                    Text(
                      hedef,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    //color: Colors.grey.shade700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // kaynak kısmı
                        //diğerlerinin üstünde tam oalrak gözükmesini sağlıyor
                        TextField(
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                          cursorRadius: Radius.circular(16),
                          maxLines: 10,
                          decoration: InputDecoration(
                              hintText: "Kaynak Dil",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              filled: true,
                              fillColor: Colors.grey.shade300),
                          onChanged: (String kaynakYazi) {
                            setState(() {
                              cevirilecekMetin = kaynakYazi;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // hedef kısmı
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: cevirilenMetin.length > 0
                                ? Colors.grey.shade300
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SelectableText(
                            cevirilenMetin,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
                        ),
                      ],
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
