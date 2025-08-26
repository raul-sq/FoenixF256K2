# F256 SuperBASIC Trigonometry (Foenix F256K2)

**trig.bas**

This F256 SuperBASIC program calculates **sine**, **cosine**, and **tangent** for any input angle in **degrees** on the Foenix F256K2.

It uses:
- **Quadrant reduction** to fold any angle into the **first quadrant** (`0°–90°`),
- A truncated **Taylor series** for `sin(x)` (up to the x⁷ term),
- Complementary-angle identities to derive `cos(x)`,
- A simple ratio to compute `tan(x)`.

How it Works:

Input: The program asks for an angle in degrees.

Quadrant reduction: Angles are reduced by subtracting 90° repeatedly until they fall within 0–90°.

Series expansion:

Uses sin(x) ≈ x − x³/3! + x⁵/5! − x⁷/7! with x in radians.

Cosine calculation: Derived from the complementary angle (cos θ = sin(90°−θ)), with sign adjustments by quadrant.

Tangent: Computed as sin / cos.

**apop4.bas**

This F256 SuperBASIC program calculates **sine** and **cosine** values for any input angle (with up to two decimal places in degrees) using **lookup tables (LUTs)** and trigonometric relations.  
It is designed for the **Foenix F256K2** computer and demonstrates efficient trigonometric calculations without heavy computation.

How it Works:

1. **Precomputed tables**  
   - `trig#(2,91)` contains sine and cosine values from 0° to 90° in steps of 1°.  
   - `dec#(2,99)` contains small incremental values for fractional degrees (0.01° to 0.99°).  

2. **Quadrant reduction**  
   - Any input angle `d#` is mapped into the first quadrant `[0°, 90°]`.  
   - The quadrant number is tracked so correct signs can be applied afterwards.  

3. **Trigonometric relations**  
   - Integer part of the angle → base sine/cosine values from the main LUT.  
   - Fractional part (two decimals) → fine adjustment from the incremental LUT.  
   - Formula used ([see here](https://stackoverflow.com/questions/1164492/sine-table-interpolation#1164638)):  
     ```
     sine  = sin_base * cos_frac + cos_base * sin_frac
     cosine = cos_base * cos_frac - sin_base * sin_frac
     ```

4. **Quadrant sign correction**  
   - Adjusts `sin` and `cos` signs according to the quadrant (I–IV).  

