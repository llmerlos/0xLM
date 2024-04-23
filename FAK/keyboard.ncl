let { DirectPinKey, PeripheralSideKey, .. } = import "fak/keyboard.ncl" in
let { CH559L, .. } = import "fak/mcus.ncl" in

let side_central = {
  mcu = CH559L,
  split.channel = CH559L.features.uart_30_31,
} in

let side_periph = {
  mcu = CH559L,
  split.channel = CH559L.features.uart_30_31,
  keys = 
    let D = DirectPinKey in
    [
      D 24, D 25, D 27, D 04, D 03, D 02,
      D 22, D 23, D 26, D 05, D 11, D 12,
      D 21, D 20, D 37, D 36, D 35, D 34,
      D 15, D 14, D 13,
    ]
} in

side_central & {
  usb_dev = {
    vendor_id = 5824,
    product_id = 10203,
    product_ver = 2,
  },
  split.peripheral = side_periph,
  keys =
    let D = DirectPinKey in
    let S = PeripheralSideKey in
    [
      D 24, D 25, D 27, D 04, D 03, D 02,     S  0, S  1, S  2, S  3, S  4, S  5,
      D 22, D 23, D 26, D 05, D 11, D 12,     S  6, S  7, S  8, S  9, S 10, S 11,
      D 21, D 20, D 37, D 36, D 35, D 34,     S 12, S 13, S 14, S 15, S 16, S 17,
                        D 15, D 14, D 13,     S 20, S 19, S 18, 
    ]
}
