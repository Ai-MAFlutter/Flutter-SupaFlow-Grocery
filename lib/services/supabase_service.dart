import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product.dart';

class SupabaseService {
  final SupabaseClient client = Supabase.instance.client;
  Future<String?> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String address,
  }) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user != null) {
        await client.from('profiles').insert({
          'id': user.id,
          'email': email,
          'name': name,
          'phone': phone,
          'address': address,
        });
        return null;
      }
      return 'Account creation failed';
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) return null;
      return 'Account creation failed';
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
  Future<void> signOut() async {
    await client.auth.signOut();
  }
  Future<Map<String, dynamic>?> getProfile(String id) async {
    try {
      final response = await client
          .from('profiles')
          .select()
          .eq('id', id)
          .maybeSingle();

      return response as Map<String, dynamic>?;
    } catch (e) {
      print('Error fetching profile: $e');
      return null;
    }
  }
  Future<void> updateProfile({
    required String id,
    required String name,
    required String email,
    required String phone,
    required String address,
  }) async {
    try {
      await client.from('profiles').upsert({
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
      });
      print('Profile updated successfully');
    } catch (e) {
      print('Error updating profile: $e');
    }
  }
}
