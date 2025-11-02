import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

class InvoicePage extends LayoutWidget {
  const InvoicePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement title
    return 'Factura';
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return CommonCard(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        // From section
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('De', style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Text('Roger Culhane',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text('Email: contact@example.com', style: TextStyle(fontSize: 12)),
            SizedBox(height: 6),
            Text('Address: 2972 Westheimer Rd. Santa Ana.',
                style: TextStyle(fontSize: 12)),
          ],
        ),
        const SizedBox(height: 16),
        // To section
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Para', style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Text('Cristofer Levin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text('Email: contact@example.com', style: TextStyle(fontSize: 12)),
            SizedBox(height: 6),
            Text('Address: New York, USA 2707 Davis Avenue',
                style: TextStyle(fontSize: 12)),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Pedido #15478',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        // Product
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: GlobalColors.border, width: 1)),
          child: Column(children: [
            Row(
              children: [
                Image.asset('assets/product/product-thumb.png',
                    width: 60, height: 60),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mist Black Triblend'),
                      Text('Color: Blanco  Tamaño: Mediano',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cant.: 01'),
                Text('\$120.00', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ]),
        ),
        const SizedBox(height: 16),
        // Shipping & Payment
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Método de envío',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('FedEx - Hasta 3', style: TextStyle(fontSize: 12)),
            Text('días laborables.', style: TextStyle(fontSize: 10)),
          ],
        ),
        const SizedBox(height: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Método de pago',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Apply Pay Mastercard', style: TextStyle(fontSize: 12)),
            SizedBox(height: 4),
            Text('**** **** **** 5874', style: TextStyle(fontSize: 10)),
          ],
        ),
        const SizedBox(height: 16),
        // Total
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal'),
                Text('\$120.00'),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Costo de envío'),
                Text('(+) \$10.00'),
              ],
            ),
            const SizedBox(height: 8),
            Container(height: 1, color: GlobalColors.border),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total a pagar',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$130.00',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Buttons
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ButtonWidget(
              btnText: 'Descargar factura',
              type: ButtonType.primary.type,
            ),
            const SizedBox(height: 8),
            ButtonWidget(
              btnText: 'Enviar factura',
              type: ButtonType.success.type,
            ),
          ],
        ),
      ]),
    ));
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return CommonCard(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'De',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Roger Culhane',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text('Email: contact@example.com',
                  style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 10,
              ),
              Text('Address: 2972 Westheimer Rd. Santa Ana.',
                  style: TextStyle(fontSize: 14))
            ]),
            SizedBox(
              width: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Para',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Cristofer Levin',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text('Email: contact@example.com',
                  style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 10,
              ),
              Text('Address: New York, USA 2707 Davis Anenue',
                  style: TextStyle(fontSize: 14))
            ]),
            Spacer(),
            Text(
              'Pedido #15478',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(color: GlobalColors.border, width: 1)),
          child: Row(children: [
            Image.asset(
              'assets/product/product-thumb.png',
              width: 80,
              height: 80,
            ),
            const SizedBox(
              width: 12,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mist Black Triblend'),
                Text(
                  'Color: Blanco  Tamaño: Mediano',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            const Spacer(),
            const Text('Cant.: 01'),
            const SizedBox(
              width: 20,
            ),
            const Text('\$120.00')
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Método de envío',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('FedEx - Hasta 3', style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 10,
              ),
              Text('días laborables.', style: TextStyle(fontSize: 10)),
            ]),
            const SizedBox(
              width: 20,
            ),
            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Método de pago',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Apply Pay Mastercard', style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 10,
              ),
              Text('**** **** **** 5874', style: TextStyle(fontSize: 10)),
            ]),
            const Spacer(),
            SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text('Subtotal'),
                      SizedBox(
                        width: 100,
                      ),
                      Expanded(child: Text('\$120.00',textAlign: TextAlign.end)),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      Text('Costo de envío '),
                      SizedBox(
                        width: 100,
                      ),
                      Expanded(child: Text('(+) \$10.00',textAlign: TextAlign.end)),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 1,
                    color: GlobalColors.border,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      Text('Total a pagar '),
                      Expanded(child: Text('\$130.00',textAlign: TextAlign.end,)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          const Spacer(),
          SizedBox(
            width: 150,
            child: ButtonWidget(
              btnText: 'Descargar factura',
              type: ButtonType.primary.type,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 150,
              child: ButtonWidget(
                btnText: 'Enviar factura',
                type: ButtonType.success.type,
              )),
        ])
      ]),
    ));
  }
}
