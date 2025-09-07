# F256 SuperBASIC Trigonometry (Foenix F256K2)

**trig.bas**

This F256 SuperBASIC program calculates **sine**, **cosine**, and **tangent** for any input angle in **degrees** on the Foenix F256K2.

It uses:
- **Quadrant reduction** to fold any angle into the **first quadrant** (`0°–90°`),
- A truncated **Taylor series** for `sin(x)` (up to the x⁷ term),
- Complementary-angle identities to derive `cos(x)`,
- A simple ratio to compute `tan(x)`.

How it works:

1. **Input**
   - The program asks for an angle in degrees.

3. **Quadrant reduction**
   - Angles are reduced by subtracting 90° repeatedly until they fall within 0–90°.

5. **Series expansion**
   - Uses sin(x) ≈ x − x³/3! + x⁵/5! − x⁷/7! with x in radians.

4. **Cosine calculation**
   - Derived from the complementary angle (cos θ = sin(90°−θ)), with sign adjustments by quadrant.

6. **Tangent**
   - Computed as sin / cos.

**apop4.bas**

This F256 SuperBASIC program calculates **sine** and **cosine** values for any input angle (with up to two decimal places in degrees) using **lookup tables (LUTs)** and trigonometric relations.  
It is designed for the **Foenix F256K2** computer and demonstrates efficient trigonometric calculations without heavy computation.

How it works:

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

**cordic8.bas**

This F256 SuperBASIC program calculates **sine**, **cosine**, and **tangent** for any input angle in **degrees (with five decimals)** on the **Foenix F256K2**.

It uses the **CORDIC algorithm** (Coordinate Rotation Digital Computer), implemented with **lookup tables (LUTs)** for efficiency.

How it works:

1. **Precomputed tables**  
   - `tan#(25)` contains tangent values of the CORDIC rotation angles.  
   - `arctan#(25)` contains the corresponding arctangent angles in **degrees**.  
   - `cos#(25)` contains scaling (cosine) factors used to normalize the final result.  

2. **Quadrant reduction**  
   - Any input angle `d#` is reduced into the first quadrant (`0°–90°`).  
   - A quadrant flag (1–4) is stored so the correct **signs** can be applied to sine/cosine afterwards.  

3. **CORDIC iteration**  
   - Starts with an initial vector `(x, y) = (1, 0)`.  
   - Repeatedly rotates this vector by predefined angles using only additions and multiplications by precomputed tangents.  
   - Accumulates the scaling factor `k#` from the cosine LUT.  
   - Converges toward the requested angle with 25 iterations.  

4. **Final normalization**  
   - After iterations, `x` and `y` are scaled by `k#`.  
   - Results:  
     - `sine#  = y`  
     - `cosine# = x`  
     - `tan# = sine# / cosine#`  
   - Signs are adjusted based on the original quadrant.
