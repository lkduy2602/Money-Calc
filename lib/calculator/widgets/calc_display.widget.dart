import 'package:flutter/material.dart';
import 'package:money_calc/_common/enums/order_item.enum.dart';
import 'package:money_calc/_common/helpers/number.helper.dart';
import 'package:money_calc/_common/providers/order_item.providers.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CalcDisplayWidget extends StatefulWidget {
  const CalcDisplayWidget({super.key});

  @override
  State<CalcDisplayWidget> createState() => _CalcDisplayWidgetState();
}

class _CalcDisplayWidgetState extends State<CalcDisplayWidget> {
  final AutoScrollController _scrollController = AutoScrollController();

  Row orderItemWidget({
    required OrderItemProvider orderItemProvider,
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
              Container(
                  decoration: orderItemProvider.currentIndex == index &&
                          orderItemProvider.selectedField == OrderItemSelectedFieldEnum.price
                      ? BoxDecoration(
                          border: Border.all(
                          color: Colors.orange.shade600,
                          width: 1.0,
                        ))
                      : null,
                  child: Text(
                    NumberHelper.formatPrice(price),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  quantityChangeButton(const Icon(Icons.indeterminate_check_box),
                      quantity == 1 ? null : () => orderItemProvider.decreaseQuantity(index)),
                  Container(
                      decoration: orderItemProvider.currentIndex == index &&
                              orderItemProvider.selectedField == OrderItemSelectedFieldEnum.quantity
                          ? BoxDecoration(
                              border: Border.all(
                              color: Colors.orange.shade600,
                              width: 1.0,
                            ))
                          : null,
                      width: 38.0,
                      height: 20.0,
                      child: Center(
                          child: Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 0,
                        ),
                        textAlign: TextAlign.center,
                      ))),
                  quantityChangeButton(const Icon(Icons.add_box),
                      quantity == 999 ? null : () => orderItemProvider.increaseQuantity(index)),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  SizedBox quantityChangeButton(Icon icon, void Function()? quantityChangeButtonPressed) {
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
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0), boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 16.0,
        )
      ]),
      child: Consumer<OrderItemProvider>(
        builder: (context, orderItemProvider, child) {
          final orderItems = orderItemProvider.orderItems;

          if (orderItemProvider.currentIndex != 0) {
            _scrollController.scrollToIndex(orderItemProvider.currentIndex);
          }

          return Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        final orderItem = orderItems[index];

                        return AutoScrollTag(
                          key: ValueKey(index),
                          controller: _scrollController,
                          index: index,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: orderItemWidget(
                              orderItemProvider: orderItemProvider,
                              index: index,
                              name: orderItem.name,
                              price: orderItem.price,
                              quantity: orderItem.quantity,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemCount: orderItems.length)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Tổng:',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold, height: 0)),
                  Container(
                    alignment: Alignment.center,
                    width: 142.0,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(NumberHelper.formatPrice(orderItemProvider.totalPrice),
                        style: TextStyle(
                            color: Colors.orange.shade700, fontSize: 24, fontWeight: FontWeight.bold, height: 0)),
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
