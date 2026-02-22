import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/supabase_service.dart';

class AuthProvider extends ChangeNotifier {
  final SupabaseClient client = Supabase.instance.client;
  User? user;

  User? get users => user;
  bool get isAuthenticated => user != null;

  Future<void> initialLoad() async {
    user = client.auth.currentUser;
    notifyListeners();
  }

  Future<String?> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String address,
  }) async {
    final service = SupabaseService();
    final result = await service.signUp(
      email: email,
      password: password,
      name: name,
      phone: phone,
      address: address,
    );

    user = client.auth.currentUser;
    notifyListeners();
    return result;
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    final service = SupabaseService();
    final result = await service.signIn(email: email, password: password);
    user = client.auth.currentUser;
    notifyListeners();
    return result;
  }

  Future<void> signOut() async {
    await SupabaseService().signOut();
    user = null;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> getProfile() async {
    if (user == null) return null;
    return await SupabaseService().getProfile(user!.id);
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String address,
  }) async {
    if (user == null) return;
    await SupabaseService().updateProfile(
      id: user!.id,
      name: name,
      email: email,
      phone: phone,
      address: address,
    );
  }
}
