class Invoice {
  final String id;
  final String country;
  final String company;
  final String client;
  final DateTime dateOfIssue;
  final DateTime dueDate;
  final String budget;
  final List<String> items;
  final String notes;
  final double subTotal;
  final double tax;
  final double total;
  final double amountPaid;
  final double amountDue;

  Invoice({
    this.id,
    this.country,
    this.company,
    this.client,
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
