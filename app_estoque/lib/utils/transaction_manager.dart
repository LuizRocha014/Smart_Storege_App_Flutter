import 'dart:async';
import 'package:collection/collection.dart';

class TransactionManager {
  final PriorityQueue<_TransactionWrapper> _transactionQueue =
      PriorityQueue<_TransactionWrapper>((a, b) => a.priority.compareTo(b.priority));
  bool _isTransactionRunning = false;

  Future<T> runTransaction<T>(Future<T> Function() action, {int priority = 0}) async {
    final completer = Completer<T>();
    _transactionQueue.add(_TransactionWrapper(action, priority, completer));

    if (!_isTransactionRunning) {
      await _processTransactionQueue();
    }

    return completer.future;
  }

  Future<void> _processTransactionQueue() async {
    _isTransactionRunning = true;

    while (_transactionQueue.isNotEmpty) {
      final transactionWrapper = _transactionQueue.removeFirst();
      final transaction = transactionWrapper.action;
      final completer = transactionWrapper.completer;

      try {
        final result = await transaction();
        completer.complete(result);
      } catch (e) {
        completer.completeError(e);
      }
    }

    _isTransactionRunning = false;
  }
}

class _TransactionWrapper<T> {
  final Future<T> Function() action;
  final int priority;
  final Completer<T> completer;

  _TransactionWrapper(this.action, this.priority, this.completer);
}
