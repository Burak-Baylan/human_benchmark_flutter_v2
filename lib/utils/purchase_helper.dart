import 'dart:io';
import 'package:flutter/services.dart';
import 'package:human_benchmark_flutter_v2/core/hive/hive_constants.dart';
import 'package:human_benchmark_flutter_v2/core/hive/hive_helper.dart';
import 'package:mobx/mobx.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../helpers/colorful_print.dart';
import '../main.dart';

class PurchaseHelper {
  static var shared = PurchaseHelper();
  var isPremium = false;

  Package? yearly;
  Package? monthly;
  Package? weekly;
  Package? weeklyHigh;

  //*DONE
  Future<void> initPurchase() async {
    try {
      await Purchases.setDebugLogsEnabled(true);
      await Purchases.configure(
          PurchasesConfiguration("goog_mGHoXiwvCPsgonNjbVVerAWfjCk"));
      await checkIsPremium();
      ColorfulPrint.green('A457320 Load Success Init purchase');
    } catch (e) {
      //getit.get<PaywallViewModel>().isLoading = false;
      ColorfulPrint.red('A457320 Init purchase: $e');
    }
  }

//* DONE
  Future<void> loadProducts() async {
    try {
      var offerings = await Purchases.getOfferings();
      yearly = offerings.all["default"]?.annual;
      monthly = offerings.all["default"]?.monthly;
      weekly = offerings.all["default"]?.weekly;
      weeklyHigh = offerings.all["High"]?.weekly;
      print('A593023 weekly: ${weekly?.storeProduct.priceString}');
      print('A593023 weeklyHigh: ${weeklyHigh?.storeProduct.priceString}');
      print('A593023 monthly: ${monthly?.storeProduct.priceString}');
      print('A593023 yearly: ${yearly?.storeProduct.priceString}');
      ColorfulPrint.green('A457320 Load Success load products');
      var monthlyPrice = monthly?.storeProduct.price;
      var yearlyPrice = yearly?.storeProduct.price;
      ColorfulPrint.green(
          'A457320 Monthly: $monthlyPrice | Yearly: $yearlyPrice');
      //getit<PaywallViewModel>().isLoading = true;
      //getit<PaywallViewModel>().isLoading = false;
    } catch (e) {
      ColorfulPrint.red('A457320 Load products: $e');
    }
  }

  //* DONE
  Future<void> checkIsPremium() async {
    try {
      var purchaserInfo = await Purchases.getCustomerInfo();
      var isPremiumHere =
          purchaserInfo.entitlements.all['premium']?.isActive ?? false;
      print('A4573202 IS PREMIUM HERE: $isPremiumHere');
      isPremium = isPremiumHere;
      sdadas(purchaserInfo);
      mainVm.isPremium = isPremiumHere;
      await HiveHelper.instance.putData(HiveConstants.BOX_APP_PREFERENCES,
          HiveConstants.isPremium, isPremium);
      mainVm.unlockedGames = ObservableList.of(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
      );
      if (!isPremium) {
        mainVm.unlockedGames = ObservableList<int>.of([0, 1, 2, 3]);
      }
      ColorfulPrint.red('A4573202 Is Premium: $isPremium');
    } catch (e) {
      ColorfulPrint.red('A4573202 Check Is Premium: $e');
      isPremium = await HiveHelper.instance.getData<bool>(
            HiveConstants.BOX_APP_PREFERENCES,
            HiveConstants.isPremium,
            defaultValue: false,
          ) ??
          false;
      mainVm.isPremium = isPremium;
    }
  }

  bool sdadas(CustomerInfo info) {
    EntitlementInfo? zart = info.entitlements.all['premium'];
    if (zart != null) {
      ColorfulPrint.red('A4573202 Premium is not null | ${zart.isActive}');
      return zart.isActive;
    } else {
      ColorfulPrint.red('A4573202 Check Is null');
      return false;
    }
  }

  //* DONE
  Future<bool> purchase(Package packageToPurchase) async {
    ColorfulPrint.yellow('A457320 Purchase Clicked');
    try { 
      var info = await Purchases.purchasePackage(packageToPurchase);
      isPremium = info.entitlements.all['premium']?.isActive ?? false;
      ColorfulPrint.green('A457320 Purchase Success | $isPremium');
      mainVm.isPremium = isPremium;
      return isPremium;
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      ColorfulPrint.red('A457320 Purchase Error $e');
      print(errorCode);
      print(e);
      return false;
    }
  }

  String get getYearlyHighPriceString {
    return "";
    try {
      //return yearlyHigh!.storeProduct.priceString;
    } catch (e) {
      return "";
    }
  }

  //* DONE
  Future<bool> restorePurchase() async {
    try {
      CustomerInfo restoredInfo = await Purchases.restorePurchases();
      isPremium = restoredInfo.entitlements.all['premium']?.isActive ?? false;
      //mainVm.isPremium = isPremium;
      return restoredInfo.entitlements.all['premium']?.isActive ?? false;
    } on PlatformException catch (e) {
      print(e);
      isPremium = false;
      //mainVm.isPremium = isPremium;
      return false;
    }
  }

  String get getWeeklyPriceForYearly {
    try {
      String currencyCode =
          PurchaseHelper.shared.yearly!.storeProduct.currencyCode;

      double priceDouble =
          PurchaseHelper.shared.yearly!.storeProduct.price / 52;

      String price = priceDouble.toStringAsFixed(2);

      return "$currencyCode $price";
    } catch (e) {
      return "";
    }
  }

  String get getYearlyPrice {
    try {
      String currencyCode =
          PurchaseHelper.shared.yearly!.storeProduct.currencyCode;
      String priceStr =
          PurchaseHelper.shared.yearly!.storeProduct.price.toStringAsFixed(2);
      return "$currencyCode $priceStr";
    } catch (e) {
      return "";
    }
  }

  String get getWeeklyHighPrice {
    try {
      String currencyCode =
          PurchaseHelper.shared.weeklyHigh!.storeProduct.currencyCode;
      String priceStr = PurchaseHelper.shared.weeklyHigh!.storeProduct.price
          .toStringAsFixed(2);
      ColorfulPrint.green('A860743 success');
      return "$currencyCode $priceStr";
    } catch (e) {
      ColorfulPrint.red('A860743 error $e');
      return "";
    }
  }

  String get getWeeklyPrice {
    try {
      String currencyCode =
          PurchaseHelper.shared.weekly!.storeProduct.currencyCode;
      String priceStr =
          PurchaseHelper.shared.weekly!.storeProduct.price.toStringAsFixed(2);
      return "$currencyCode $priceStr";
    } catch (e) {
      return "";
    }
  }

  String get get12MonthsDiscountForYearly {
    try {
      //ar month1Product = weekly?.storeProduct;
      var month12Product = yearly?.storeProduct;
      var priceWithoutDiscount = 65.99 * 52;
      var priceWithDiscount = month12Product?.price;
      var x = (priceWithDiscount! / priceWithoutDiscount) * 100;
      var discountRate = 100 - x;
      return discountRate.toStringAsFixed(2);
    } catch (e) {
      return "";
    }
  }

  //* May be used later
  void addPurchaseInfoListener() {
    Purchases.addCustomerInfoUpdateListener((purchaserInfo) {
      isPremium = purchaserInfo.entitlements.all["pro"]?.isActive ?? false;
      //mainVm.isPremium = isPremium;
    });
  }
}
