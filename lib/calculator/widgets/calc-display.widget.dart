import 'package:flutter/material.dart';
import 'package:money_calc/_common/helpers/number.helper.dart';
import 'package:money_calc/_models/order-item.model.dart';
import 'package:provider/provider.dart';

class CalcDisplayWidget extends StatefulWidget {
  const CalcDisplayWidget({super.key});

  @override
  State<CalcDisplayWidget> createState() => _CalcDisplayWidgetState();
}

class _CalcDisplayWidgetState extends State<CalcDisplayWidget> {
  Row orderItemWidget({
    required OrderItemRepository orderItemRepository,
    required int index,
    required String name,
    required int price,
    required int quantity,
  }) {
    return Row(
      children: [
        // Container(
        //     decoration: BoxDecoration(
        //       image: const DecorationImage(
        //           image: NetworkImage('https://picsum.photos/200/300.jpg'),
        //           fit: BoxFit.cover),
        //       borderRadius: BorderRadius.circular(6.0),
        //     ),
        //     width: 50.0,
        //     height: 50.0,
        //     margin: const EdgeInsets.only(right: 7.0)),
        Expanded(
            child: Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        )),
        Container(
          // width: 98.0,
          margin: const EdgeInsets.only(left: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                NumberHelper.formatPrice(price),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  quantityChangeButton(
                      const Icon(Icons.indeterminate_check_box),
                      quantity == 1
                          ? null
                          : () => orderItemRepository.decreaseQuantity(index)),
                  SizedBox(
                      height: 20.0,
                      width: 35.0,
                      child: Center(
                          child: Text(
                        quantity.toString(),
                        style: TextStyle(
                          color: Colors.red.shade500,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ))),
                  quantityChangeButton(
                      const Icon(Icons.add_box),
                      quantity == 999
                          ? null
                          : () => orderItemRepository.increaseQuantity(index)),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  SizedBox quantityChangeButton(
      Icon icon, void Function()? quantityChangeButtonPressed) {
    return SizedBox(
      width: 20.0,
      height: 20.0,
      child: IconButton(
        iconSize: 20.0,
        padding: EdgeInsets.zero,
        onPressed: quantityChangeButtonPressed,
        icon: icon,
        style: IconButton.styleFrom(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 16.0,
            )
          ]),
      child: Consumer<OrderItemRepository>(
        builder: (context, orderItemRepository, child) {
          final orderItems = orderItemRepository.orderItems;

          return Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        final orderItem = orderItems[index];

                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: orderItemWidget(
                            orderItemRepository: orderItemRepository,
                            index: index,
                            name: orderItem.name,
                            price: orderItem.price,
                            quantity: orderItem.quantity,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: orderItems.length)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Tổng:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 0)),
                  Container(
                    alignment: Alignment.center,
                    width: 142.0,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                        NumberHelper.formatPrice(
                            orderItemRepository.totalPrice),
                        style: TextStyle(
                            color: Colors.orange.shade700,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            height: 0)),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
