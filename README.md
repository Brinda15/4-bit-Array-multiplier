# 4-bit-Array-multiplier
There are 2 parts to this project. The first is the simulation on LT Spice, which was done starting from making the required logic gates using CMOS logic. The second part included writing assembly language code suited for a single cycle RISC-V processor on the RIPES simulator.

The multiplier circuit is based on the add shift algorithm. The main advantage of the array multiplier is it’s simple in design and regular in shape. In the add shift algorithm first the partial product is calculated using and gates. Then for the summation full adders and half adders are used before which the partial products are shifted according to their bit orders. For a n x n array multiplier, n^2 and gates, n(n-2) full adders and n half adders are used. In a 4x4 array multiplier there are 8 inputs and 8 outputs, and it uses 16 and gates, 8 full adders, and 4 half adders.

Assuming the first number is represented by the bits A3, A2, A1 and A0, and that the second number is represented by the bits B3, B2, B1 and B0. The SOP(Sum Of Product) equations are as follows:

P0 = A0B0

P1 = A0B1 + A1B0

P2 = A0B2 + A1B1 + A2B0

P3 = A0B3 + A1B2 + A2B1 + A3B0

P4 = A1B3 + A2B2 + A3B1

P5 = A3B2 + A2B3

P6 = A3B3

P7 = Cout


![image](https://github.com/Brinda15/4-4-Array-multiplier/assets/113205171/5bfc7e71-d536-4fec-bd33-46ac09bec4e1)

Fig 1. Ciruit diagram of 4 bit array multiplier

![image](https://github.com/Brinda15/4-4-Array-multiplier/assets/113205171/1597a917-60c2-44eb-a187-1c3d89af9bb9)

Fig 2. To find SOP equations

# Applications
•	Arithmetic Operations: Array multipliers are used in arithmetic units of microprocessors and digital signal processors to perform multiplication operations in various computations, such as in floating-point arithmetic, fixed-point arithmetic and integer arithmetic

•	Digital Signal Processing: Array multipliers play a crucial role in DSP applications, such as filtering, convolution, fast Fourier transform , and other signal processing operations

•	Graphics Processing: These operations involve multiplication of pixel values, vectors, and matrices, and array multipliers are used to accelerate these computations for real-time graphics rendering

•	Cryptography: Array multipliers are used to perform the high-speed multiplication required in cryptographic operations, which are critical for secure communication and data protection in various applications, including secure communications, financial transactions, and data storage
