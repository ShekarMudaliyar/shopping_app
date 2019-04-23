import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

payment() async {
  await InAppPayments.setSquareApplicationId('sq0idp-l3UOLMs1155khrVef7SJSA');
  await InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
      onCardEntryCancel: _onCancelCardEntryFlow);
}

void _onCancelCardEntryFlow() {}

void _onCardEntryCardNonceRequestSuccess(CardDetails result) async {
  try {
    print(result);
    InAppPayments.completeCardEntry(onCardEntryComplete: _onCardEntryComplete);
  } on Exception catch (ex) {
    InAppPayments.showCardNonceProcessingError(ex.toString());
  }
}

void _onCardEntryComplete() {}
