import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:order_app/features/shops/data/models/sub_models.dart/markets_item_model.dart';

class ShopTable extends StatelessWidget {
  ShopTable({super.key, this.marketList});

  List<MarketsItemModel>? marketList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columnSpacing: 20,
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Location')),
              DataColumn(label: Text('Description')),
              DataColumn(label: Text('Image')),
              DataColumn(label: Text('Actions')),
            ],
            rows: List.generate(marketList!.length, (index) {
              final shop = marketList![index];
              return DataRow(
                cells: [
                  DataCell(Text(shop.marketItem.name)),
                  DataCell(Text(shop.marketItem.location )),
                  DataCell(
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(shop.marketItem.description),
                    ),
                  ),
                  DataCell(
                    shop.base64imgae != null
                        ? marketImage(shop)
                        : const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.visibility, color: Colors.green),
                          onPressed: () {
                            
                          },
                          tooltip: 'View Products',
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {

                          }
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
}

  Image marketImage(MarketsItemModel shop) {
    String? image = shop.base64imgae;
    Uint8List imageBytes = base64Decode(image!);
    return Image.memory(
      imageBytes,
      height: 50,
      width: 50,
      fit: BoxFit.cover,
    );
  }
}
