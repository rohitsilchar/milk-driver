import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water/API/get_notification_api.dart';
import 'package:water/API/get_order_api.dart';
import 'package:water/main.dart';
import 'package:water/model/setting_data.dart';
import 'package:water/screen/home_screen/controller/home_controller.dart';
import 'package:water/screen/home_screen/home_screen.dart';
import 'package:water/screen/home_screen/order_screen/widget/order_tile.dart';
import 'package:water/screen/home_screen/qr_code_screen.dart';
import 'package:water/screen/notification_screen/nofication.dart';
import 'package:water/utils/anim_util.dart';
import 'package:water/utils/color_utils.dart';
import 'package:water/utils/fonstyle.dart';
import 'package:water/utils/icon_util.dart';
import 'package:water/utils/whitespaceutils.dart';
import 'package:water/utils/widgets/stackedscaffold.dart';
import '../../../utils/app_state.dart';
import '../../../utils/uttil_helper.dart';

class OrderList extends StatefulWidget {
  final bool orderHistory;

  const OrderList({Key? key, required this.orderHistory}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  HomeController homeController = Get.put(HomeController());

  ScrollController? controller;

  @override
  void initState() {
    controller = ScrollController()..addListener(_scrollListener);
    super.initState();
    UtilsHelper.loadLocalization(appState.currentLanguageCode.value);
  }

  void _scrollListener() {
    if (controller!.position.extentAfter < 100) {
      if (homeController.isPaging.isTrue) {
        homeController.isPaging.value = false;
        getOrderApi(url: homeController.nextUrl.value, orderHistory: false);
      }
    }
  }

  @override
  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StackedScaffold(
      stackedEntries: const [],
      tittle: widget.orderHistory
          ? "${UtilsHelper.getString(context, 'Order')} ${UtilsHelper.getString(context, 'History')}"
          : UtilsHelper.getString(context, 'your_orders'),
      actionIcon: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            iconSize: 28,
            onPressed: () {
              Get.to(() => const QrCodeScreen());
            },
            color: dark(context) ? Colors.white : ColorUtils.kcSecondary,
          ),
          Stack(
            children: [
              Transform.scale(
                scale: .8,
                child: CustomIconButton(
                  path: IconUtil.bell,
                  color: dark(context) ? Colors.white : ColorUtils.kcSecondary,
                  onTap: () {
                    getNotificationApi(url: "");
                    Get.to(() => const NotificationScreen());
                  },
                ),
              ),
              Obx(
                () => authController.notificationCount.value.toString() == "0"
                    ? const SizedBox()
                    : Positioned(
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Text(
                            authController.notificationCount.value.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ],
      ),
      body: Obx(
        () => homeController.orderLoading.isTrue
            ? const Padding(
                padding: EdgeInsets.only(top: 75),
                child: Center(
                    child: CircularProgressIndicator(
                  color: ColorUtils.kcPrimary,
                )))
            // ignore: prefer_is_empty
            : homeController.orderList.length > 0
                ? ValueListenableBuilder<SettingData>(
                    valueListenable: appState.setting,
                    builder: (context, sets, child) {
                      return SingleChildScrollView(
                        controller: controller,
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SpaceUtils.ks100.height(),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: homeController.orderList.length,
                                itemBuilder: (context, i) {
                                  if (widget.orderHistory
                                      ? homeController
                                              .orderList[i]
                                              .productOrders![0]
                                              .deliveryStatus![0]
                                              .deliveryStatus!
                                              .status!
                                              .toString() ==
                                          "Shipped"
                                      : homeController
                                              .orderList[i]
                                              .productOrders![0]
                                              .deliveryStatus![0]
                                              .deliveryStatus!
                                              .status!
                                              .toString() ==
                                          "Pending") {
                                    return OrderTile(
                                      orderData: homeController.orderList[i],
                                      currency: sets.setting != null
                                          ? sets.setting!.defaultCurrencyCode
                                          : "\$",
                                      orderHistory: widget.orderHistory,
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                            Obx(() => homeController.paginationLoading.isTrue
                                ? const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.only(bottom: 12),
                                        child: CircularProgressIndicator(
                                          color: ColorUtils.kcPrimary,
                                        )),
                                  )
                                : const SizedBox()),
                            SpaceUtils.ks50.height(),
                          ],
                        ),
                      );
                    })
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        "Orders not found",
                        style: FontStyleUtilities.h4(fontWeight: FWT.medium),
                      ),
                    ),
                  ),
      ),
    );
  }
}
