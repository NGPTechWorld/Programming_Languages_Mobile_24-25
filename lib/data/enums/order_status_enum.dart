enum OrderStatusEnum {
  pending,    // 1
  delivering, // 2
  completed,  // 3
  rejected,   // 4
  cancelled   // 5
}

const Map<OrderStatusEnum, int> statusID = {
  OrderStatusEnum.pending:    1,
  OrderStatusEnum.delivering: 2,
  OrderStatusEnum.completed:  3,
  OrderStatusEnum.rejected:   4,
  OrderStatusEnum.cancelled:  5
};
