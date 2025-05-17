    .global _main
    .text

_main:
    stp     x29, x30, [sp, -16]!
    mov     x0, 5
    mov     x1, 10

    cmp     x0, x1
    ble     1f
    adrp    x0, T@GOTPAGE          ; Load GOT page address
    ldr     x0, [x0, T@GOTPAGEOFF] ; Load actual address from GOT
    bl      _puts
    b       2f

1:
    adrp    x0, F@GOTPAGE          ; Load GOT page address
    ldr     x0, [x0, F@GOTPAGEOFF] ; Load actual address from GOT
    bl      _puts

2:  ldp     x29, x30, [sp], 16
    mov     x0, xzr
    ret

    .data
F:  .asciz  "FALSE"
T:  .asciz  "TRUE"

    .end
