import 'package:equatable/equatable.dart';

class ClientModel extends Equatable {
  final String? name;
  final String? id;
  final String? company;
  final String? orderId;
  final String? invoicepaid;
  final String? invoicePending;
  const ClientModel({
    this.name,
    this.id,
    this.company,
    this.orderId,
    this.invoicepaid,
    this.invoicePending,
  });

  ClientModel copyWith({
    String? name,
    String? id,
    String? company,
    String? orderId,
    String? invoicepaid,
    String? invoicePending,
  }) {
    return ClientModel(
      name: name ?? this.name,
      id: id ?? this.id,
      company: company ?? this.company,
      orderId: orderId ?? this.orderId,
      invoicepaid: invoicepaid ?? this.invoicepaid,
      invoicePending: invoicePending ?? this.invoicePending,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'company': company,
      'orderId': orderId,
      'invoicepaid': invoicepaid,
      'invoicePending': invoicePending,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      name: map['name'],
      id: map['id'],
      company: map['company'],
      orderId: map['orderId'],
      invoicepaid: map['invoicepaid'],
      invoicePending: map['invoicePending'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        id,
        company,
        orderId,
        invoicepaid,
        invoicePending,
      ];
}
