import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    private let baseURL = "https://dummyjson.com/products"

    // Fetch Products
    func fetchProducts() {
        guard let url = URL(string: baseURL) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decodedData = try JSONDecoder().decode(ProductResponse.self, from: data)
                        self.products = decodedData.products!
                    } catch {
                        print("Decoding error:", error)
                    }
                }
            }
        }.resume()
    }

    // Create Product
    func createProduct(title: String, description: String, price: Double) {
        guard let url = URL(string: "\(baseURL)/add") else { return }

        let newProduct = ["title": title, "description": description, "price": price] as [String : Any]
        let jsonData = try? JSONSerialization.data(withJSONObject: newProduct)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let createdProduct = try JSONDecoder().decode(Product.self, from: data)
                        self.products.append(createdProduct)
                    } catch {
                        print("Error creating product:", error)
                    }
                }
            }
        }.resume()
    }

    // Update Product
    func updateProduct(id: Int, newTitle: String) {
        guard let url = URL(string: "\(baseURL)/\(id)") else { return }

        let updatedData = ["title": newTitle]
        let jsonData = try? JSONSerialization.data(withJSONObject: updatedData)

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let updatedProduct = try JSONDecoder().decode(Product.self, from: data)
                        if let index = self.products.firstIndex(where: { $0.id == id }) {
                            self.products[index] = updatedProduct
                        }
                    } catch {
                        print("Error updating product:", error)
                    }
                }
            }
        }.resume()
    }

    // Delete Product
    func deleteProduct(id: Int) {
        guard let url = URL(string: "\(baseURL)/\(id)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { _, _, _ in
            DispatchQueue.main.async {
                self.products.removeAll { $0.id == id }
            }
        }.resume()
    }
}
