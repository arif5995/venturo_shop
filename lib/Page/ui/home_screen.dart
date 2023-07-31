import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:venturo_shop/Page/bloc/menus_cubit.dart';
import 'package:venturo_shop/utils/state/view_data_state.dart';
import 'package:venturo_shop/utils/widget/button_style.dart';
import 'package:venturo_shop/utils/widget/item_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        height: 230.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: HexColor("#F6F6F6"),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Total Pesanan (3 Menu) : ",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Rp. 23000",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: HexColor("#009AAD")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              "assets/images/voucher.png",
                              width: 22.w,
                              height: 17.h,
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Voucher",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Colors.white,
                                builder: (ctx){
                              return Wrap(
                                children: [
                                  Column(
                                    children: [

                                    ],
                                  ),
                                ],
                              );
                            });
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Input Voucher >",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 89.h,
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        "assets/images/basket.png",
                        width: 35.h,
                        height: 30.h,
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Text(
                            "Rp. 23000",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: HexColor("#009AAD")),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: 182.w,
                        height: 92.h,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: ButtonStyles.ButtonNotIcon(
                            backGroundColor: HexColor("#009AAD"),
                            foreGroundColor: Colors.grey,
                            label: "Pesan Sekarang",
                            onTap: (){}),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: BlocBuilder<MenusCubit, MenusState>(
        builder: (context, state) {
          final status = state.menuData.status;
          if (status.isHasData) {
            final data = state.menuData.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 38),
              child: ListView.builder(
                itemCount: data!.datas!.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = data.datas![index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: Card(
                        color: HexColor("#F6F6F6"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: 400.w,
                          height: 79.h,
                          padding: EdgeInsets.all(7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  "assets/images/Rectangle_7.png",
                                  width: 75.w,
                                  height: 75.h,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.nama ?? "",
                                      style: TextStyle(
                                          fontSize: 23.sp, color: Colors.black),
                                    ),
                                    Text(
                                      "Rp. " + item.harga.toString() ?? "",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: HexColor("#009AAD"),
                                      ),
                                    ),
                                    Text(
                                      "Tambah catatan",
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      iconSize: 20,
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: HexColor("#009AAD"),
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text("2"),
                                    IconButton(
                                      iconSize: 20,
                                      icon: Icon(
                                        Icons.add_box_outlined,
                                        color: HexColor("#009AAD"),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                },
              ),
            );
          }
          return Container(
            color: Colors.white,
          );
        },
      ),
    );
  }
}
