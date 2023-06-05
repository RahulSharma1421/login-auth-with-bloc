import 'package:bloc/bloc.dart';
import 'package:loginauth/api/api_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repo;
  AuthBloc(this.repo) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        if (event.email.isEmpty || event.password.isEmpty) {
          emit(AuthErrorState());
        } else {
          emit(AuthLoadingState());
          await repo.login(event.email, event.password);
          emit(AuthLoadedState());
        }
      }
    });
  }
}
