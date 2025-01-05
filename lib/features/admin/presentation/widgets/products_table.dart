import 'package:flutter/material.dart';
import 'package:order_app/core/models/products_model.dart';

class ProductsTable extends StatelessWidget {
   ProductsTable({super.key,this.productsModel});

  ProductsModel ?productsModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Price')),
                DataColumn(label: Text('Description')),
                DataColumn(label: Text('Actions')),
                DataColumn(label: Text('Image')),
              ],
              rows: List.generate(productsModel!.marketModel.listOfProduct.listOfProduct.length, (index) {
              final product = productsModel?.marketModel.listOfProduct.listOfProduct[index];
              return DataRow(
                  cells: [
                    DataCell(Text(product!.name )),
                    DataCell(Text('\$${product.price.toStringAsFixed(2) }')),
                    DataCell(SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(product.descrption ),
                    )),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // Implement edit logic
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                          Image.asset(
                              "assets/images/shop3.jpg",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            )
                    ),
                  ],
                );}
              ).toList(),
            ),
          ),
        );
  }
}