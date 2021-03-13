import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaxCalc extends StatefulWidget {
  @override
  _TaxCalcState createState() => _TaxCalcState();
}

class _TaxCalcState extends State<TaxCalc> {
  FocusNode myFocusNode;
  FocusNode myFocusNode1;

  final inputAmount = TextEditingController();
  final inputAmount2 = TextEditingController();

  String _valueofsupplyResult = "";
  String _taxamountResult = "";

  String _valueofsupplyResult1 = "";
  String _taxamountResult1 = "";

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode1 = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myFocusNode1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "부가세로 계산하기",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "합계금액으로 계산하기",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: Rcard(
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "합계금액(Total amount)",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: 160,
                                  child: TextField(
                                    controller: inputAmount,
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.number,
                                    focusNode: myFocusNode,
                                  ),
                                ),
                                Text(
                                  "  원",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                        child: Rcard(
                          cardChild: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (inputAmount.text.length > 0) {
                                    _totalCalc();
                                  } else {
                                    myFocusNode.requestFocus();
                                  }
                                },
                                child: Text("계산하기"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  clearAll();
                                  myFocusNode.requestFocus();
                                },
                                child: Text("다시하기"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Rcard(
                          cardChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "공급가액(Value of supply)",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 160,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      _valueofsupplyResult,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "  원",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Rcard(
                          cardChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  "세액(Tax amount)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 160,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      _taxamountResult,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "  원",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(
                    height: 1,
                    color: Colors.red,
                    thickness: 2,
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "공급가액 계산하기",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: Rcard(
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "공금가액(Value of supply)",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: 160,
                                  child: TextField(
                                    controller: inputAmount2,
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.number,
                                    focusNode: myFocusNode1,
                                  ),
                                ),
                                Text(
                                  "  원",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                        child: Rcard(
                          cardChild: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (inputAmount2.text.length > 0) {
                                    _totalCalc1();
                                  } else {
                                    myFocusNode1.requestFocus();
                                  }
                                },
                                child: Text("계산하기"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  clearAll1();
                                  myFocusNode1.requestFocus();
                                },
                                child: Text("다시하기"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Rcard(
                          cardChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "합계금액(Total amount)",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 160,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      _valueofsupplyResult1,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "  원",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Rcard(
                          cardChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  "세액(Tax amount)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 160,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      _taxamountResult1,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "  원",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void clearAll() {
    setState(() {
      inputAmount.clear();
      _taxamountResult = "";
      _valueofsupplyResult = "";
    });
  }

  void _totalCalc() {
    double totalResult = 0.0;
    double taxAmount = 0.0;
    double usermoney = double.parse(inputAmount.text);

    if (inputAmount.text.length == 0) {
      return;
    }

    totalResult = usermoney / 1.1;
    taxAmount = usermoney - (usermoney / 1.1);

    NumberFormat format = NumberFormat('#,###,###');
    setState(() {
      _valueofsupplyResult = format.format(totalResult);
      _taxamountResult = format.format(taxAmount);
    });

    //clicked dismiss the keyboard
    FocusScope.of(context).unfocus();
  }

  void clearAll1() {
    setState(() {
      inputAmount2.clear();
      _taxamountResult1 = "";
      _valueofsupplyResult1 = "";
    });
  }

  void _totalCalc1() {
    double totalResult1 = 0.0;
    double taxAmount1 = 0.0;
    double usermoney1 = double.parse(inputAmount2.text);

    if (inputAmount2.text.length == 0) {
      return;
    }

    totalResult1 = usermoney1 * 1.1;
    taxAmount1 = totalResult1 - usermoney1;

    NumberFormat format = NumberFormat('#,###,###');
    setState(() {
      _valueofsupplyResult1 = format.format(totalResult1);
      _taxamountResult1 = format.format(taxAmount1);
    });

    //clicked dismiss the keyboard
    FocusScope.of(context).unfocus();
  }
}

class Rcard extends StatelessWidget {
  final Widget cardChild;
  final Color colour;
  Size size;

  Rcard({this.cardChild, this.colour, this.size});

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 4,
      height: size.width / 4,
      child: cardChild,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
