import 'item_model.dart';

class Invoice {
  final String id;
  final String freddyNumber;
  final String invoiceNumber;
  final String country;
  final String company;
  final String clientId;
  final DateTime dateOfIssue;
  final DateTime dueDate;
  final String budget;
  final List<Item> items;
  final String notes;
  final double subTotal;
  final double tax;
  final double total;
  final double amountPaid;
  final double amountDue;

  Invoice({
    this.id,
    this.freddyNumber,
    this.invoiceNumber,
    this.country,
    this.company,
    this.clientId,
    this.dateOfIssue,
    this.dueDate,
    this.budget,
    this.items,
    this.notes,
    this.subTotal,
    this.tax,
    this.total,
    this.amountPaid,
    this.amountDue,
  });
}
