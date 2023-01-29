import 'dart:io';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../helpers/colorful_print.dart';
import '../main.dart';

class PurchaseHelper {
  static var shared = PurchaseHelper();
  var isPremium = false;

  Package? yearly;
  Package? monthly;

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
      isPremium = purchaserInfo.entitlements.all["premium"]?.isActive ?? false;
      mainVm.isPremium = isPremium;
      mainVm.unlockedGames = ObservableList.of(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
      );
    } catch (e) {
      ColorfulPrint.red('A457320 Check Is Premium: $e');
      //isPremium = GetStorage().read("isPremium") ?? false;
      mainVm.isPremium = isPremium;
    }
  }

  //* DONE
  Future<bool> purchase(Package packageToPurchase) async {
    ColorfulPrint.yellow('A457320 Purchase Clicked');
    try {
      var info = await Purchases.purchasePackage(packageToPurchase);
      isPremium = info.entitlements.all['premium']?.isActive ?? false;
      ColorfulPrint.green('A457320 Purchase Success');
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

  String get getMonthlyPriceForWeekly {
    return "";
    //* Direkt olarak get weekly price veriyor bu.
    try {
      //return PurchaseHelper.shared.weekly!.storeProduct.currencyCode +
      //    " " +
      //    PurchaseHelper.shared.weekly!.storeProduct.price.toStringAsFixed(2);
      //var price = PurchaseHelper.shared.weekly!.storeProduct.price;
      //price = price * 4;
      //price.toStringAsFixed(3);
      //var prefix = PurchaseHelper.shared.weekly!.storeProduct.priceString[0];

      //return prefix + price.toString();
    } catch (e) {
      return "";
    }
  }

  String get12MonthsMonthlyForMedium() {
    return "";
    try {
      //var month12Product = yearlyNormal!.storeProduct;
      //var prefix = yearlyNormal!.storeProduct.currencyCode;
      //return prefix + (month12Product.price / 12).toStringAsFixed(2);
    } catch (e) {
      return "";
    }
  }

  String get12MonthsWeeklyForMedium() {
    return "";
    try {
      //var month12Product = yearlyNormal!.storeProduct;
      //var prefix = yearlyNormal!.storeProduct.currencyCode;
      //return prefix + " " + (month12Product.price / 52).toStringAsFixed(2);
    } catch (e) {
      return "";
    }
  }

  String get12MonthsDiscountForMedium() {
    return "";
    try {
      //var month1Product = weekly?.storeProduct;
      //var month12Product = yearlyNormal?.storeProduct;
      //var priceWithoutDiscount = month1Product!.price * 52;
      //var priceWithDiscount = month12Product?.price;
      //var x = (priceWithDiscount! / priceWithoutDiscount) * 100;
      //var discountRate = 100 - x;
      //return discountRate.toStringAsFixed(2);
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
