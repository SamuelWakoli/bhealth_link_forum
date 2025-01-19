import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactFormProvider =
    StateNotifierProvider<ContactFormController, ContactFormState>((ref) {
  return ContactFormController();
});

class ContactFormState {
  final String name;
  final String email;
  final String subject;
  final String message;
  final bool isLoading;
  final String? error;

  ContactFormState({
    this.name = '',
    this.email = '',
    this.subject = '',
    this.message = '',
    this.isLoading = false,
    this.error,
  });

  ContactFormState copyWith({
    String? name,
    String? email,
    String? subject,
    String? message,
    bool? isLoading,
    String? error,
  }) {
    return ContactFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class ContactFormController extends StateNotifier<ContactFormState> {
  ContactFormController() : super(ContactFormState());

  void updateName(String value) => state = state.copyWith(name: value);
  void updateEmail(String value) => state = state.copyWith(email: value);
  void updateSubject(String value) => state = state.copyWith(subject: value);
  void updateMessage(String value) => state = state.copyWith(message: value);

  Future<void> submitForm() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // TODO: Implement form submission logic (e.g., sending email or saving to database)
      await Future.delayed(const Duration(seconds: 2)); // Simulated delay
      state = ContactFormState(); // Reset form
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
