.data
a:.word 0x0000000f
b:.word 0x0000000f
res:.zero 16
str: .string "Invalid input"
.text
la x1,a
la x2,b
la x3,res
lw x4,0(x1) #x4=a
lw x5,0(x2) # x5=b
andi x1,x4,0xfffffff0
bne x1,x0,error
andi x1,x5,0xfffffff0
bne x1,x0,error
andi x1,x4,0x00000001 #x1=a0
andi x2,x5,0x00000001 #x2=b0
and x8,x1,x2 #x8=a0b0
#sw x8,0(x3) #storing p0
andi x6,x4,0x00000002
srli x6,x6,1 #x6=a1
andi x7,x5,0x00000002
srli x7,x7,1 #x7=b1
and x9,x6,x2 # x9=a1b0
and x10,x1,x7 # x10=a0b1
add x9,x9,x10 # x9=a1b0+a0b1
andi x10,x9,0x00000001 # x10=p1
slli x10,x10,1
or x8,x8,x10 # combing prev bit
#sw x8,0(x3) #storing p1p0
andi x9,x9,0x00000002 #getting 1 bit carry of half adder
srli x9,x9,1 #x9=c1
andi x10,x4,0x00000004
srli x10,x10,2 # x10=a2
andi x11,x5,0x00000004
srli x11,x11,2 # x11=b2
and x12,x10,x2 # x12=a2b0
and x13,x6,x7 # x13=a1b1
add x12,x12,x13 #x12=a2b0+a1b1
add x12,x12,x9 #x12=a2b0+a1b1+c1
andi x9,x12,0x00000002
srli x9,x9,1 #x9=c1
andi x12,x12,0x00000001 # taking just sum part of the addition
and x13,x1,x11 # x13=a0b2
add x12,x12,x13
andi x13,x12,0x00000002
srli x13,x13,1 # x13=c2
andi x12,x12,0x00000001 # x12=p2, retaining only sum bit
slli x12,x12,2
or x8,x8,x12
#sw x8,0(x3) #x8=p2p1p0
andi x12,x4,0x00000008
srli x12,x12,3 # x12=a3
andi x14,x5,0x00000008
srli x14,x14,3 # x14=b3
and x15,x12,x2 # x15=a3b0
and x16,x10,x7 # x16=a2b1
add x15,x15,x16 # x15=a3b0+a2b1
add x15,x15,x9 # x15=a3b0+a2b1+c1
andi x9,x15,0x00000002
srli x9,x9,1 # x9=c1
andi x15,x15,0x00000001 # retaining only sum bit
and x16,x6,x11 # x16=a1b2
add x15,x15,x16 # x15=a3b0+a2b1+a1b2
add x15,x15,x13 # x15=a3b0+a2b1+a1b2+c2
andi x13,x15,0x00000002
srli x13,x13,1 #x13=c2
andi x15,x15,0x00000001 # retaining only the sum bit
and x16,x1,x14 # x16=a0b3
add x15,x15,x16 # x15=a3b0+a2b1+a1b2+a0b3
andi x16,x15,0x00000002
srli x16,x16,1 # x16=c3
andi x15,x15,0x00000001 # x15=p3
slli x15,x15,3
or x8,x8,x15
#sw x8,0(x3) #x8=p3p2p1p0
and x15,x12,x7 #a3b1
add x15,x15,x9 #a3b1+c1
add x15,x15,x13 #a3b1+c1+c2
andi x9,x15,0x00000002
srli x9,x9,0x00000001 #c1
andi x15,x15,0x00000001
and x17,x10,x11 #a2b2
add x15,x15,x17 #a3b1+c1+c2+a2b2
add x15,x15,x16 #a3b1+c1+c2+a2b2+c3
andi x13,x15,0x00000002
srli x13,x13,1 #c2
andi x15,x15,0x00000001
and x17,x6,x14 #a1b3
add x15,x15,x17 #a3b1+c1+c2+a2b2+c3+a1b3
andi x16,x15,0x00000002
srli x16,x16,1 #c3
andi x15,x15,0x00000001 #p4
slli x15,x15,4
or x8,x8,x15
#sw x8,0(x3) #p4p3p2p1p0
and x15,x12,x11 #a3b2
add x15,x15,x9 #a3b2+c1
add x15,x15,x13 #a3b2+c1+c2
andi x9,x15,0x00000002
srli x9,x9,1 #c1
andi x15,x15,0x00000001
and x17,x10,x14 #a2b3
add x15,x15,x17 #a3b2+c1+c2+a2b3
add x15,x15,x16 #a3b2+c1+c2+a2b3+c3
andi x13,x15,0x00000002
srli x13,x13,1 #c2
andi x15,x15,0x00000001 #p5
slli x15,x15,5
or x8,x8,x15
#sw x8,0(x3) #p5p4p3p2p1p0
and x15,x12,x14 #a3b3
add x15,x15,x9 #a3b3+c1
add x15,x15,x13 #a3b3+c1+c2
andi x9,x15,0x00000002
srli x9,x9,1 #p7
andi x15,x15,0x00000001
slli x15,x15,6 #p6
or x8,x8,x15
sw x8,0(x3) #p6p5p4p3p2p1p0
slli x9,x9,7
or x8,x8,x9
sw x8,0(x3) #p7p6p5p4p3p2p1p0
beq x0,x0,exit
error:li x8,0xffffffff
sw x8,0(x3)
la a0,str
li a7,4
ecall
beq x0,x0,exit2
exit:
add a0,x0,x4
li a7,1
ecall
addi a0,x0,42
li a7,11
ecall
add a0,x0,x5
li a7,1
ecall
addi a0,x0,61
li a7,11
ecall
add a0,x0,x8
li a7,1
ecall
exit2:nop
