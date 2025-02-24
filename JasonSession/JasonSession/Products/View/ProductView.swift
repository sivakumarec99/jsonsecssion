import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.products) { product in
                    HStack {
                        AsyncImage(url: URL(string: product.thumbnail ?? "")) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                        VStack(alignment: .leading) {
                            Text(product.title!)
                                .font(.headline)
                            Text("$\(product.price!, specifier: "%.2f")")
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Button(action: {
                            viewModel.updateProduct(id: product.id!, newTitle: "Updated \(product.title)")
                        }) {
                            Image(systemName: "pencil.circle")
                                .foregroundColor(.blue)
                        }

                        Button(action: {
                            viewModel.deleteProduct(id: product.id!)
                        }) {
                            Image(systemName: "trash.circle")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { addNewProduct() }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }

    func addNewProduct() {
        viewModel.createProduct(title: "New Product", description: "Sample Description", price: Double.random(in: 10...100))
    }
}
