import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order2/model/product.dart';
import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatefulWidget {

  final Product product;
  final int qty;

  const CustomDialog({Key key,@required this.product,@required this.qty}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {

  int counter;
  double price;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.qty;
  }

  @override
  Widget build(BuildContext context) {

    var store = Provider.of<ProductProvider>(context);
    final size =  MediaQuery.of(context).size;
    return Dialog(
      child:  new Container(
          decoration: BoxDecoration(
              border:Border.all(
                  color: Colors.amber,
                  width: 2
              )
          ),
          alignment: FractionalOffset.center,
          height: MediaQuery.of(context).size.height*0.5 ,
          child: new Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child: Text(
                          'لورم ایپسوم یا طرح‌نما (به انگلیسی: Lorem ipsum) به متنی آزمایشی و بی‌معنی در صنعت چاپ، صفحه‌آرایی و طراحی گرافیک گفته می‌شود. طراح گرافیک از این متن به عنوان عنصری از ترکیب بندی برای پر کردن صفحه و ارایه اولیه شکل ظاهری و کلی طرح سفارش گرفته شده استفاده می نماید، تا از نظر گرافیکی نشانگر چگونگی نوع و اندازه فونت و ظاهر متن باشد. معمولا طراحان گرافیک برای صفحه‌آرایی، نخست از متن‌های آزمایشی و بی‌معنی استفاده می‌کنند تا صرفا به مشتری یا صاحب کار خود نشان دهند که صفحه طراحی یا صفحه بندی شده بعد از اینکه متن در آن قرار گیرد چگونه به نظر می‌رسد و قلم‌ها و اندازه‌بندی‌ها چگونه در نظر گرفته شده‌است. از آنجایی که طراحان عموما نویسنده متن نیستند و وظیفه رعایت حق تکثیر متون را ندارند و در همان حال کار آنها به نوعی وابسته به متن می‌باشد آنها با استفاده از محتویات ساختگی، صفحه گرافیکی خود را صفحه‌آرایی می‌کنند تا مرحله طراحی و صفحه‌بندی را به پایان برند.',
                          textAlign: TextAlign.justify,
                        ),
                      )
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0,-5),
                            color: Colors.black12
                        )
                      ]
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('مبلغ کل : ${counter*store.activeProduct.price} تومان',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _button(FontAwesomeIcons.minus,(){
                              setState(() {
                                if(counter>1) {
                                  counter--;
                                }
                              });
                            },),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:10),
                              child: Text(counter.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            _button(FontAwesomeIcons.plus,(){
                              setState(() {
                                counter = counter+1;
                              });
                            },)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    store.addManyToBasket(widget.product, counter);
                    Navigator.pop(context);
                  },
                  child: Text('افزودن به کارت'),
                  color: Colors.red,
                  textColor: Colors.white,
                )
              ],
            ),
          )
      ),
    );
  }

  GestureDetector _button(icon,onTap) {
    return GestureDetector(
      onTap:(){ onTap();},
      child: CircleAvatar(
        child: Icon(icon,size: 12,),
        backgroundColor: Colors.black12.withOpacity(0.07),
        foregroundColor: Colors.black54,
        radius: 10,
      ),
    );
  }
}

