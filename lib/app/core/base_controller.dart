import 'dart:async';


import 'package:flutter_component_library/app/core/model/page_state.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


import '/flavors/build_config.dart';

/**
 * 封装基础控制器
 * 1、日志
 * 2、国际化
 * 3、刷新页面
 * 4、页面状态管理
 * 5、加载提示
 * 6、显示消息框
 */
abstract class BaseController extends GetxController {
  //获取logger单例
  final Logger logger = BuildConfig.instance.config.logger;



  final logoutController = false.obs;

  //Reload the page
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  final _messageController = ''.obs;

  String get message => _messageController.value;

  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  showErrorMessage(String msg) {
    _errorMessageController("");
    _errorMessageController(msg);
  }

  final _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  showSuccessMessage(String msg) => _successMessageController(msg);

  /**
   * 一个通用的数据服务调用函数 callDataService，
   * 它接受一个异步操作 future，
   * 并提供了一些回调函数来处理成功、失败和完成时的事件。
   */
  // ignore: long-parameter-list
  // dynamic callDataService<T>(
  //   Future<T> future, {
  //   Function(Exception exception)? onError,
  //   Function(T response)? onSuccess,
  //   Function? onStart,
  //   Function? onComplete,
  // }) async {
  //   Exception? _exception;

  //   onStart == null ? showLoading() : onStart();

  //   try {
  //     final T response = await future;

  //     if (onSuccess != null) onSuccess(response);

  //     onComplete == null ? hideLoading() : onComplete();

  //     return response;
  //   } // 按照不同的异常类型进行捕获和处理
  //     on ServiceUnavailableException catch (exception) {
  //     _exception = exception;
  //     showErrorMessage(exception.message);
  //   } on UnauthorizedException catch (exception) {
  //     _exception = exception;
  //     showErrorMessage(exception.message);
  //   } on TimeoutException catch (exception) {
  //     _exception = exception;
  //     showErrorMessage(exception.message ?? 'Timeout exception');
  //   } on NetworkException catch (exception) {
  //     _exception = exception;
  //     showErrorMessage(exception.message);
  //   } on JsonFormatException catch (exception) {
  //     _exception = exception;
  //     showErrorMessage(exception.message);
  //   } on NotFoundException catch (exception) {
  //     _exception = exception;
  //     showErrorMessage(exception.message);
  //   } on ApiException catch (exception) {
  //     _exception = exception;
  //   } on AppException catch (exception) {
  //     _exception = exception;
  //     showErrorMessage(exception.message);
  //   } catch (error) {
  //     _exception = AppException(message: "$error");
  //     logger.e("Controller>>>>>> error $error");
  //   }

  //   if (onError != null) onError(_exception);

  //   onComplete == null ? hideLoading() : onComplete();
  // }

  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }
}
