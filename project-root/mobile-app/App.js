import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, FlatList, ActivityIndicator, Alert, Platform } from 'react-native';
import { useState, useEffect } from 'react';

export default function App() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchProducts();
  }, []);

  const fetchProducts = async () => {
    try {
      // Използваме различни URL-и в зависимост от платформата
      const baseUrl = Platform.OS === 'web' || Platform.OS === 'ios' 
        ? 'http://localhost:8000' 
        : 'http://192.168.0.204:8000';
      
      console.log('Platform:', Platform.OS);
      console.log('Fetching from:', `${baseUrl}/api/products`);
      
      const response = await fetch(`${baseUrl}/api/products`, {
        method: 'GET',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Origin': 'http://localhost:3000',
        },
      });
      
      console.log('Response status:', response.status);
      console.log('Response headers:', response.headers);
      
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      
      const data = await response.json();
      console.log('Data received:', data);
      // Извличаме products масива от response-а
      setProducts(data.products || []);
    } catch (error) {
      console.error('Грешка при зареждане на продуктите:', error);
      console.error('Error details:', error.message);
      
      // Не зареждаме нищо ако backend-ът не работи
      setProducts([]);
      
      Alert.alert('Грешка', 'Не можаха да се заредят продуктите от сървъра');
    } finally {
      setLoading(false);
    }
  };

  const renderProduct = ({ item }) => (
    <View style={styles.productCard}>
      <Text style={styles.productName}>{item.name}</Text>
      <Text style={styles.productPrice}>{item.price} лв.</Text>
      <Text style={styles.productId}>ID: {item.id}</Text>
    </View>
  );

  if (loading) {
    return (
      <View style={styles.centerContainer}>
        <ActivityIndicator size="large" color="#0066cc" />
        <Text style={styles.loadingText}>Зареждане на продукти...</Text>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Продукти</Text>
      {products.length === 0 ? (
        <View style={styles.centerContainer}>
          <Text style={styles.noProductsText}>Няма налични продукти</Text>
        </View>
      ) : (
        <FlatList
          data={products}
          keyExtractor={(item) => item.id.toString()}
          renderItem={renderProduct}
          style={styles.productList}
          showsVerticalScrollIndicator={false}
        />
      )}
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    paddingTop: 50,
  },
  centerContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 20,
    color: '#333',
  },
  productList: {
    paddingHorizontal: 20,
  },
  productCard: {
    backgroundColor: '#fff',
    padding: 15,
    marginBottom: 10,
    borderRadius: 8,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.1,
    shadowRadius: 3.84,
    elevation: 5,
  },
  productName: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 5,
  },
  productPrice: {
    fontSize: 16,
    color: '#0066cc',
    fontWeight: '600',
    marginBottom: 5,
  },
  productDescription: {
    fontSize: 14,
    color: '#666',
    marginBottom: 5,
    lineHeight: 20,
  },
  productId: {
    fontSize: 12,
    color: '#999',
  },
  loadingText: {
    marginTop: 10,
    fontSize: 16,
    color: '#666',
  },
  noProductsText: {
    fontSize: 18,
    color: '#999',
    textAlign: 'center',
  },
});
