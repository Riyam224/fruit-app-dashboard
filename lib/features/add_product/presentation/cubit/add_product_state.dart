// class AddProductState {
// 	final bool isLoading;
// 	final String? error;

// 	const AddProductState({
// 		this.isLoading = false,
// 		this.error,
// 	});

// 	AddProductState copyWith({
// 		bool? isLoading,
// 		String? error,
// 	}) {
// 		return AddProductState(
// 			isLoading: isLoading ?? this.isLoading,
// 			error: error ?? this.error,
// 		);
// 	}
// }
import 'package:flutter/cupertino.dart';

@immutable
sealed class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductError extends AddProductState {
  final String errorMessage;
  AddProductError(this.errorMessage);
}

class AddProductSuccess extends AddProductState {}
